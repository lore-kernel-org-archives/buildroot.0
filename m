From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Oct 2015 18:41:57 -0300
Subject: [Buildroot] [PATCH] sqlcipher: specify tclConfig.sh directory
Message-ID: <1444858917-17641-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise it will search around, and if the host has it then it breaks.
Fixes:
http://autobuild.buildroot.net/results/057/0572a9a1f69ee214efb10863f5d2852b25bf4f54/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sqlcipher/sqlcipher.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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
-- 
2.4.9
