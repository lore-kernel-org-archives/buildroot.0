From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:45 +0200
Subject: [Buildroot] [PATCH 16/69] gmp: add explicit dependencies for host
	variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-17-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/gmp/gmp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 09753a016bdd..45571900cd99 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -11,6 +11,7 @@ GMP_INSTALL_STAGING = YES
 GMP_LICENSE = LGPLv3+
 GMP_LICENSE_FILES = COPYING.LESSERv3
 GMP_DEPENDENCIES = host-m4
+HOST_GMP_DEPENDENCIES = host-m4
 
 # GMP doesn't support assembly for coldfire or mips r6 ISA yet
 ifeq ($(BR2_m68k_cf)$(BR2_mips_32r6)$(BR2_mips_64r6),y)
-- 
2.1.0
