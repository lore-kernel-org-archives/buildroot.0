From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  8 Jul 2018 09:36:47 +0200
Subject: [Buildroot] [PATCH 3/3] libzip: add optional gnutls support
In-Reply-To: <20180708073647.16301-1-fontaine.fabrice@gmail.com>
References: <20180708073647.16301-1-fontaine.fabrice@gmail.com>
Message-ID: <20180708073647.16301-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gnutls support has been added since version 1.5.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libzip/libzip.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index 0253a61cda..20c04122ec 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -18,6 +18,13 @@ else
 LIBZIP_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_BZIP2=TRUE
 endif
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LIBZIP_DEPENDENCIES += gnutls
+LIBZIP_CONF_OPTS += -DENABLE_GNUTLS=ON
+else
+LIBZIP_CONF_OPTS += -DENABLE_GNUTLS=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBZIP_DEPENDENCIES += openssl
 LIBZIP_CONF_OPTS += -DENABLE_OPENSSL=ON
-- 
2.14.1
