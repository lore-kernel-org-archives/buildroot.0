Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9976ECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 20:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 482DA812F1;
	Tue, 30 Aug 2022 20:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 482DA812F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SILFxkD8JvT9; Tue, 30 Aug 2022 20:38:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 795D881BD6;
	Tue, 30 Aug 2022 20:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 795D881BD6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 751441BF4E6
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 20:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DDEA81CC3
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 20:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DDEA81CC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lRRqXzu8Kk0y for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 20:38:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A380481BD6
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 20:38:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A380481BD6
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 718CE8819D; Tue, 30 Aug 2022 20:23:18 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 22:37:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4b4b19a9a0384713933b29a03138b4ce32dbfb60
X-Git-Newrev: 4fbce4ea35a0c86313f11200f9496878f8a45d73
X-Patchwork-Hint: ignore
Message-Id: <20220830202318.718CE8819D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] arch/Config.in.powerpc: VSX
 implies altivec
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

commit: https://git.buildroot.net/buildroot/commit/?id=4fbce4ea35a0c86313f11200f9496878f8a45d73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As spotted by Yann E. Morin in
https://patchwork.ozlabs.org/project/buildroot/patch/20220823212219.5066-1-fontaine.fabrice@gmail.com,
VSX is an extension to AltiVec:
https://en.wikipedia.org/wiki/AltiVec#VSX_(Vector_Scalar_Extension)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 arch/Config.in.powerpc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index c48edd3bb4..9fa0be0d73 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -3,6 +3,7 @@ config BR2_POWERPC_CPU_HAS_ALTIVEC
 
 config BR2_POWERPC_CPU_HAS_VSX
 	bool
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
 
 config BR2_POWERPC_CPU_HAS_SPE
 	bool
@@ -135,11 +136,9 @@ config BR2_powerpc_power6
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_power7
 	bool "power7"
-	select BR2_POWERPC_CPU_HAS_ALTIVEC
 	select BR2_POWERPC_CPU_HAS_VSX
 config BR2_powerpc_power8
 	bool "power8"
-	select BR2_POWERPC_CPU_HAS_ALTIVEC
 	select BR2_POWERPC_CPU_HAS_VSX
 endchoice
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
