From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 10 Jan 2021 23:28:26 +0100
Subject: [Buildroot] [RFC v2 05/12] package/vulkan-headers: new package
In-Reply-To: <20210110222833.26301-1-ps.report@gmx.net>
References: <20210110222833.26301-1-ps.report@gmx.net>
Message-ID: <20210110222833.26301-6-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - fix license SPDX (Yann E. MORIN)
---
 package/Config.in                          |  1 +
 package/vulkan-headers/Config.in           |  7 +++++++
 package/vulkan-headers/vulkan-headers.hash |  3 +++
 package/vulkan-headers/vulkan-headers.mk   | 13 +++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/vulkan-headers/Config.in
 create mode 100644 package/vulkan-headers/vulkan-headers.hash
 create mode 100644 package/vulkan-headers/vulkan-headers.mk

diff --git a/package/Config.in b/package/Config.in
index 9ed02ec890..9a91e6324c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -338,6 +338,7 @@ comment "Graphic libraries"
 	source "package/sdl2_net/Config.in"
 	source "package/sdl2_ttf/Config.in"
 	source "package/tk/Config.in"
+	source "package/vulkan-headers/Config.in"
 
 comment "Other GUIs"
 	source "package/qt5/Config.in"
diff --git a/package/vulkan-headers/Config.in b/package/vulkan-headers/Config.in
new file mode 100644
index 0000000000..c0fc8f20b0
--- /dev/null
+++ b/package/vulkan-headers/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_VULKAN_HEADERS
+	bool "vulkan-headers"
+	help
+	  The Khronos official Vulkan header files and API
+	  registry.
+
+	  https://github.com/KhronosGroup/Vulkan-Headers
diff --git a/package/vulkan-headers/vulkan-headers.hash b/package/vulkan-headers/vulkan-headers.hash
new file mode 100644
index 0000000000..678a38e0d4
--- /dev/null
+++ b/package/vulkan-headers/vulkan-headers.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  3f9435a93ba13d94d0c3265a47e0436579e46bb9ca085e9b16a753458e4d79d2  vulkan-headers-1.2.165.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/vulkan-headers/vulkan-headers.mk b/package/vulkan-headers/vulkan-headers.mk
new file mode 100644
index 0000000000..48d390a581
--- /dev/null
+++ b/package/vulkan-headers/vulkan-headers.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# vulkan-headers
+#
+################################################################################
+
+VULKAN_HEADERS_VERSION = 1.2.165
+VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,v$(VULKAN_HEADERS_VERSION))
+VULKAN_HEADERS_LICENSE = Apache-2.0
+VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
+VULKAN_HEADERS_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
-- 
2.29.2
