Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC196C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 21:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93C5682668;
	Sat, 12 Feb 2022 21:53:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oGyhelz-FSoF; Sat, 12 Feb 2022 21:53:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C673E82628;
	Sat, 12 Feb 2022 21:53:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC4791BF4DD
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 21:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99649400AB
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 21:53:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9irG4zt9ZaGY for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 21:52:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9638940022
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 21:52:59 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 653A031E072D; Sat, 12 Feb 2022 22:52:57 +0100 (CET)
Date: Sat, 12 Feb 2022 22:52:57 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <YggsOR0uNxdhINWR@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-10-amd64 x86_64
Subject: [Buildroot] [PATCH 2/3] package/binutils: remove 2.35.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/binutils/Config.in.host | 8 --------
 package/binutils/binutils.hash  | 1 -
 2 files changed, 9 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 17de6e4e41..21b15b5c36 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -16,13 +16,6 @@ config BR2_BINUTILS_VERSION_2_32_X
 	bool "binutils 2.32"
 	depends on !BR2_csky
 
-config BR2_BINUTILS_VERSION_2_35_X
-	bool "binutils 2.35.2"
-	depends on !BR2_csky
-	# https://github.com/uclinux-dev/elf2flt/pull/16
-	# https://github.com/uclinux-dev/elf2flt/issues/12
-	depends on !BR2_BINFMT_FLAT
-
 config BR2_BINUTILS_VERSION_2_36_X
 	bool "binutils 2.36.1"
 	depends on !BR2_csky
@@ -52,7 +45,6 @@ config BR2_BINUTILS_VERSION
 	string
 	default "arc-2020.09-release"	if BR2_BINUTILS_VERSION_ARC
 	default "2.32"		if BR2_BINUTILS_VERSION_2_32_X
-	default "2.35.2"	if BR2_BINUTILS_VERSION_2_35_X
 	default "2.36.1"	if BR2_BINUTILS_VERSION_2_36_X
 	default "2.37"		if BR2_BINUTILS_VERSION_2_37_X
 	default "2.38"		if BR2_BINUTILS_VERSION_2_38_X
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index fe31b34d40..4141e0c5f2 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -1,6 +1,5 @@
 # From ftp://gcc.gnu.org/pub/binutils/releases/sha512.sum
 sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724afa1e43bd0db45cfc9916b41519b67dfce03232aa4978704492a6994a  binutils-2.32.tar.xz
-sha512  9974ede5978d32e0d68fef23da48fa00bd06b0bff7ec45b00ca075c126d6bbe0cf2defc03ecc3f17bc6cc85b64271a13009c4049d7ba17de26e84e3a6e2c0348  binutils-2.35.2.tar.xz
 sha512  cc24590bcead10b90763386b6f96bb027d7594c659c2d95174a6352e8b98465a50ec3e4088d0da038428abe059bbc4ae5f37b269f31a40fc048072c8a234f4e9  binutils-2.36.1.tar.xz
 sha512  5c11aeef6935860a6819ed3a3c93371f052e52b4bdc5033da36037c1544d013b7f12cb8d561ec954fe7469a68f1b66f1a3cd53d5a3af7293635a90d69edd15e7  binutils-2.37.tar.xz
 sha512  8bf0b0d193c9c010e0518ee2b2e5a830898af206510992483b427477ed178396cd210235e85fd7bd99a96fc6d5eedbeccbd48317a10f752b7336ada8b2bb826d  binutils-2.38.tar.xz
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
