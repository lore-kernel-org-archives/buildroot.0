Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F829C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 09:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0591260B3A;
	Wed, 27 Jul 2022 09:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0591260B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3xOltRgtUTwY; Wed, 27 Jul 2022 09:27:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A25360B44;
	Wed, 27 Jul 2022 09:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A25360B44
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C962B1BF9D1
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3C5060B44
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3C5060B44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qSfdStN5pbhw for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 09:27:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF70B60B42
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF70B60B42
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1BD3C864E8; Wed, 27 Jul 2022 09:13:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 11:11:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e050a8849b74636682913f6ad57b0b052c0bb51
X-Git-Newrev: 9f81decf46c8ec04b87de5ee9e1c9718d66dee01
X-Patchwork-Hint: ignore
Message-Id: <20220727091332.1BD3C864E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-custom: remove mentions of
 eglibc
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9f81decf46c8ec04b87de5ee9e1c9718d66dee01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

eglibc is a thing of the past, stop mentioning it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external-custom/Config.in.options                | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index efd475a182..6727778f42 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -385,17 +385,11 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 	  C library.
 
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
-	bool "glibc/eglibc"
+	bool "glibc"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	help
 	  Select this option if your external toolchain uses the GNU C
-	  library (available from https://www.gnu.org/software/libc/)
-	  or its variant the eglibc library (http://www.eglibc.org/).
-
-	  Note: eglibc is a variant of glibc that (among other things)
-	  can be configured to exclude some of its features. Using a
-	  toolchain with eglibc configured to exclude key features may
-	  cause build failures to some packages.
+	  library (available from https://www.gnu.org/software/libc/).
 
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL
 	bool "musl (experimental)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
