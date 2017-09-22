From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 18:22:18 +0200
Subject: [Buildroot] [git commit] mongoose: don't install to target
Message-ID: <20170922161618.EC1D180FDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a418e6eeaaa6e1a0d173dbc538fac5f18470b024
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only a static library is built (and no _INSTALL_TARGET_CMDS are defined), so
there is no need to run the target-install step.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/mongoose.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 39d5b85..e2149e0 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -9,6 +9,8 @@ MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
 MONGOOSE_INSTALL_STAGING = YES
+# static library
+MONGOOSE_INSTALL_TARGET = NO
 
 MONGOOSE_CFLAGS = $(TARGET_CFLAGS)
 
