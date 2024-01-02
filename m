Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C00C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 08:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C49C40564;
	Tue,  2 Jan 2024 08:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C49C40564
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 47UIpBLW5unC; Tue,  2 Jan 2024 08:56:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 226B740931;
	Tue,  2 Jan 2024 08:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 226B740931
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15C7C1BF5A6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E251140424
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E251140424
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xUyBejwsZWql for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 08:55:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 727E040360
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 08:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 727E040360
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6123183C28; Tue,  2 Jan 2024 08:55:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 09:54:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0db3c08daf335571a2b2d18a16d8980ddf4567ab
X-Git-Newrev: de8256e3f823307a65494decca8b1cd152819af6
X-Patchwork-Hint: ignore
Message-Id: <20240102085518.6123183C28@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libjxl: bump to version 0.9.0
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
Content-Type: multipart/mixed; boundary="===============1829512253413758726=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1829512253413758726==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=de8256e3f823307a65494decca8b1cd152819af6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop first patch (not needed since
  https://github.com/libjxl/libjxl/commit/c3a4f9ca89ae59c6265a2f1bf2a6d2a87a71fc16)
- Drop second patch (already in version)
- Add JPEGXL_ENABLE_JPEGLI=OFF:
  https://github.com/libjxl/libjxl/issues/3069

https://github.com/libjxl/libjxl/releases/tag/v0.9.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...-segmentation-fault-when-JPEG-is-disabled.patch | 44 --------------------
 ...-atomic-content-to-fix-gcc-compilation-fo.patch | 47 ----------------------
 package/libjxl/libjxl.hash                         |  2 +-
 package/libjxl/libjxl.mk                           |  3 +-
 5 files changed, 3 insertions(+), 94 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2348f7ec52..aa8a6abc4f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -661,7 +661,6 @@ package/libiio/S99iiod Shellcheck Variables
 package/libiqrf/0001-cmake-handle-static-library-and-find-required-thread.patch Upstream
 package/libiqrf/0002-use-only-c-language.patch Upstream
 package/libjson/0001-fix-broken-makefile.patch Upstream
-package/libjxl/0001-djxl-fix-segmentation-fault-when-JPEG-is-disabled.patch Upstream
 package/libkcapi/0001-lib-kcapi-kernel-if.c-fix-uclibc-build.patch Upstream
 package/libkcapi/0002-Add-disable-werror.patch Upstream
 package/libkcapi/0003-Fix-symver-build-error-on-non-ELF-platforms.patch Upstream
diff --git a/package/libjxl/0001-djxl-fix-segmentation-fault-when-JPEG-is-disabled.patch b/package/libjxl/0001-djxl-fix-segmentation-fault-when-JPEG-is-disabled.patch
deleted file mode 100644
index 3d709c956b..0000000000
--- a/package/libjxl/0001-djxl-fix-segmentation-fault-when-JPEG-is-disabled.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 504f35c8204248ae6f97278e8b7c6cc5853a1b94 Mon Sep 17 00:00:00 2001
-From: Julien Olivain <ju.o@free.fr>
-Date: Fri, 10 Feb 2023 21:31:30 +0100
-Subject: [PATCH] djxl: fix segmentation fault when JPEG is disabled
-
-When libjxl is compiled without JPEG support, by configuring for example
-with:
-
-    cmake -DCMAKE_DISABLE_FIND_PACKAGE_JPEG=TRUE ...
-
-djxl crashes with a segmentation fault at:
-https://github.com/libjxl/libjxl/blob/v0.8.1/tools/djxl_main.cc#L367
-
-The crash can be reproduced with the sequence:
-
-    gm convert IMAGE:LOGO ref.ppm
-    cjxl ref.ppm enc.jxl
-    djxl enc.jxl dec.ppm
-
-The crash happen because opt_jpeg_quality_id does not get
-initialized at:
-https://github.com/libjxl/libjxl/blob/v0.8.1/tools/djxl_main.cc#L107
-
-This commit fixes the crash by adding a test on opt_jpeg_quality_id.
-
-Signed-off-by: Julien Olivain <ju.o@free.fr>
-[Retrieved from:
-https://github.com/libjxl/libjxl/pull/2178/commits/504f35c8204248ae6f97278e8b7c6cc5853a1b94]
----
- tools/djxl_main.cc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tools/djxl_main.cc b/tools/djxl_main.cc
-index b755301fcb..42b889e7ce 100644
---- a/tools/djxl_main.cc
-+++ b/tools/djxl_main.cc
-@@ -370,6 +370,7 @@ int main(int argc, const char* argv[]) {
-     args.color_space = force_colorspace;
-   }
-   if (codec == jxl::extras::Codec::kPNM && extension != ".pfm" &&
-+      args.opt_jpeg_quality_id != -1 &&
-       !cmdline.GetOption(args.opt_jpeg_quality_id)->matched()) {
-     args.bits_per_sample = 0;
-   }
diff --git a/package/libjxl/0002-Add-missing-atomic-content-to-fix-gcc-compilation-fo.patch b/package/libjxl/0002-Add-missing-atomic-content-to-fix-gcc-compilation-fo.patch
deleted file mode 100644
index b856b00728..0000000000
--- a/package/libjxl/0002-Add-missing-atomic-content-to-fix-gcc-compilation-fo.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 42e944a471672dae8522fbcf161941895ba16632 Mon Sep 17 00:00:00 2001
-From: Eastdong <31920925+IEAST@users.noreply.github.com>
-Date: Thu, 23 Feb 2023 06:08:36 +0800
-Subject: [PATCH] Add missing <atomic> content to fix gcc compilation for RISCV
- architecture. (#2211)
-
-* Add missing <atomic> content to fix gcc compilation for RISCV architecture.
-
-* add name to AUTHORS
-
-* lint fix
-
-Co-authored-by: Moritz Firsching <firsching@google.com>
-Upstream: https://github.com/libjxl/libjxl/commit/22d12d74e7bc56b09cfb1973aa89ec8d714fa3fc
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- AUTHORS            | 1 +
- lib/jxl/enc_xyb.cc | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/AUTHORS b/AUTHORS
-index 44dcc409..3340422d 100644
---- a/AUTHORS
-+++ b/AUTHORS
-@@ -30,6 +30,7 @@ Daniel Novomeský <dnovomesky@gmail.com>
- David Burnett <vargolsoft@gmail.com>
- Dirk Lemstra <dirk@lemstra.org>
- Don Olmstead <don.j.olmstead@gmail.com>
-+Dong Xu <xdong181@gmail.com>
- Even Rouault <even.rouault@spatialys.com>
- Fred Brennan <copypaste@kittens.ph>
- Heiko Becker <heirecka@exherbo.org>
-diff --git a/lib/jxl/enc_xyb.cc b/lib/jxl/enc_xyb.cc
-index c7310765..2fd5d025 100644
---- a/lib/jxl/enc_xyb.cc
-+++ b/lib/jxl/enc_xyb.cc
-@@ -6,6 +6,7 @@
- #include "lib/jxl/enc_xyb.h"
- 
- #include <algorithm>
-+#include <atomic>
- #include <cstdlib>
- 
- #undef HWY_TARGET_INCLUDE
--- 
-2.41.0
-
diff --git a/package/libjxl/libjxl.hash b/package/libjxl/libjxl.hash
index c8f98d10ea..0766c24a53 100644
--- a/package/libjxl/libjxl.hash
+++ b/package/libjxl/libjxl.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  c70916fb3ed43784eb840f82f05d390053a558e2da106e40863919238fa7b420  libjxl-0.8.2.tar.gz
+sha256  d83bbe188d8fa9725bb75109c922c37fcff8c3b802808f3a6c2c14aaf8337d9f  libjxl-0.9.0.tar.gz
 sha256  8405932022a556380c2d8c272eff154a923feb197233f348ce5f7334fb0a5ede  LICENSE
 sha256  91915f8ae056a68a3c5bdf05d9f6f78bb6903e27a8ca3a8434c9e4ac87300575  PATENTS
diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
index 47c110eb53..d2c5e70c98 100644
--- a/package/libjxl/libjxl.mk
+++ b/package/libjxl/libjxl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBJXL_VERSION = 0.8.2
+LIBJXL_VERSION = 0.9.0
 LIBJXL_SITE = $(call github,libjxl,libjxl,v$(LIBJXL_VERSION))
 LIBJXL_LICENSE = BSD-3-Clause
 LIBJXL_LICENSE_FILES = LICENSE PATENTS
@@ -27,6 +27,7 @@ LIBJXL_CONF_OPTS = \
 	-DJPEGXL_ENABLE_DOXYGEN=OFF \
 	-DJPEGXL_ENABLE_EXAMPLES=OFF \
 	-DJPEGXL_ENABLE_JNI=OFF \
+	-DJPEGXL_ENABLE_JPEGLI=OFF \
 	-DJPEGXL_ENABLE_MANPAGES=OFF \
 	-DJPEGXL_ENABLE_OPENEXR=OFF \
 	-DJPEGXL_ENABLE_SJPEG=OFF \

--===============1829512253413758726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1829512253413758726==--
