From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 20 Oct 2018 22:22:19 +0200
Subject: [Buildroot] [PATCH 1/1] postgresql: disable spinlock support for
 riscv64
Message-ID: <20181020202219.24489-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/deebc4b8f615e1216279d6587e91f5654da2ad68

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/postgresql/postgresql.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 540e1540ca..8b3fd6f439 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -29,7 +29,7 @@ ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 POSTGRESQL_CONF_OPTS += --disable-thread-safety
 endif
 
-ifeq ($(BR2_arcle)$(BR2_arceb)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_or1k)$(BR2_nios2)$(BR2_xtensa),y)
+ifeq ($(BR2_arcle)$(BR2_arceb)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_or1k)$(BR2_nios2)$(BR2_RISCV_64)$(BR2_xtensa),y)
 POSTGRESQL_CONF_OPTS += --disable-spinlocks
 endif
 
-- 
2.17.1
