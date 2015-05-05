From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue,  5 May 2015 18:24:33 +0200
Subject: [Buildroot] [PATCH 1/2] package/libtirpc: remove host-pkgconf
	dependency
Message-ID: <1430843074-30355-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

configure.ac does not contain PKG_CHECK_MODULES anymore.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/libtirpc/libtirpc.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 5ad427b..406ee05 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -18,12 +18,4 @@ LIBTIRPC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DGQ"
 
 LIBTIRPC_CONF_OPTS = --disable-gssapi
 
-# We need host-pkgconf because the configure.ac contains a
-# PKG_CHECK_MODULES macro call, and since we're autoreconfiguring this
-# package, we need the source for this PKG_CHECK_MODULES macro, which
-# comes from host-pkgconf. Other than that, pkgconf is only used to
-# find if there is a gss implementation somewhere, which we don't
-# support in Buildroot yet.
-LIBTIRPC_DEPENDENCIES = host-pkgconf
-
 $(eval $(autotools-package))
-- 
2.3.7
