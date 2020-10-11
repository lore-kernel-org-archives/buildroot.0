From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Oct 2020 18:10:09 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libhtp: bump to
 version 0.5.35
Message-ID: <20201011160119.0FED9877BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48304cb30dd1534ece792a070f0519555ca4eeb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Drop patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5f5fe7de52d47c9f6940c7b6856d1d8e4765be58)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-htp.pc.in-add-lz-to-Libs.private.patch    | 29 ----------------------
 package/libhtp/libhtp.hash                         |  2 +-
 package/libhtp/libhtp.mk                           |  2 +-
 3 files changed, 2 insertions(+), 31 deletions(-)

diff --git a/package/libhtp/0001-htp.pc.in-add-lz-to-Libs.private.patch b/package/libhtp/0001-htp.pc.in-add-lz-to-Libs.private.patch
deleted file mode 100644
index b21ea6053a..0000000000
--- a/package/libhtp/0001-htp.pc.in-add-lz-to-Libs.private.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 39e534ab696157b244ec226d649c789dcf423e42 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 24 Apr 2019 20:48:57 +0200
-Subject: [PATCH] htp.pc.in: add -lz to Libs.private
-
-zlib is a mandatory dependency so add it to Libs.private otherwise
-static linking of packages linking with htp (e.g. suricata) will fail.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/OISF/libhtp/pull/294]
----
- htp.pc.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/htp.pc.in b/htp.pc.in
-index 2fec995..9b1a6cc 100644
---- a/htp.pc.in
-+++ b/htp.pc.in
-@@ -7,6 +7,6 @@ Name: @PACKAGE_NAME@
- Description: A security-aware HTTP parser, designed for use in IDS/IPS and WAF products.
- Version: @PACKAGE_VERSION@
- Libs: -L${libdir} -lhtp
--Libs.private: @LIBICONV@
-+Libs.private: -lz @LIBICONV@
- Cflags: -I${includedir} -I${libdir}/htp/include
- 
--- 
-2.20.1
-
diff --git a/package/libhtp/libhtp.hash b/package/libhtp/libhtp.hash
index 765acd5bf9..df75336df6 100644
--- a/package/libhtp/libhtp.hash
+++ b/package/libhtp/libhtp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  953651fdfe828805bb82dc1aa8b56187b0e2f80781727343e68ccf8afd6a9122  libhtp-0.5.33.tar.gz
+sha256  4c3ac4c6027710455ffe725f24ac6a83b2c13fe0afc83b74df2cca78ba46976a  libhtp-0.5.35.tar.gz
 sha256  87c93904e5434c81622ea690c2b90097b9f162aaa92a96542649a157dbf98d15  LICENSE
diff --git a/package/libhtp/libhtp.mk b/package/libhtp/libhtp.mk
index b77d8715f9..c402cf750e 100644
--- a/package/libhtp/libhtp.mk
+++ b/package/libhtp/libhtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTP_VERSION = 0.5.33
+LIBHTP_VERSION = 0.5.35
 LIBHTP_SITE = $(call github,OISF,libhtp,$(LIBHTP_VERSION))
 LIBHTP_LICENSE = BSD-3-Clause
 LIBHTP_LICENSE_FILES = LICENSE
