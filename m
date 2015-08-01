From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  1 Aug 2015 17:12:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/libass: add asm support for Intel
	archs
Message-ID: <1438441967-18854-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libass/libass.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index 643a35e..f1f00f3 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -18,6 +18,12 @@ LIBASS_DEPENDENCIES = \
 	libfribidi \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
+# configure: WARNING: Install yasm for a significantly faster libass build.
+# only for Intel archs
+ifeq ($(BR2_i386)$(BR2_x86_64),y)
+LIBASS_DEPENDENCIES += host-yasm
+endif
+
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 LIBASS_DEPENDENCIES += fontconfig
 LIBASS_CONF_OPTS += --enable-fontconfig
-- 
2.1.4
