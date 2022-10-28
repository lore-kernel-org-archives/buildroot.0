Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B11ECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88B9381499;
	Fri, 28 Oct 2022 06:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88B9381499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id trhDfBVe7aDv; Fri, 28 Oct 2022 06:55:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CB2E8142E;
	Fri, 28 Oct 2022 06:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CB2E8142E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 71F711BF9AC
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AB8540133
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AB8540133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F6h-AfG02MrS for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:55:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A80E400D0
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A80E400D0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68E67873D5; Fri, 28 Oct 2022 06:55:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 08:53:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae29bb28808dbafd39d39e850820b3f063329f66
X-Git-Newrev: 1f54af8c4f814bfc0993756b82575ad581ce5318
X-Patchwork-Hint: ignore
Message-Id: <20221028065507.68E67873D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lz4: bump to version 1.9.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f54af8c4f814bfc0993756b82575ad581ce5318
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LZ4 v1.9.4 is a maintenance release, featuring a substantial amount
(~350 commits) of minor fixes and improvements, making it a recommended
upgrade. The stable portion of liblz4 API is unmodified, making this
release a drop-in replacement for existing features.

- Drop patch (already in version)
- Update hash of lib/LICENSE (update in year with
  https://github.com/lz4/lz4/commit/87a80acbe7872b9da7d56f7005ffd1b715e87c93)

https://github.com/lz4/lz4/releases/tag/v1.9.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...al-memory-corruption-with-negative-memmov.patch | 26 ----------------------
 package/lz4/lz4.hash                               |  4 ++--
 package/lz4/lz4.mk                                 |  5 +----
 3 files changed, 3 insertions(+), 32 deletions(-)

diff --git a/package/lz4/0001-Fix-potential-memory-corruption-with-negative-memmov.patch b/package/lz4/0001-Fix-potential-memory-corruption-with-negative-memmov.patch
deleted file mode 100644
index 57e4e38f84..0000000000
--- a/package/lz4/0001-Fix-potential-memory-corruption-with-negative-memmov.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 8301a21773ef61656225e264f4f06ae14462bca7 Mon Sep 17 00:00:00 2001
-From: Jasper Lievisse Adriaanse <j@jasper.la>
-Date: Fri, 26 Feb 2021 15:21:20 +0100
-Subject: [PATCH] Fix potential memory corruption with negative memmove() size
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- lib/lz4.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/lz4.c b/lib/lz4.c
-index 5f524d0..c2f504e 100644
---- a/lib/lz4.c
-+++ b/lib/lz4.c
-@@ -1749,7 +1749,7 @@ LZ4_decompress_generic(
-                  const size_t dictSize         /* note : = 0 if noDict */
-                  )
- {
--    if (src == NULL) { return -1; }
-+    if ((src == NULL) || (outputSize < 0)) { return -1; }
- 
-     {   const BYTE* ip = (const BYTE*) src;
-         const BYTE* const iend = ip + srcSize;
--- 
-2.20.1
-
diff --git a/package/lz4/lz4.hash b/package/lz4/lz4.hash
index 0b03089ecd..04bd118cfe 100644
--- a/package/lz4/lz4.hash
+++ b/package/lz4/lz4.hash
@@ -1,4 +1,4 @@
 # sha256 locally computed
-sha256  030644df4611007ff7dc962d981f390361e6c97a34e5cbc393ddfbe019ffe2c1  lz4-1.9.3.tar.gz
-sha256  d15d99c8dc6b0ec22174c0e563a95bc40f9363ca7f9d9d793bb5c5a8e8d0af71  lib/LICENSE
+sha256  0b0e3aa07c8c063ddf40b082bdf7e37a1562bda40a0ff5272957f3e987e0e54b  lz4-1.9.4.tar.gz
+sha256  8b58c446121a109ccf32edc094bba3010a3d85e4ee3702950db55e4d3e87736c  lib/LICENSE
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  programs/COPYING
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index 541a03473a..5da1ae2703 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-LZ4_VERSION = 1.9.3
+LZ4_VERSION = 1.9.4
 LZ4_SITE = $(call github,lz4,lz4,v$(LZ4_VERSION))
 LZ4_INSTALL_STAGING = YES
 LZ4_LICENSE = BSD-2-Clause (library), GPL-2.0+ (programs)
 LZ4_LICENSE_FILES = lib/LICENSE programs/COPYING
 LZ4_CPE_ID_VENDOR = lz4_project
 
-# 0001-Fix-potential-memory-corruption-with-negative-memmov.patch
-LZ4_IGNORE_CVES += CVE-2021-3520
-
 ifeq ($(BR2_STATIC_LIBS),y)
 LZ4_MAKE_OPTS += BUILD_SHARED=no
 else ifeq ($(BR2_SHARED_LIBS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
