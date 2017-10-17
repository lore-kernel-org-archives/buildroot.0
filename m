From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Oct 2017 21:58:35 +0200
Subject: [Buildroot] [git commit] msgpack: fix build without threads support
Message-ID: <20171017195123.56C8880F7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1856eb9047d6707c31fd76c3767da590e200893e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some example code depends on pthreads, and we generally don't build
examples in Buildroot, so disable their build.

Fixes:
http://autobuild.buildroot.net/results/f5d/f5d493dbe65cbe58d0924176efbd12e4a078f3ee/
http://autobuild.buildroot.net/results/813/81387649d9dbdfe4ccba9c7d0885aa8bd5239938/
http://autobuild.buildroot.net/results/9d4/9d486fca93136bb9dbf22c9101186d9d1fc0eb66/

Cc: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
[Thomas: completely disable examples.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/msgpack/msgpack.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/msgpack/msgpack.mk b/package/msgpack/msgpack.mk
index f6f3ab0..7b92f3f 100644
--- a/package/msgpack/msgpack.mk
+++ b/package/msgpack/msgpack.mk
@@ -9,5 +9,6 @@ MSGPACK_SITE = $(call github,msgpack,msgpack-c,cpp-$(MSGPACK_VERSION))
 MSGPACK_LICENSE = BSL-1.0
 MSGPACK_LICENSE_FILES = COPYING LICENSE_1_0.txt
 MSGPACK_INSTALL_STAGING = YES
+MSGPACK_CONF_OPTS = -DMSGPACK_BUILD_EXAMPLES=OFF
 
 $(eval $(cmake-package))
