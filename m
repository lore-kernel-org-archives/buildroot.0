Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAC3C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A79C418D4;
	Wed, 27 Apr 2022 19:00:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0nCpkiSH8cH2; Wed, 27 Apr 2022 19:00:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61F89416E8;
	Wed, 27 Apr 2022 19:00:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12B781BF322
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2997C8315C
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:57:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dgu8wllmrklf for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 18:57:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63A158319F
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 18:57:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CDFC684602; Wed, 27 Apr 2022 18:47:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 20:50:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f698cbc2235a6362399cf76acdf54e0bdb0b4664
X-Git-Newrev: 6063f2378f8fbab296b7aa56cdc8a774e599708b
X-Patchwork-Hint: ignore
Message-Id: <20220427184726.CDFC684602@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-custom: add gcc 12 version
 selection
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

commit: https://git.buildroot.net/buildroot/commit/?id=6063f2378f8fbab296b7aa56cdc8a774e599708b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch allows to use an external toolchain based on gcc 12.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../toolchain-external/toolchain-external-custom/Config.in.options    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 9346fa3feb..683204e56e 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -31,6 +31,10 @@ choice
 	  Set to the gcc version that is used by your external
 	  toolchain.
 
+config BR2_TOOLCHAIN_EXTERNAL_GCC_12
+	bool "12.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+
 config BR2_TOOLCHAIN_EXTERNAL_GCC_11
 	bool "11.x"
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
