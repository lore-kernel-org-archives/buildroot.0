From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Oct 2017 17:12:56 +0100
Subject: [Buildroot] [PATCH 2/2] package/boinc: add optional dependency to
	freetype
In-Reply-To: <20171029161256.18607-1-bernd.kuhls@t-online.de>
References: <20171029161256.18607-1-bernd.kuhls@t-online.de>
Message-ID: <20171029161256.18607-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No configure option present:
https://github.com/BOINC/boinc/blob/master/configure.ac#L497

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/boinc/boinc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index 01fa66ac91..901f1ee986 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -26,6 +26,10 @@ BOINC_CONF_OPTS = \
 	--with-pkg-config=$(PKG_CONFIG_HOST_BINARY) \
 	--with-libcurl=$(STAGING_DIR)/usr
 
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+BOINC_DEPENDENCIES += freetype
+endif
+
 ifeq ($(BR2_PACKAGE_LIBFCGI),y)
 BOINC_DEPENDENCIES += libfcgi
 BOINC_CONF_OPTS += --enable-fcgi
-- 
2.11.0
