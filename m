Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4882EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 21:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A26960D64;
	Tue, 18 Jul 2023 21:12:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A26960D64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7aWeU5jxDKet; Tue, 18 Jul 2023 21:12:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 777D360C20;
	Tue, 18 Jul 2023 21:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 777D360C20
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 622171BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48BFA81F77
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48BFA81F77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y86RG8XG2mTW for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 21:12:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 183438132F
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 21:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 183438132F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0587A87430; Tue, 18 Jul 2023 21:12:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 23:12:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 902e4fbcf27b84f6c1bec7a62b20628f60abdd01
X-Git-Newrev: 10f40a6b0c58a10f00d6a9b44fc76aea756e6036
X-Patchwork-Hint: ignore
Message-Id: <20230718211219.0587A87430@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuradio: bump version to 3.10.7.0
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
Content-Type: multipart/mixed; boundary="===============5380020913610109754=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5380020913610109754==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=10f40a6b0c58a10f00d6a9b44fc76aea756e6036
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed all patches, they are included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  2 --
 ...luding-missing-vector-in-blockinterleaver.patch | 42 ----------------------
 ...kinterleaving.h-add-missing-cstddef-heade.patch | 33 -----------------
 package/gnuradio/gnuradio.hash                     |  2 +-
 package/gnuradio/gnuradio.mk                       |  2 +-
 5 files changed, 2 insertions(+), 79 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index eae64e19ff..6a0bac3c00 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -558,8 +558,6 @@ package/gmp/0001-mpz-inp_raw.c-Avoid-bit-size-overflows.patch Upstream
 package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch Upstream
 package/gnupg/0001-build-Always-use-EXTERN_UNLESS_MAIN_MODULE-pattern.patch Upstream
 package/gnuplot/0001-configure-add-without-demo-option.patch Upstream
-package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch Upstream
-package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch Upstream
 package/go/0001-build.go-explicit-option-for-crosscompilation.patch Upstream
 package/gob2/0001-dont-include-from-prefix.patch Upstream
 package/gobject-introspection/0001-disable-tests.patch Upstream
diff --git a/package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch b/package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch
deleted file mode 100644
index 39b8c0b51e..0000000000
--- a/package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 45fe4ac55ad88b6793d225e676205c30388ec138 Mon Sep 17 00:00:00 2001
-From: Ryan Volz <ryan.volz@gmail.com>
-Date: Fri, 16 Sep 2022 21:05:51 -0400
-Subject: [PATCH] blocks: Including missing <vector> in blockinterleaver.
-
-Signed-off-by: Ryan Volz <ryan.volz@gmail.com>
-[Retrieved (and backported) from:
-https://github.com/gnuradio/gnuradio/commit/463c3477549b26b32d9b73eef30044e97c4eee64]
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- gr-blocks/include/gnuradio/blocks/blockinterleaving.h | 2 +-
- gr-blocks/lib/blockinterleaving.cc                    | 1 +
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/gr-blocks/include/gnuradio/blocks/blockinterleaving.h b/gr-blocks/include/gnuradio/blocks/blockinterleaving.h
-index 9d4e0f249..df831fe5a 100644
---- a/gr-blocks/include/gnuradio/blocks/blockinterleaving.h
-+++ b/gr-blocks/include/gnuradio/blocks/blockinterleaving.h
-@@ -12,7 +12,7 @@
- #define INCLUDED_GR_BLOCKS_BLOCKINTERLEAVING_H
- 
- #include <gnuradio/blocks/api.h>
--
-+#include <vector>
- 
- namespace gr {
- namespace blocks {
-diff --git a/gr-blocks/lib/blockinterleaving.cc b/gr-blocks/lib/blockinterleaving.cc
-index fc5873e11..768ad9ea7 100644
---- a/gr-blocks/lib/blockinterleaving.cc
-+++ b/gr-blocks/lib/blockinterleaving.cc
-@@ -12,6 +12,7 @@
- #include <spdlog/fmt/fmt.h>
- #include <algorithm>
- #include <numeric>
-+#include <vector>
- 
- namespace gr {
- namespace blocks {
--- 
-2.35.1
-
diff --git a/package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch b/package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch
deleted file mode 100644
index f1ad77580f..0000000000
--- a/package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 901c2ad1ac88908a2e6db5615d5af39a218d826d Mon Sep 17 00:00:00 2001
-From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
-Date: Fri, 23 Sep 2022 08:41:26 +0200
-Subject: [PATCH] blocks/blockinterleaving.h: add missing cstddef header
- (required for size_t)
-
-Fix build failure like:
-
-gnuradio/gr-blocks/lib/../include/gnuradio/blocks/blockinterleaving.h:25:36: error: ‘size_t’ was not declared in this scope
-
-This failure is due to the miss of cstddef include
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
-[Upstream status: https://github.com/gnuradio/gnuradio/pull/6188]
----
- gr-blocks/include/gnuradio/blocks/blockinterleaving.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gr-blocks/include/gnuradio/blocks/blockinterleaving.h b/gr-blocks/include/gnuradio/blocks/blockinterleaving.h
-index df831fe5a..33c59e35b 100644
---- a/gr-blocks/include/gnuradio/blocks/blockinterleaving.h
-+++ b/gr-blocks/include/gnuradio/blocks/blockinterleaving.h
-@@ -13,6 +13,7 @@
- 
- #include <gnuradio/blocks/api.h>
- #include <vector>
-+#include <cstddef>
- 
- namespace gr {
- namespace blocks {
--- 
-2.35.1
-
diff --git a/package/gnuradio/gnuradio.hash b/package/gnuradio/gnuradio.hash
index efa0bb462b..f41f5a78df 100644
--- a/package/gnuradio/gnuradio.hash
+++ b/package/gnuradio/gnuradio.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c6b9f59447a842559b00b3a67b4ca1186e9adb8db742b25400507fedc747f2bd  gnuradio-3.10.4.0.tar.gz
+sha256  55156650ada130600c70bc2ab38eee718fc1d23011be548471e888399f207ddc  gnuradio-3.10.7.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 1453b78493..85b359088e 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNURADIO_VERSION = 3.10.4.0
+GNURADIO_VERSION = 3.10.7.0
 GNURADIO_SITE = $(call github,gnuradio,gnuradio,v$(GNURADIO_VERSION))
 GNURADIO_LICENSE = GPL-3.0+
 GNURADIO_LICENSE_FILES = COPYING

--===============5380020913610109754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5380020913610109754==--
