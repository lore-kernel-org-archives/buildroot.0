From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Feb 2017 22:37:24 +0100
Subject: [Buildroot] [git commit branch/next] package/libva: project moved
	to github
Message-ID: <20170219214325.AA6A2821E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8557294fd189e27a5a9adc421fbd5006285a0c47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For details read
https://lists.01.org/pipermail/intel-vaapi-media/2017-January/000001.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libva/Config.in  | 2 +-
 package/libva/libva.hash | 4 ++--
 package/libva/libva.mk   | 3 +--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libva/Config.in b/package/libva/Config.in
index 467b9d2..75692f2 100644
--- a/package/libva/Config.in
+++ b/package/libva/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBVA
 	  IDCT, Motion Compensation etc.) for the prevailing coding standards
 	  today (MPEG-2, MPEG-4 ASP/H.263, MPEG-4 AVC/H.264, and VC-1/VMW3).
 
-	  http://www.freedesktop.org/wiki/Software/vaapi/
+	  https://01.org/linuxmedia/vaapi
 
 comment "libva needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index e63f4db..1f248f8 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/libva/2016-November/004730.html
-sha1 18e46f3d5a0e971eb0ec9fe14bc021e69eb13fb8  libva-1.7.3.tar.bz2
+# Locally computed
+sha256 f0f816a725007fbf3c7ed816ff71ba420696bec63ff49045e9b23d9b34ac73c8  libva-1.7.3.tar.gz
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index cf42b70..bce6907 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LIBVA_VERSION = 1.7.3
-LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
-LIBVA_SITE = http://www.freedesktop.org/software/vaapi/releases/libva
+LIBVA_SITE = $(call github,01org,libva,libva-$(LIBVA_VERSION))
 LIBVA_LICENSE = MIT
 LIBVA_LICENSE_FILES = COPYING
 LIBVA_AUTORECONF = YES
