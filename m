From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 18:22:12 +0200
Subject: [Buildroot] [git commit] mongoose: drop unused openssl linker flags
Message-ID: <20170922161618.CB08A800E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a76d5a7276a4ae26b9da35a59cf4136c31d6497d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No linking is done since the package was reworked for v6.x in commit
9860746ff (mongoose: bump to version 6.1), so drop LDFLAGS and the list of
libraries to link against.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/mongoose.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 702342b..2705bdd 100644
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
