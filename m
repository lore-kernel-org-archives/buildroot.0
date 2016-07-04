From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:18 +0200
Subject: [Buildroot] [PATCH 67/83 v2] package/quagga: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <1c6a9715162a6dc1f588e6b2d41dab01ebf5b77e.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

quagga has more than 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/quagga/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index 56b8cad..dd575f8 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_QUAGGA
+menuconfig BR2_PACKAGE_QUAGGA
 	bool "quagga"
 	depends on BR2_USE_MMU # fork()
 	help
-- 
2.7.4
