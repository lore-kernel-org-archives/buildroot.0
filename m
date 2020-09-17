From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Thu, 17 Sep 2020 06:08:00 +0200
Subject: [Buildroot] [PATCH v4 10/12] package/go: add support for IBM s390x
 and Z arch
In-Reply-To: <20200917040802.846896-1-egorenar@linux.ibm.com>
References: <20200917040802.846896-1-egorenar@linux.ibm.com>
Message-ID: <20200917040802.846896-11-egorenar@linux.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 package/go/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 3f16dbaec3..87942c7a1e 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
 		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
-		|| BR2_mips64 || BR2_mips64el
+		|| BR2_mips64 || BR2_mips64el || BR2_s390x
 	depends on !BR2_ARM_CPU_ARMV4
 	# MIPS R6 support in Go has not yet been developed.
 	depends on !BR2_MIPS_CPU_MIPS64R6
-- 
2.26.2
