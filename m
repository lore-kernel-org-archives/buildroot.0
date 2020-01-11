From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 11 Jan 2020 16:07:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/libsigrok: add optional hidapi
 dependency
Message-ID: <20200111150749.1253467-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hidapi dependency has been added since version 0.5.2 and
https://github.com/sigrokproject/libsigrok/commit/4417074c68ce998c2d666fc8a034204a1b74fc2f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsigrok/libsigrok.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 4866ec4d68..8def692e31 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -22,6 +22,13 @@ else
 LIBSIGROK_CONF_OPTS += --without-libbluez
 endif
 
+ifeq ($(BR2_PACKAGE_HIDAPI),y)
+LIBSIGROK_CONF_OPTS += --with-libhidapi
+LIBSIGROK_DEPENDENCIES += hidapi
+else
+LIBSIGROK_CONF_OPTS += --without-libhidapi
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSERIALPORT),y)
 LIBSIGROK_CONF_OPTS += --with-libserialport
 LIBSIGROK_DEPENDENCIES += libserialport
-- 
2.24.1
