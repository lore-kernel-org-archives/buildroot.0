From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Oct 2015 13:27:30 +0200
Subject: [Buildroot] [git commit] sqlcipher: disable tcl support
Message-ID: <20151015112748.43AA081EFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0d6937644cafe3ed537194724159c473736bc57a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit b1dcb1c2 a fix was attempted at fixing a build failure where
sqlcipher finds the distribution tcl and tries to build against it.
sqlcipher has two tcl usage scenarios: host-tcl which is required to
actually build it, and target tcl to build bindings.
Since cross-compilation of the bindings isn't clean it fails as well,
and since it wasn't a feature before either just disable it completely,
since the wrong fix makes the sqlcipher build failures worse.
Fixes:
http://autobuild.buildroot.net/results/fc0/fc0528de7fed2f34f503fe8dd8b4c21ded0d6dff/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sqlcipher/sqlcipher.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index fadec22..196f162 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -15,7 +15,7 @@ SQLCIPHER_CONF_ENV = \
 
 SQLCIPHER_CONF_OPTS = \
 	--enable-threadsafe \
-	--with-tcl=$(HOST_DIR)/usr/lib
+	--disable-tcl
 
 SQLCIPHER_CFLAGS += -DSQLITE_HAS_CODEC # Required according to the README
 SQLCIPHER_CONF_ENV += LIBS="-lcrypto -lz"
