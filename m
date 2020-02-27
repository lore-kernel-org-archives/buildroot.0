From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 28 Feb 2020 00:15:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/linknx: host-pkgconf is mandatory
Message-ID: <20200227231527.3785513-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-pkgconf is a mandatory dependency, this will fix per-package build

Fixes:
 - http://autobuild.buildroot.org/results/cfda0ce53165bb22b691b5b6510f0ab096a41e17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linknx/linknx.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index 15d4b5a109..c75f0655d6 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -17,7 +17,9 @@ LINKNX_CONF_OPTS = \
 	--with-pth=$(STAGING_DIR)/usr \
 	--disable-smtp
 
-LINKNX_DEPENDENCIES = libpthsem \
+LINKNX_DEPENDENCIES = \
+	host-pkgconf \
+	libpthsem \
 	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
@@ -30,7 +32,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LOG4CPP),y)
 LINKNX_CONF_OPTS += --with-log4cpp
-LINKNX_DEPENDENCIES += host-pkgconf log4cpp
+LINKNX_DEPENDENCIES += log4cpp
 else
 LINKNX_CONF_OPTS += --without-log4cpp
 endif
-- 
2.25.0
