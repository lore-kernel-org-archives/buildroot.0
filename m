From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 18:22:15 +0200
Subject: [Buildroot] [git commit] mongoose: correct openssl define
Message-ID: <20170922161618.DAFD2800E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c96ac022f3f622147c17a3080f6f7b78bd3f2337
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

NS_ENABLE_SSL was renamed to MG_ENABLE_SSL in v6.0, commit e1dd3f06fe33
(Rename Mongoose constants: NS_ -> MG_, NSF_ -> MG_F_), so use the new name
instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/mongoose.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 2705bdd..39d5b85 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -14,7 +14,7 @@ MONGOOSE_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MONGOOSE_DEPENDENCIES += openssl
-MONGOOSE_CFLAGS += -DNS_ENABLE_SSL
+MONGOOSE_CFLAGS += -DMG_ENABLE_SSL
 endif
 
 define MONGOOSE_BUILD_CMDS
