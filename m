From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 23:21:38 +0200
Subject: [Buildroot] [PATCH 3/4] mongoose: correct openssl define
In-Reply-To: <20170921212139.2901-1-peter@korsgaard.com>
References: <20170921212139.2901-1-peter@korsgaard.com>
Message-ID: <20170921212139.2901-3-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NS_ENABLE_SSL was renamed to MG_ENABLE_SSL in v6.0, commit e1dd3f06fe33
(Rename Mongoose constants: NS_ -> MG_, NSF_ -> MG_F_), so use the new name
instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/mongoose.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 2705bdd4a5..39d5b85531 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -14,7 +14,7 @@ MONGOOSE_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MONGOOSE_DEPENDENCIES += openssl
-MONGOOSE_CFLAGS += -DNS_ENABLE_SSL
+MONGOOSE_CFLAGS += -DMG_ENABLE_SSL
 endif
 
 define MONGOOSE_BUILD_CMDS
-- 
2.11.0
