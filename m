From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 23:49:23 +0200
Subject: [Buildroot] [git commit] sqlcipher: specify tclConfig.sh directory
Message-ID: <20151014215342.6DB057FB77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b1dcb1c2468134ddf0e3cfc81c40874bf9fc561e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it will search around, and if the host has it then it breaks.
Fixes:
http://autobuild.buildroot.net/results/057/0572a9a1f69ee214efb10863f5d2852b25bf4f54/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sqlcipher/sqlcipher.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 9693eb9..fadec22 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -14,7 +14,8 @@ SQLCIPHER_CONF_ENV = \
 	TCLSH_CMD=$(HOST_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)
 
 SQLCIPHER_CONF_OPTS = \
-	--enable-threadsafe
+	--enable-threadsafe \
+	--with-tcl=$(HOST_DIR)/usr/lib
 
 SQLCIPHER_CFLAGS += -DSQLITE_HAS_CODEC # Required according to the README
 SQLCIPHER_CONF_ENV += LIBS="-lcrypto -lz"
