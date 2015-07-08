From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jul 2015 09:31:36 +0200
Subject: [Buildroot] [git commit] package/libtirpc: remove host-pkgconf
	dependency
Message-ID: <20150708073152.04A908181F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aee57627b09d0955270a562b8adaa0ff88ef523b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

configure.ac does not contain PKG_CHECK_MODULES anymore.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libtirpc/libtirpc.mk |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index f1ad395..494650c 100644
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
