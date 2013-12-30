From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 30 Dec 2013 19:02:49 +0100
Subject: [Buildroot] [PATCH 1/1] taglib: depend on zlib if appropriate
Message-ID: <BLU0-SMTP5968381DB69C5BB04A3EA3D9CE0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/taglib/taglib.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index 75e8e67..c04c88b 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -10,6 +10,10 @@ TAGLIB_INSTALL_STAGING = YES
 TAGLIB_LICENSE = LGPLv2.1 MPL
 TAGLIB_LICENSE_FILES = COPYING.LGPL COPYING.MPL
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+TAGLIB_DEPENDENCIES += zlib
+endif
+
 ifeq ($(BR2_PACKAGE_TAGLIB_ASF),y)
 TAGLIB_CONF_OPT += -DWITH_ASF=ON
 endif
-- 
1.7.9.5
