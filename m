From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Jul 2020 22:42:07 +0200
Subject: [Buildroot] [PATCH 2/2] package/libzip: add mbedtls optional
 dependency
In-Reply-To: <20200720204207.2005746-1-fontaine.fabrice@gmail.com>
References: <20200720204207.2005746-1-fontaine.fabrice@gmail.com>
Message-ID: <20200720204207.2005746-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mbedtls is available (and enabled by default) since version 1.5.2 and
https://github.com/nih-at/libzip/commit/8e01a4fe8fa830c973b6a00f0da1e8b01789529a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libzip/libzip.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index 6023dbec1b..9d64db32fa 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -27,6 +27,13 @@ else
 LIBZIP_CONF_OPTS += -DENABLE_GNUTLS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+LIBZIP_DEPENDENCIES += mbedtls
+LIBZIP_CONF_OPTS += -DENABLE_MBEDTLS=ON
+else
+LIBZIP_CONF_OPTS += -DENABLE_MBEDTLS=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBZIP_DEPENDENCIES += openssl
 LIBZIP_CONF_OPTS += -DENABLE_OPENSSL=ON
-- 
2.27.0
