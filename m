From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:41 +0100
Subject: [Buildroot] [PATCH 49/80 v1] package/igh-ethercat: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <d76a1b569097e6177cebbb797c4f8b0315e803ca.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

igh-ethercat has 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
