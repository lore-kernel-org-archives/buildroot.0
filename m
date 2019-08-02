From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  2 Aug 2019 22:51:48 +0200
Subject: [Buildroot] [PATCH 3/3] support/config-fragments/autobuild: make
 br-arm-internal-glibc bleeding edge
In-Reply-To: <20190802205149.28342-1-thomas.petazzoni@bootlin.com>
References: <20190802205149.28342-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190802205149.28342-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We do not have any configuration that tests the very bleeding edge gcc
and binutils versions, so let's change br-arm-internal-glibc to use
the latest version of gcc (9.x right now) and binutils (2.32 right
now). The idea is that this defconfig should be updated to the latest
version of gcc and binutils when their version is bumped.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/config-fragments/autobuild/br-arm-internal-glibc.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/config-fragments/autobuild/br-arm-internal-glibc.config b/support/config-fragments/autobuild/br-arm-internal-glibc.config
index 6b2566eedc..7c9b465a88 100644
--- a/support/config-fragments/autobuild/br-arm-internal-glibc.config
+++ b/support/config-fragments/autobuild/br-arm-internal-glibc.config
@@ -1,4 +1,6 @@
 BR2_arm=y
 BR2_cortex_a8=y
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_BINUTILS_VERSION_2_32_X=y
+BR2_GCC_VERSION_9_X=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
-- 
2.21.0
