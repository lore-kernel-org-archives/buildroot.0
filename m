From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Mar 2015 12:52:25 -0300
Subject: [Buildroot] [PATCH v2 2/8] ts5x00_defconfig: switch to
	BR2_KERNEL_HEADERS_VERSION
In-Reply-To: <1425397951-30603-1-git-send-email-gustavo@zacarias.com.ar>
References: <1425397951-30603-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1425397951-30603-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation for BR2_KERNEL_HEADERS_3_17 deprecation.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/ts5x00_defconfig | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

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
-- 
2.0.5
