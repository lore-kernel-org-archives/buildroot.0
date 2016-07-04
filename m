From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:57 +0200
Subject: [Buildroot] [PATCH 46/83 v2] package/igh-ethercat: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <860b4f9b9b522b86404fbb376405303f369ba3f1.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

igh-ethercat has 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

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
2.7.4
