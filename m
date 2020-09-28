From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Sep 2020 23:14:57 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/meson: support
 additional cpu families
Message-ID: <20200928211203.A898C8E1BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f774a3b730e268f55d1a1db4102730a1f421c6aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Meson expects known cpu families to be in a normalized format based on
https://mesonbuild.com/Reference-tables.html#cpu-families

Add support for m68k, microblaze and sh4 cpu families.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2f5a26630c189f0dd518006b6df2b184f3c94e48)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/meson/meson.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index d5b1e86811..445e3f557c 100644
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
