From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu,  9 May 2019 13:04:37 +0200
Subject: [Buildroot] [PATCH 1/2] package/libupnp18: needs host-pkgconf
Message-ID: <20190509110438.31340-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise build fails with:

```
configure.ac:630: error: possibly undefined macro: AC_MSG_ERROR
      If this token and others are legitimate, please use m4_pattern_allow.
```

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/libupnp18/libupnp18.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libupnp18/libupnp18.mk b/package/libupnp18/libupnp18.mk
index 5154be5316..35e8dc4a47 100644
--- a/package/libupnp18/libupnp18.mk
+++ b/package/libupnp18/libupnp18.mk
@@ -11,12 +11,13 @@ LIBUPNP18_CONF_ENV = ac_cv_lib_compat_ftime=no
 LIBUPNP18_INSTALL_STAGING = YES
 LIBUPNP18_LICENSE = BSD-3-Clause
 LIBUPNP18_LICENSE_FILES = COPYING
+LIBUPNP18_DEPENDENCIES = host-pkgconf
 # We're patching configure.ac
 LIBUPNP18_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBUPNP18_CONF_OPTS += --enable-open-ssl
-LIBUPNP18_DEPENDENCIES += host-pkgconf openssl
+LIBUPNP18_DEPENDENCIES += openssl
 else
 LIBUPNP18_CONF_OPTS += --disable-open-ssl
 endif
-- 
2.21.0
