From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Aug 2019 23:02:10 +0200
Subject: [Buildroot] [git commit] package/libcpprestsdk: install to staging
Message-ID: <20190813205906.CF6A78CA22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d1586109e5b3f4a6056f6108d182f928b7e038e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcpprestsdk is a library so it makes sense to install it in
staging even if no current package is using it for now

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=11936

Signed-off-by: Hein Gustavsen <hein.gustavsen@miros-group.com>

[Retrieved (and slightly update commit message) from:
https://bugs.buildroot.org/show_bug.cgi?id=11936]
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcpprestsdk/libcpprestsdk.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
index 81a8bf71f4..8b9c7d4da7 100644
--- a/package/libcpprestsdk/libcpprestsdk.mk
+++ b/package/libcpprestsdk/libcpprestsdk.mk
@@ -9,6 +9,7 @@ LIBCPPRESTSDK_SITE = $(call github,Microsoft,cpprestsdk,v$(LIBCPPRESTSDK_VERSION
 LIBCPPRESTSDK_LICENSE = MIT
 LIBCPPRESTSDK_LICENSE_FILES = license.txt
 LIBCPPRESTSDK_SUBDIR = Release
+LIBCPPRESTSDK_INSTALL_STAGING = YES
 LIBCPPRESTSDK_DEPENDENCIES += host-pkgconf boost openssl zlib
 LIBCPPRESTSDK_CONF_OPTS = -DWERROR=OFF -DBUILD_SAMPLES=OFF
 
