From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 18 Apr 2018 23:13:30 +0200
Subject: [Buildroot] [PATCH] package/libcec: disable build infos
Message-ID: <20180418211330.13594-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build infos can break the build due to missing terminating " character.

Fixes:
http://autobuild.buildroot.net/results/3b1/3b1182783fc958dfed96c6b1c097993662fc7308

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libcec/libcec.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 6d14447958..99d1c8b2ba 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -37,4 +37,11 @@ ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
 LIBCEC_DEPENDENCIES += xlib_libXrandr
 endif
 
+# Disable information about how libCEC is compiled.
+LIBCEC_CONF_OPTS += -DHAVE_GIT_BIN="" \
+	-DHAVE_DATE_BIN="" \
+	-DHAVE_WHOAMI_BIN="" \
+	-DHAVE_HOSTNAME_BIN="" \
+	-DHAVE_UNAME_BIN=""
+
 $(eval $(cmake-package))
-- 
2.14.3
