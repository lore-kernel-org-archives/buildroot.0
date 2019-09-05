From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Thu,  5 Sep 2019 15:40:40 +0200
Subject: [Buildroot] [PATCH] package:gmp: enable C++ support when
 BR2_INSTALL_LIBSTDCPP=y
Message-ID: <1567690842-33954-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

gmp has a optional and disable by default, option to add C++ support.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gmp/gmp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 7236e37bb4..3e375a12e7 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -19,5 +19,9 @@ ifeq ($(BR2_m68k_cf)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6)$(BR2_ARM_CP
 GMP_CONF_OPTS += --disable-assembly
 endif
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+GMP_CONF_OPTS += --enable-cxx
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.21.0
