From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Nov 2012 08:20:16 +0100
Subject: [Buildroot] [git commit] libtirpc: ensure getrpcby{number,
	name} are provided
Message-ID: <20121106072423.A62EF99BFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1e4feed13e050de408dd78e32cf5772bd6343d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by E.G. xinetd.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libtirpc/libtirpc.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 02edbe2..5b3c728 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -13,6 +13,9 @@ LIBTIRPC_LICENSE_FILES = COPYING
 LIBTIRPC_INSTALL_STAGING = YES
 LIBTIRPC_AUTORECONF = YES
 
+# getrpcby{number,name} are only provided if 'GQ' is defined
+LIBTIRPC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DGQ"
+
 # We need host-pkgconf because the configure.ac contains a
 # PKG_CHECK_MODULES macro call, and since we're autoreconfiguring this
 # package, we need the source for this PKG_CHECK_MODULES macro, which
