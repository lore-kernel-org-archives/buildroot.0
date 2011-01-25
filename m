From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Jan 2011 16:08:50 +0100
Subject: [Buildroot] [git commit master 1/1] Use sys-root rather than
	sysroot for the sysroot/staging_dir
Message-ID: <20110125150944.2C7438D244@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8f61b236c9e70853e21730ad7889be9c3d23f94d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The name of the sysroot directory is arbitrary, but as ct-ng uses sys-root,
let's use that as well for consistency.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index a1e290f..fae0e0e 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -35,7 +35,7 @@ endif
 
 REAL_GNU_TARGET_NAME=$(ARCH)-unknown-linux-$(LIBC)$(ABI)
 
-STAGING_DIR=$(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/sysroot
+STAGING_DIR=$(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/sys-root
 
 ifeq ($(BR2_OPTIMIZE_0),y)
 TARGET_OPTIMIZATION+=-O0
-- 
1.7.3.4
