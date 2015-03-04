From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 22:12:45 +0100
Subject: [Buildroot] [git commit] ts5x00_defconfig: switch to
	BR2_KERNEL_HEADERS_VERSION
Message-ID: <20150304211938.9AA3D800D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=001846efe6bc2bc2cf0d213974a2de7fa85f2f36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation for BR2_KERNEL_HEADERS_3_17 deprecation.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/ts5x00_defconfig |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/configs/ts5x00_defconfig b/configs/ts5x00_defconfig
index 336f6d9..befb655 100644
--- a/configs/ts5x00_defconfig
+++ b/configs/ts5x00_defconfig
@@ -1,6 +1,11 @@
 BR2_i386=y
 BR2_x86_i586=y
-BR2_KERNEL_HEADERS_3_17=y
+
+# Lock headers version to match and avoid breakage
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.17.8"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
+
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
 BR2_ROOTFS_OVERLAY="board/ts/ts5x00/fs-overlay"
 BR2_LINUX_KERNEL=y
