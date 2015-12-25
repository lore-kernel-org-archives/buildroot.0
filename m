From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:12 +0100
Subject: [Buildroot] [PATCH 43/84 RFC] package/squashfs: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <7e96116fcef4a993b17e54d6f0576b3ff8467575.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

squashfs has 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/squashfs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
index 70c0fc9..cec57f9 100644
--- a/package/squashfs/Config.in
+++ b/package/squashfs/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_SQUASHFS
+menuconfig BR2_PACKAGE_SQUASHFS
 	bool "squashfs"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-- 
1.9.1
