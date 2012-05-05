From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 May 2012 19:34:49 +0200
Subject: [Buildroot] [git commit] libaio: use alternative upstream URL
Message-ID: <20120505173639.BD8D196A7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73aa143b66437f6796a94dfaa1240044513e337e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the kernel.org security problem and reinstallation, libaio is no
longer available from this site. Use snapshot.debian.net as an
alternative source.

[Peter: Add spaces around '=' while we're at it]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libaio/libaio.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index 3ffc49c..05a4d5c 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -3,10 +3,10 @@
 # libaio
 #
 #############################################################
-LIBAIO_VERSION=0.3.109
-LIBAIO_SOURCE=libaio-$(LIBAIO_VERSION).tar.bz2
-LIBAIO_SITE=$(BR2_KERNEL_MIRROR)/linux/libs/aio/
-LIBAIO_INSTALL_STAGING=YES
+LIBAIO_VERSION = 0.3.109
+LIBAIO_SOURCE = libaio_$(LIBAIO_VERSION).orig.tar.gz
+LIBAIO_SITE = http://snapshot.debian.org/archive/debian/20110227T085214Z/pool/main/liba/libaio/
+LIBAIO_INSTALL_STAGING = YES
 
 define LIBAIO_BUILD_CMDS
   $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
