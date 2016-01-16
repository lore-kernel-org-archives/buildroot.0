From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:38:05 +0100
Subject: [Buildroot] [PATCH 73/80 v1] package/valgrind: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <573b39eb146c817af85d03914e0d14617db4bfd5.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Valgrind has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/valgrind/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
index 21b2608..ce5c3b4 100644
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
1.9.1
