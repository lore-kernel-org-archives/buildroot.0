From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 13 Jun 2016 08:04:05 +0200
Subject: [Buildroot] [PATCH] gmp: disable ASM for m68k coldfire
Message-ID: <20160613060405.GA7971@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some m68k assembly is used inside gmp, so disable it for
coldfire.

Fixes following autobuild error:
http://autobuild.buildroot.net/results/30ac7b7fdaa51c0fe4fcafbbb558d60cb3d9fe51/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/gmp/gmp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index af6958d..e1d75dc 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -12,8 +12,8 @@ GMP_LICENSE = LGPLv3+
 GMP_LICENSE_FILES = COPYING.LESSERv3
 GMP_DEPENDENCIES = host-m4
 
-# GMP doesn't support assembly for r6 ISA yet
-ifeq ($(BR2_mips_32r6)$(BR2_mips_64r6),y)
+# GMP doesn't support assembly for coldfire or mips r6 ISA yet
+ifeq ($(BR2_m68k_cf)$(BR2_mips_32r6)$(BR2_mips_64r6),y)
 GMP_CONF_OPTS += --disable-assembly
 endif
 
-- 
2.1.4
