From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:46 +0100
Subject: [Buildroot] [PATCH 77/84 RFC] package/quagga: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <a5597bc5618aeb2a09d1caaf4d87e0c964ac28be.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

quagga has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
