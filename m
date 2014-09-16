From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Sep 2014 23:07:21 +0200
Subject: [Buildroot] [git commit] sqlcipher: fix static linking
Message-ID: <20140916210748.2E2199D6B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58a41c2f68001b3ef25356cd3f1a79b9e46e7157
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It uses openssl which for buildroot mandates libz, but doesn't link
against it so it fails. Fixes:
http://autobuild.buildroot.net/results/514/5145617f7c3cece933c845da3c9836d80d062bb6/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlcipher/sqlcipher.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
