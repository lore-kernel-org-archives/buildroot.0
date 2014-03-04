From: jeremie.scheer at armadeus.com <jeremie.scheer@armadeus.com>
Date: Tue,  4 Mar 2014 14:39:03 +0100
Subject: [Buildroot] [PATCH 2/2] Compile Poppler over Qt
Message-ID: <1393940343-15899-1-git-send-email-jeremie.scheer@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jeremie Scheer <jeremie.scheer@armadeus.com>


Signed-off-by: Jeremie Scheer <jeremie.scheer@armadeus.com>
---
 package/poppler/poppler.mk |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 040327f..7dce7a0 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -7,10 +7,17 @@
 POPPLER_VERSION = 0.24.4
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
-POPPLER_DEPENDENCIES = fontconfig
 POPPLER_LICENSE = GPLv2+
 POPPLER_LICENSE_FILES = COPYING
 POPPLER_CONF_OPT = --with-font-configuration=fontconfig
+POPPLER_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT),y)
+	POPPLER_DEPENDENCIES = qt fontconfig
+else
+	POPPLER_DEPENDENCIES = fontconfig
+	POPPLER_CONF_OPT += --disable-poppler-qt4
+endif
 
 ifeq ($(BR2_PACKAGE_LCMS2),y)
 	POPPLER_CONF_OPT += --enable-cms=lcms2
-- 
1.7.9.5
