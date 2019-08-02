From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Aug 2019 23:33:00 +0200
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: make
 br-arm-internal-glibc bleeding edge
Message-ID: <20190802213127.9275B89007@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b96c343b2d58005a17903fc94fd51e112b7dc662
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We do not have any configuration that tests the very bleeding edge gcc
and binutils versions, so let's change br-arm-internal-glibc to use
the latest version of gcc (9.x right now) and binutils (2.32 right
now). The idea is that this defconfig should be updated to the latest
version of gcc and binutils when their version is bumped.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
