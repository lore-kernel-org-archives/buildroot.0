Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D1BC433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 19:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25CE8429B0;
	Fri, 27 May 2022 19:11:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B9F9TQ1lHMiq; Fri, 27 May 2022 19:11:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A8C3429A3;
	Fri, 27 May 2022 19:11:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0EA261C1162
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 19:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1B89409D3
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 19:11:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BOQT9WviGxnA for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 19:11:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 567CA40580
 for <buildroot@buildroot.org>; Fri, 27 May 2022 19:11:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6E23586682; Fri, 27 May 2022 19:00:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 21:01:08 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e63651aa79ef26e1882ec175b825d34d51f6ed8c
X-Git-Newrev: a5841c18a45cf08146450fd0e0b510a02359253d
X-Patchwork-Hint: ignore
Message-Id: <20220527190009.6E23586682@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/binutils:
 re-enable recent versions of binutils for FLAT binaries
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

commit: https://git.buildroot.net/buildroot/commit/?id=a5841c18a45cf08146450fd0e0b510a02359253d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Thanks to the bump of elf2flt to version 2021.08, the issue with
recent versions of binutils has been fixed, so we can re-enable using
the recent binutils versions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 44b9361a2ee0741e1307831e3a66c7a03cafec17)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index ea1f020989..c3ac7a0cf2 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -19,22 +19,13 @@ config BR2_BINUTILS_VERSION_2_32_X
 config BR2_BINUTILS_VERSION_2_35_X
 	bool "binutils 2.35.2"
 	depends on !BR2_csky
-	# https://github.com/uclinux-dev/elf2flt/pull/16
-	# https://github.com/uclinux-dev/elf2flt/issues/12
-	depends on !BR2_BINFMT_FLAT
 
 config BR2_BINUTILS_VERSION_2_36_X
 	bool "binutils 2.36.1"
 	depends on !BR2_csky
-	# https://github.com/uclinux-dev/elf2flt/pull/16
-	# https://github.com/uclinux-dev/elf2flt/issues/12
-	depends on !BR2_BINFMT_FLAT
 
 config BR2_BINUTILS_VERSION_2_37_X
 	bool "binutils 2.37"
-	# https://github.com/uclinux-dev/elf2flt/pull/16
-	# https://github.com/uclinux-dev/elf2flt/issues/12
-	depends on !BR2_BINFMT_FLAT
 
 config BR2_BINUTILS_VERSION_ARC
 	bool "binutils arc (2.34.50)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
