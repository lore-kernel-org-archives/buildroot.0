From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:43 +0100
Subject: [Buildroot] [PATCH 74/84 RFC] package/netsnmp: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <76de0198d03f0974b39319d83bd93556f32a4c29.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

netsnmp has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
1.9.1
