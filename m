From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:27 +0200
Subject: [Buildroot] [PATCH 76/83 v2] package/wpa-supplicant: use
	'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <9a19d25a30b9c159aadfb7bc4c5e62a2edd25fd6.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wpa-supplicant has more than 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wpa_supplicant/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 85520b6..c4e312a 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_WPA_SUPPLICANT
+menuconfig BR2_PACKAGE_WPA_SUPPLICANT
 	bool "wpa_supplicant"
 	depends on BR2_USE_MMU # fork()
 	help
-- 
2.7.4
