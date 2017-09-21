From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 23:21:39 +0200
Subject: [Buildroot] [PATCH 4/4] mongoose: don't install to target
In-Reply-To: <20170921212139.2901-1-peter@korsgaard.com>
References: <20170921212139.2901-1-peter@korsgaard.com>
Message-ID: <20170921212139.2901-4-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Only a static library is built (and no _INSTALL_TARGET_CMDS are defined), so
there is no need to run the target-install step.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/mongoose.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 39d5b85531..e2149e06e8 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -9,6 +9,8 @@ MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
 MONGOOSE_INSTALL_STAGING = YES
+# static library
+MONGOOSE_INSTALL_TARGET = NO
 
 MONGOOSE_CFLAGS = $(TARGET_CFLAGS)
 
-- 
2.11.0
