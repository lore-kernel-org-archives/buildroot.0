From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 20 Oct 2019 00:31:07 +0200
Subject: [Buildroot] [PATCH 3/3] package/gcc: or1k allow gcc 9.2 with
 uClibc-ng
In-Reply-To: <20191019223107.1301848-1-romain.naour@gmail.com>
References: <20191019223107.1301848-1-romain.naour@gmail.com>
Message-ID: <20191019223107.1301848-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Binutils 2.32 and GCC 9.2 are now fixed thanks to Stafford Horne.

https://mailman.uclibc-ng.org/pipermail/devel/2019-August/001895.html

Fixes:
https://mailman.uclibc-ng.org/pipermail/devel/2019-August/001885.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/gcc/Config.in.host | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 3772125f71..1e26e747be 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -61,9 +61,6 @@ config BR2_GCC_VERSION_9_X
 	bool "gcc 9.x"
 	# or1k needs binutils >= 2.32
 	depends on !(BR2_or1k && BR2_BINUTILS_VERSION_2_31_X)
-	# uClibc doesn't build with upstream or1k gcc
-	# https://mailman.uclibc-ng.org/pipermail/devel/2019-August/001885.html
-	depends on !(BR2_or1k && BR2_TOOLCHAIN_USES_UCLIBC)
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_powerpc_SPE
-- 
2.23.0
