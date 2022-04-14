Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15586C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF2FA404E5;
	Thu, 14 Apr 2022 19:45:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oT2uurcOF7Qb; Thu, 14 Apr 2022 19:45:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D68D940A0F;
	Thu, 14 Apr 2022 19:45:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D03301BF290
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEB3460F8D
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:45:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fufRBx_wnXsR for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:45:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CF9B60ACE
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:45:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C5DEE83CAC; Thu, 14 Apr 2022 19:36:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 21:37:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f909dce3b0979bc2de54fd848ded3dc4a6c417e8
X-Git-Newrev: 2448ad26876564f480afc8c7c968fc44666decb3
X-Patchwork-Hint: ignore
Message-Id: <20220414193600.C5DEE83CAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.powerpc: Add
 BR2_POWERPC_CPU_HAS_VSX
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2448ad26876564f480afc8c7c968fc44666decb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introduced to allow VSX to be selectively enabled for packages that
support it. Initially used by libnss.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 arch/Config.in.powerpc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 4a39cfee70..272f66f4e7 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -1,6 +1,9 @@
 config BR2_POWERPC_CPU_HAS_ALTIVEC
 	bool
 
+config BR2_POWERPC_CPU_HAS_VSX
+	bool
+
 config BR2_POWERPC_CPU_HAS_SPE
 	bool
 
@@ -123,9 +126,11 @@ config BR2_powerpc_power6
 config BR2_powerpc_power7
 	bool "power7"
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
+	select BR2_POWERPC_CPU_HAS_VSX
 config BR2_powerpc_power8
 	bool "power8"
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
+	select BR2_POWERPC_CPU_HAS_VSX
 endchoice
 
 choice
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
