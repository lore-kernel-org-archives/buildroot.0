From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Mar 2019 22:05:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: fix shared build
Message-ID: <20190325210508.8125-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update second patch to fix shared build

Fixes:
 - http://autobuild.buildroot.org/results/c27b9c82e68ade29b45dc84ecce5fe6653fbb7da

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-configure.ac-use-pkg-config-to-find-openssl.patch      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fetchmail/0002-configure.ac-use-pkg-config-to-find-openssl.patch b/package/fetchmail/0002-configure.ac-use-pkg-config-to-find-openssl.patch
index dd48783922..aefed7f2e4 100644
--- a/package/fetchmail/0002-configure.ac-use-pkg-config-to-find-openssl.patch
+++ b/package/fetchmail/0002-configure.ac-use-pkg-config-to-find-openssl.patch
@@ -42,7 +42,7 @@ index 16b0fcba..3a75ec6e 100644
 -  if test "$i" = "" ; then i="(none)" ; fi
 -  AC_MSG_RESULT($i)
 -  dnl XXX FIXME: use pkg-config if available!
-+  PKG_CHECK_MODULES([SSL],[libssl],[LIBS="$LIBS $SSL_LIBS"],[
++  PKG_CHECK_MODULES([SSL],[libssl libcrypto],[LIBS="$LIBS $SSL_LIBS"],[
 +    LDFLAGS="$LDFLAGS -L$with_ssl/lib"
 +    LIBS="$LIBS -lssl -lcrypto"
 +    dnl check if -ldl is needed
-- 
2.20.1
