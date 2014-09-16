From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Sep 2014 16:52:30 -0300
Subject: [Buildroot] [PATCH] sqlcipher: fix static linking
Message-ID: <1410897150-24431-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It uses openssl which for buildroot mandates libz, but doesn't link
against it so it fails. Fixes:
http://autobuild.buildroot.net/results/514/5145617f7c3cece933c845da3c9836d80d062bb6/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sqlcipher/sqlcipher.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index bae59bb..7c93620 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -19,7 +19,7 @@ SQLCIPHER_CONF_OPT = \
 	--localstatedir=/var
 
 SQLCIPHER_CFLAGS += -DSQLITE_HAS_CODEC # Required according to the README
-SQLCIPHER_LDFLAGS += -lcrypto
+SQLCIPHER_LDFLAGS += -lcrypto -lz
 
 ifneq ($(BR2_LARGEFILE),y)
 # the sqlite configure script fails to define SQLITE_DISABLE_LFS when
-- 
1.8.5.5
