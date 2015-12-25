From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:27 +0100
Subject: [Buildroot] [PATCH 58/84 RFC] package/libiio: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <461560b47ef355d59932bd8f02d2b5b0aa72e350.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libiio has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libiio/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index 99da4c1..7112fc5 100644
--- a/package/libiio/Config.in
+++ b/package/libiio/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_LIBIIO
+menuconfig BR2_PACKAGE_LIBIIO
 	bool "libiio"
 	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND if !BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
 	help
-- 
1.9.1
