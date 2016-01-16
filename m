From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:38:02 +0100
Subject: [Buildroot] [PATCH 70/80 v1] package/squashfs: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <b16eb49a7db06eda7eae73565722ac81361f6e31.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

squashfs has 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
