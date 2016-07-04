From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:02 +0200
Subject: [Buildroot] [PATCH 51/83 v2] package/libiio: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <29812a8a84febb067036a0157e9e0eb636f81d04.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libiio has more than 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libiio/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index 28a43f9..d556293 100644
--- a/package/libiio/Config.in
+++ b/package/libiio/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_LIBIIO
+menuconfig BR2_PACKAGE_LIBIIO
 	bool "libiio"
 	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND if !BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
 	help
-- 
2.7.4
