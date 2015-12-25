From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:38 +0100
Subject: [Buildroot] [PATCH 69/84 RFC] package/igh-ethercat: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <9203e89bd2c4789608e3d52b74c372460863feb9.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

igh-ethercat has 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/igh-ethercat/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/igh-ethercat/Config.in b/package/igh-ethercat/Config.in
index e600ef5..696e550 100644
--- a/package/igh-ethercat/Config.in
+++ b/package/igh-ethercat/Config.in
@@ -1,7 +1,7 @@
 comment "igh-ethercat needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
 
-config BR2_PACKAGE_IGH_ETHERCAT
+menuconfig BR2_PACKAGE_IGH_ETHERCAT
 	bool "igh-ethercat"
 	depends on BR2_LINUX_KERNEL
 	help
-- 
1.9.1
