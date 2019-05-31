From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 23:00:42 +0200
Subject: [Buildroot] [git commit branch/next] package/glibc: add C-SKY
 specific version
Message-ID: <20190531210133.E846B8D48D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=634255f84c01aa7dfe4f59349d4b9e03495731e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/7630ed2fa60caea98f500e4a7a51b88f9bf1e176/glibc.hash | 2 ++
 package/glibc/glibc.mk                                            | 3 +++
 toolchain/toolchain-buildroot/Config.in                           | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/glibc/7630ed2fa60caea98f500e4a7a51b88f9bf1e176/glibc.hash b/package/glibc/7630ed2fa60caea98f500e4a7a51b88f9bf1e176/glibc.hash
new file mode 100644
index 0000000000..a61bd65f80
--- /dev/null
+++ b/package/glibc/7630ed2fa60caea98f500e4a7a51b88f9bf1e176/glibc.hash
@@ -0,0 +1,2 @@
+# Locally calculated (fetched from https://github.com/c-sky/glibc)
+sha512 9deb2deceefe347d72de13510a5baa3de00f94c684f3b25e136ca3660f61e65a69f2115abb488c2ab0fa93cda8535853ce1e13e186efcc8434ecc4049efd82b5  glibc-7630ed2fa60caea98f500e4a7a51b88f9bf1e176.tar.gz
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 9cfca73e85..26873f3101 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -10,6 +10,9 @@ GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VE
 else ifeq ($(BR2_RISCV_32),y)
 GLIBC_VERSION = 06983fe52cfe8e4779035c27e8cc5d2caab31531
 GLIBC_SITE = $(call github,riscv,riscv-glibc,$(GLIBC_VERSION))
+else ifeq ($(BR2_csky),y)
+GLIBC_VERSION = 7630ed2fa60caea98f500e4a7a51b88f9bf1e176
+GLIBC_SITE = $(call github,c-sky,glibc,$(GLIBC_VERSION))
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index beb17a218b..d9f16e2a3a 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -48,7 +48,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
 		   BR2_riscv       || BR2_sh         || BR2_sparc64     || \
 		   BR2_x86_64      || BR2_microblaze || BR2_nios2       || \
-		   (BR2_arcle && BR2_ARC_ATOMIC_EXT)
+		   (BR2_arcle && BR2_ARC_ATOMIC_EXT) || BR2_csky
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
