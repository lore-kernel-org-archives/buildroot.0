From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 7 Nov 2010 10:42:45 +0100
Subject: [Buildroot] [git commit master 1/1] directfb: png support is needed
	to build directfb-csource for the host
Message-ID: <20101107094406.708FD8DBFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f6c7d57cab8db670f3c2d216c02d1fec811c877f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/directfb.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 9192dc5..309659a 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -123,12 +123,13 @@ ifeq ($(BR2_PACKAGE_DIRECTB_TESTS),y)
 DIRECTFB_CONF_OPT += --with-tests
 endif
 
-HOST_DIRECTFB_DEPENDENCIES = host-pkg-config
+HOST_DIRECTFB_DEPENDENCIES = host-pkg-config host-libpng
 HOST_DIRECTFB_CONF_OPT = \
 		--enable-shared \
 		--disable-static \
 		--disable-debug \
 		--disable-multi \
+		--enable-png \
 		--with-gfxdrivers=none \
 		--with-inputdrivers=none
 
-- 
1.7.1
