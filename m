From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Mar 2014 15:53:08 +0100
Subject: [Buildroot] [PATCH 13/13] package/mmc-utils: requires kernel
	headers >= 3.0
In-Reply-To: <cover.1393685422.git.yann.morin.1998@free.fr>
References: <cover.1393685422.git.yann.morin.1998@free.fr>
Message-ID: <b7fa2d2fad5740da07e89799f6dae15d49d6a209.1393685422.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

mmc-utils needs the mmc ioctls, introduced in linux 3.0.

Fixes:
    http://autobuild.buildroot.net/results/0c1/0c15e2b193418c6f0edbc98a6ea3957bdf71a98b

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/mmc-utils/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mmc-utils/Config.in b/package/mmc-utils/Config.in
index 07650c8..d321800 100644
--- a/package/mmc-utils/Config.in
+++ b/package/mmc-utils/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_MMC_UTILS
 	bool "mmc-utils"
 	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	help
 	  MMC utils
 
 	  https://git.kernel.org/cgit/linux/kernel/git/cjb/mmc-utils.git
 
-comment "mmc-utils needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
+comment "mmc-utils needs a toolchain w/ largefile, headers >= 3.0"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-- 
1.8.3.2
