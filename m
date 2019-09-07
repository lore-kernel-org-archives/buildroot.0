From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 15:03:04 +0200
Subject: [Buildroot] [git commit] package/gmp: enable C++ support when
 BR2_INSTALL_LIBSTDCPP=y
Message-ID: <20190907125851.C1B478C03B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1abb95c97665778acc76b3fa1a61c2f44af46f52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gmp has optional C++ support, which is disabled by default. Let's
enabled it conditionally depending on the BR2_INSTALL_LIBSTDCPP
option.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gmp/gmp.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 7236e37bb4..d124463a98 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -19,5 +19,11 @@ ifeq ($(BR2_m68k_cf)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6)$(BR2_ARM_CP
 GMP_CONF_OPTS += --disable-assembly
 endif
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+GMP_CONF_OPTS += --enable-cxx
+else
+GMP_CONF_OPTS += --disable-cxx
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
