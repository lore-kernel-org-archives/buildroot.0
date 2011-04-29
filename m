From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 29 Apr 2011 15:40:58 +0200
Subject: [Buildroot] [git commit] package/Makefile.in: CFLAGS/LDFLAGS: don't
	add -I / -L args for STAGING_DIR
Message-ID: <20110429134748.0545482B3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7e3e8ec040b06d6e2fb69e55c004f1ebc02c76d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we use sysroot for all toolchains, the explicit -I / -L arguments
in CFLAGS / LDFLAGS aren't needed anymore (And having them makes the build
quite noisy for certain packages as STAGING_DIR/include normally doesn't
exist).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index f98b3e7..7811d51 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -98,11 +98,6 @@ ifeq ($(BR2_LARGEFILE),y)
 TARGET_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 endif
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
-endif
-
-TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 TARGET_SYSROOT_OPT=--sysroot=$(STAGING_DIR)
 
-- 
1.7.3.4
