From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 16:01:53 +0100
Subject: [Buildroot] [git commit] package/openocd: use host-jimtcl for host
 variant
Message-ID: <20191222145255.EAC738D697@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=931cb4d1e13a50282614f470e6c7c2f61dc7179b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will fix a build failure raised by commit
06aa2995350922197c6db0a46e39ac5c37d5a49e which dropped patch on embedded
jimtcl

Fixes:
 - http://autobuild.buildroot.org/results/bd140b5f433d4272f3efd43ff840e13e4301c4db

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/openocd/openocd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 29e4f4b31f..7887f3a6dc 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -97,12 +97,12 @@ HOST_OPENOCD_CONF_OPTS = \
 	--oldincludedir=$(HOST_DIR)/include \
 	--includedir=$(HOST_DIR)/include \
 	--disable-doxygen-html \
-	--with-jim-shared=no \
+	--disable-internal-jimtcl \
 	--disable-shared \
 	--enable-dummy \
 	--disable-werror
 
-HOST_OPENOCD_DEPENDENCIES = host-libftdi host-libusb host-libusb-compat
+HOST_OPENOCD_DEPENDENCIES = host-jimtcl host-libftdi host-libusb host-libusb-compat
 
 # Avoid documentation rebuild. On PowerPC64(le), we patch the
 # configure script. Due to this, the version.texi files gets
