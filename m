From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:32 +0100
Subject: [Buildroot] [PATCH 40/80 v1] package/e2fsprogs: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <e4a93180e10be81e1c637e267eef90e2d62d2511.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

e2fsprogs has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/e2fsprogs/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index ad33983..dd426b0 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -1,5 +1,4 @@
-
-config BR2_PACKAGE_E2FSPROGS
+menuconfig BR2_PACKAGE_E2FSPROGS
 	bool "e2fsprogs"
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_USE_MMU # util-linux/libblkid
-- 
1.9.1
