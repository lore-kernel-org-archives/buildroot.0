Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AB7C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 409C74049A;
	Thu, 28 Apr 2022 21:47:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z-AU6B7eQQxF; Thu, 28 Apr 2022 21:47:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A101E4051A;
	Thu, 28 Apr 2022 21:47:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2EE111BF2E4
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D76B81338
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:47:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N_KnDaWXmstC for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:47:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52BBD81331
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:47:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2BA0784717; Thu, 28 Apr 2022 21:36:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 23:45:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 65d78dcfeb8b2eafaebe2d0c3c8c42e7e85f46ac
X-Git-Newrev: 44b9361a2ee0741e1307831e3a66c7a03cafec17
X-Patchwork-Hint: ignore
Message-Id: <20220428213639.2BA0784717@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: re-enable recent
 versions of binutils for FLAT binaries
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

commit: https://git.buildroot.net/buildroot/commit/?id=44b9361a2ee0741e1307831e3a66c7a03cafec17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to the bump of elf2flt to version 2021.08, the issue with
recent versions of binutils has been fixed, so we can re-enable using
the recent binutils versions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/binutils/Config.in.host | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index e639c67149..4382b32237 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -19,21 +19,12 @@ config BR2_BINUTILS_VERSION_2_32_X
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
 
 config BR2_BINUTILS_VERSION_2_38_X
 	bool "binutils 2.38"
-	# https://github.com/uclinux-dev/elf2flt/pull/16
-	# https://github.com/uclinux-dev/elf2flt/issues/12
-	depends on !BR2_BINFMT_FLAT
 
 config BR2_BINUTILS_VERSION_ARC
 	bool "binutils arc (2.34.50)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
