From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:11 +0200
Subject: [Buildroot] [PATCH 60/83 v2] package/netsnmp: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <054efb61ef8cfb544c986f3de361bc0af09f8a85.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

netsnmp has more than 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/netsnmp/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
index 57cc6b9..3cef6f3 100644
--- a/package/netsnmp/Config.in
+++ b/package/netsnmp/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_NETSNMP
+menuconfig BR2_PACKAGE_NETSNMP
 	bool "netsnmp"
 	depends on BR2_USE_MMU # fork()
 	help
-- 
2.7.4
