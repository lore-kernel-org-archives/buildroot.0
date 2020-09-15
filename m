From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Sep 2020 09:22:05 -0600
Subject: [Buildroot] [PATCH 1/1] package/meson: support additional cpu
 families
Message-ID: <20200915152205.1249707-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Meson expects known cpu families to be in a normalized format based on
https://mesonbuild.com/Reference-tables.html#cpu-families

Add support for m68k, microblaze and sh4 cpu families.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/meson/meson.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 8633a2f717..8b1bf1e58f 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -25,6 +25,10 @@ else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
 HOST_MESON_TARGET_CPU_FAMILY = aarch64
 else ifeq ($(BR2_i386),y)
 HOST_MESON_TARGET_CPU_FAMILY = x86
+else ifeq ($(BR2_m68k),y)
+HOST_MESON_TARGET_CPU_FAMILY = m68k
+else ifeq ($(BR2_microblazeel)$(BR2_microblazebe),y)
+HOST_MESON_TARGET_CPU_FAMILY = microblaze
 else ifeq ($(BR2_mips)$(BR2_mipsel),y)
 HOST_MESON_TARGET_CPU_FAMILY = mips
 else ifeq ($(BR2_mips64)$(BR2_mips64el),y)
@@ -35,6 +39,8 @@ else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
 HOST_MESON_TARGET_CPU_FAMILY = ppc64
 else ifeq ($(BR2_riscv),y)
 HOST_MESON_TARGET_CPU_FAMILY = riscv64
+else ifeq ($(BR2_sh4)$(BR2_sh4eb)$(BR2_sh4a)$(BR2_sh4aeb),y)
+HOST_MESON_TARGET_CPU_FAMILY = sh4
 else ifeq ($(BR2_sparc),y)
 HOST_MESON_TARGET_CPU_FAMILY = sparc
 else ifeq ($(BR2_sparc64),y)
-- 
2.25.1
