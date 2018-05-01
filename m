From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  1 May 2018 22:40:34 +0200
Subject: [Buildroot] [PATCH 3/7] wget: add optional dependency for libidn2
In-Reply-To: <20180501204038.20000-1-fontaine.fabrice@gmail.com>
References: <20180501204038.20000-1-fontaine.fabrice@gmail.com>
Message-ID: <20180501204038.20000-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wget/wget.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 23e4c8acca..c3c792f1e8 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -26,6 +26,13 @@ else
 WGET_CONF_OPTS += --without-ssl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBIDN2),y)
+WGET_CONF_OPTS += --with-libidn
+WGET_DEPENDENCIES += libidn2
+else
+WGET_CONF_OPTS += --without-libidn
+endif
+
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 WGET_DEPENDENCIES += util-linux
 endif
-- 
2.14.1
