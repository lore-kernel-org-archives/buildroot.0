From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:25 +0200
Subject: [Buildroot] [PATCH 74/83 v2] package/valgrind: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <f9e6b28c599181da60c61b72ba1292025fbbd412.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Valgrind has more than 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/valgrind/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
index 40e219d..d38f3fa 100644
--- a/package/valgrind/Config.in
+++ b/package/valgrind/Config.in
@@ -1,7 +1,7 @@
 comment "valgrind needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
-config BR2_PACKAGE_VALGRIND
+menuconfig BR2_PACKAGE_VALGRIND
 	bool "valgrind"
 	depends on BR2_ARM_CPU_ARMV7A || BR2_i386 || \
 		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
-- 
2.7.4
