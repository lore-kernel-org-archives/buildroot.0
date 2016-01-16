From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:58 +0100
Subject: [Buildroot] [PATCH 66/80 v1] package/quagga: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <652ea16150b070b88447ce786cb8c0b8eb5b18cd.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

quagga has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/quagga/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index 89ff6f2..9a23947 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_QUAGGA
+menuconfig BR2_PACKAGE_QUAGGA
 	bool "quagga"
 	depends on BR2_USE_MMU # fork()
 	help
-- 
1.9.1
