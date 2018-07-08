From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  8 Jul 2018 09:36:46 +0200
Subject: [Buildroot] [PATCH 2/3] libzip: add optional openssl support
In-Reply-To: <20180708073647.16301-1-fontaine.fabrice@gmail.com>
References: <20180708073647.16301-1-fontaine.fabrice@gmail.com>
Message-ID: <20180708073647.16301-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openssl support has been added since version 1.5.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libzip/libzip.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index d46bc17977..0253a61cda 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -18,4 +18,11 @@ else
 LIBZIP_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_BZIP2=TRUE
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBZIP_DEPENDENCIES += openssl
+LIBZIP_CONF_OPTS += -DENABLE_OPENSSL=ON
+else
+LIBZIP_CONF_OPTS += -DENABLE_OPENSSL=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.14.1
