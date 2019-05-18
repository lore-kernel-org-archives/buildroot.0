From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 23:31:18 +0200
Subject: [Buildroot] [git commit] package/libupnp18: needs host-pkgconf
Message-ID: <20190518212610.110D48A63C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffc51049ab83c2c1a35e0826405c2cad0316f14b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise build fails with:

```
configure.ac:630: error: possibly undefined macro: AC_MSG_ERROR
      If this token and others are legitimate, please use m4_pattern_allow.
```

Fixes:

  http://autobuild.buildroot.net/results/6d734e45ec923dfa7549e0480b3d8913fc29fddd/

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
