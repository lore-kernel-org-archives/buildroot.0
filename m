From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:13 +0200
Subject: [Buildroot] [PATCH 62/83 v2] package/nvidia-driver: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <d0b062fa37edfd465884bf84f7ae9f4a36eae9b8.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nvidia-driver has 5-or-more options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/nvidia-driver/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
index 04499f6..8632835 100644
--- a/package/nvidia-driver/Config.in
+++ b/package/nvidia-driver/Config.in
@@ -2,7 +2,7 @@ comment "nvidia-driver needs a glibc toolchain"
 	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
 
-config BR2_PACKAGE_NVIDIA_DRIVER
+menuconfig BR2_PACKAGE_NVIDIA_DRIVER
 	bool "nvidia-driver"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_TOOLCHAIN_USES_GLIBC
-- 
2.7.4
