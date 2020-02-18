From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 18 Feb 2020 20:03:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/sigrok: explain why host-doxygen is
 needed
Message-ID: <20200218190339.50107-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
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
