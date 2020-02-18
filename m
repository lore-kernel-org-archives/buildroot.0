From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 18 Feb 2020 20:06:03 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/libsigrok: explain why host-doxygen is needed
Message-ID: <20200218190603.50374-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix package's name in title

 package/libsigrok/libsigrok.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index a02775d889..ec03c53e39 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -57,6 +57,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBSIGROKCXX),y)
 LIBSIGROK_CONF_OPTS += --enable-cxx
+# host-doxygen is used by C++ bindings to parse libsigrok symbols
 LIBSIGROK_DEPENDENCIES += \
 	glibmm \
 	host-doxygen \
-- 
2.25.0
