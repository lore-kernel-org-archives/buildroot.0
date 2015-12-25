From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:48 +0100
Subject: [Buildroot] [PATCH 79/84 RFC] package/wpa-supplicant: use
	'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <3d0c22776d5fada43fc4f37d9eeaae660b183d09.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wpa-supplicant has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/wpa_supplicant/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index f4c4167..26009c6 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_WPA_SUPPLICANT
+menuconfig BR2_PACKAGE_WPA_SUPPLICANT
 	bool "wpa_supplicant"
 	depends on BR2_USE_MMU # fork()
 	help
-- 
1.9.1
