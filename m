From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:45 +0100
Subject: [Buildroot] [PATCH 53/80 v1] package/libiio: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <1f6029929a0cf7a099ea6bf215661018bec31744.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libiio has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
