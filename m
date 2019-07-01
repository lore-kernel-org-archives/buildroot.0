From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  1 Jul 2019 18:58:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsecret: fix build with NLS
Message-ID: <20190701165851.12581-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/1497d7c2485c4a107ab82c870d78744981efb6d3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsecret/libsecret.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libsecret/libsecret.mk b/package/libsecret/libsecret.mk
index adc7c508df..f5879fbf4e 100644
--- a/package/libsecret/libsecret.mk
+++ b/package/libsecret/libsecret.mk
@@ -9,7 +9,8 @@ LIBSECRET_VERSION = $(LIBSECRET_VERSION_MAJOR).6
 LIBSECRET_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsecret/$(LIBSECRET_VERSION_MAJOR)
 LIBSECRET_SOURCE = libsecret-$(LIBSECRET_VERSION).tar.xz
 LIBSECRET_INSTALL_STAGING = YES
-LIBSECRET_DEPENDENCIES = libglib2 host-intltool
+LIBSECRET_DEPENDENCIES = libglib2 host-intltool $(TARGET_NLS_DEPENDENCIES)
+LIBSECRET_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 LIBSECRET_CONF_OPTS = \
 	--disable-manpages \
 	--disable-strict \
-- 
2.20.1
