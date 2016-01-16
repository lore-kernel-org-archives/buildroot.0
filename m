From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:38:06 +0100
Subject: [Buildroot] [PATCH 74/80 v1] package/wpa-supplicant: use
	'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <96a043da28fae94f602e0ae2cddb6cf376744281.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wpa-supplicant has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
