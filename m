From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:28 +0200
Subject: [Buildroot] [PATCH 77/83 v2] package/xenomai: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <b39c7bc19949d28214781ef38a88fad0a6cd3693.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Xenomai has 5-or-more options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/xenomai/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index d4c8a89..3736303 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -3,7 +3,7 @@ comment "xenomai needs a toolchain w/ threads"
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || \
 		   BR2_bfin || BR2_powerpc || BR2_sh4
 
-config BR2_PACKAGE_XENOMAI
+menuconfig BR2_PACKAGE_XENOMAI
 	bool "Xenomai Userspace"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || \
-- 
2.7.4
