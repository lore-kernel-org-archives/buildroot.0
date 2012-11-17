From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 23:41:48 +0100
Subject: [Buildroot] [git commit] libatomic_ops: bump to version 7.2
Message-ID: <20121117225525.CC4779A081@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2ed6a0564946932ebfc6eaf2470d333bf188f62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 1.2 we were using doesn't build on ARM Thumb platforms:

  http://autobuild.buildroot.org/results/94ef6be7dcb31021462e7313724217627d4b29df/build-end.log

Moreover, the 7.2 version is the one used by Debian/Ubuntu, and it has
been tested to build fine with the two packages that depend on
libatomic_ops: libdrm and pulseaudio.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libatomic_ops/libatomic_ops.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index 6d50d0a..8f66f88 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBATOMIC_OPS_VERSION = 1.2
+LIBATOMIC_OPS_VERSION = 7.2
 LIBATOMIC_OPS_SOURCE = libatomic_ops-$(LIBATOMIC_OPS_VERSION).tar.gz
 LIBATOMIC_OPS_SITE = http://www.hpl.hp.com/research/linux/atomic_ops/download
 LIBATOMIC_OPS_INSTALL_STAGING = YES
