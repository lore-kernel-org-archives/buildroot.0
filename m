From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 20 Jan 2012 15:49:58 +0100
Subject: [Buildroot] [git commit] open2300: quote TARGET_{CC,LD}
Message-ID: <20120120145110.205729031B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f076d71d3bf201f0911bc574e7d61e79a652ff86
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TARGET_CC / TARGET_LD may contain spaces (E.G. when ccache is used), so
ensure they are properly quoted when passed to make.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/open2300/open2300.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
index 450b990..59be66f 100644
--- a/package/open2300/open2300.mk
+++ b/package/open2300/open2300.mk
@@ -17,7 +17,7 @@ ifeq ($(BR2_PACKAGE_MYSQL),y)
 endif
 
 define OPEN2300_BUILD_CMDS
-	$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D) $(OPEN2300_BINS)
+	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) $(OPEN2300_BINS)
 endef
 
 define OPEN2300_INSTALL_TARGET_CMDS
