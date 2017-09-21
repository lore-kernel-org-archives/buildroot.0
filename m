From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 23:21:37 +0200
Subject: [Buildroot] [PATCH 2/4] mongoose: drop unused openssl linker flags
In-Reply-To: <20170921212139.2901-1-peter@korsgaard.com>
References: <20170921212139.2901-1-peter@korsgaard.com>
Message-ID: <20170921212139.2901-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No linking is done since the package was reworked for v6.x in commit
9860746ff (mongoose: bump to version 6.1), so drop LDFLAGS and the list of
libraries to link against.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/mongoose.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 702342b3b1..2705bdd4a5 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -10,12 +10,11 @@ MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
 MONGOOSE_INSTALL_STAGING = YES
 
-MONGOOSE_CFLAGS = $(TARGET_CFLAGS) $(TARGET_LDFLAGS)
+MONGOOSE_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MONGOOSE_DEPENDENCIES += openssl
-# directly linked
-MONGOOSE_CFLAGS += -DNS_ENABLE_SSL -lssl -lcrypto -lz
+MONGOOSE_CFLAGS += -DNS_ENABLE_SSL
 endif
 
 define MONGOOSE_BUILD_CMDS
-- 
2.11.0
