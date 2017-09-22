From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 18:22:08 +0200
Subject: [Buildroot] [git commit] mongoose: drop unused MONGOOSE_NO_DL define
Message-ID: <20170922161618.BB84A800E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c038388f9a95833aaeb19b016b8fb64504f0430f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This define is not used anywhere in the mongoose sources since v6.0 (commit
8927c9d22b3f), so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/mongoose.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 36fd8f8..702342b 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -10,7 +10,7 @@ MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
 MONGOOSE_INSTALL_STAGING = YES
 
-MONGOOSE_CFLAGS = $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -DMONGOOSE_NO_DL
+MONGOOSE_CFLAGS = $(TARGET_CFLAGS) $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MONGOOSE_DEPENDENCIES += openssl
