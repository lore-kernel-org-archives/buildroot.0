From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 14 May 2013 09:29:43 +0100
Subject: [Buildroot] [PATCH] libxml2: depend on zlib and libiconv if
	appropriate
Message-ID: <1368520183-8049-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/libxml2/libxml2.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 6a974ef..1a98cdd 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -34,6 +34,20 @@ else
 HOST_LIBXML2_CONF_OPT += --without-python
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LIBXML2_DEPENDENCIES += zlib
+LIBXML2_CONF_OPT += --with-zlib
+else
+LIBXML2_CONF_OPT += --without-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+LIBXML2_DEPENDENCIES += libiconv
+LIBXML2_CONF_OPT += --with-iconv
+else
+LIBXML2_CONF_OPT += --without-iconv
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
-- 
1.8.1.2
