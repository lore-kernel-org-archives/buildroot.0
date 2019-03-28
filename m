From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Mar 2019 10:37:13 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/fetchmail: fix
 shared build
Message-ID: <20190328093623.8781A7FCCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f44db555460a2793a52485a5c46eaa36ab4ca11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Update second patch to fix shared build

Fixes:
 - http://autobuild.buildroot.org/results/c27b9c82e68ade29b45dc84ecce5fe6653fbb7da

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3dc3b4c2798ff76666ba6b3b83ae5942b76e6091)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../fetchmail/0002-configure.ac-use-pkg-config-to-find-openssl.patch    | 2 +-
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
