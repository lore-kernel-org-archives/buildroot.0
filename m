From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  5 May 2012 18:26:06 +0200
Subject: [Buildroot] [PATCH 2/2] libaio: use alternative upstream URL
In-Reply-To: <cover.1336235161.git.thomas.petazzoni@free-electrons.com>
References: <cover.1336235161.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7b0e3e05280562b758638a0582516394a3164675.1336235161.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the kernel.org security problem and reinstallation, libaio is no
longer available from this site. Use snapshot.debian.net as an
alternative source.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libaio/libaio.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index 3ffc49c..f90ef4d 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 LIBAIO_VERSION=0.3.109
-LIBAIO_SOURCE=libaio-$(LIBAIO_VERSION).tar.bz2
-LIBAIO_SITE=$(BR2_KERNEL_MIRROR)/linux/libs/aio/
+LIBAIO_SOURCE=libaio_$(LIBAIO_VERSION).orig.tar.gz
+LIBAIO_SITE=http://snapshot.debian.org/archive/debian/20110227T085214Z/pool/main/liba/libaio/
 LIBAIO_INSTALL_STAGING=YES
 
 define LIBAIO_BUILD_CMDS
-- 
1.7.9.5
