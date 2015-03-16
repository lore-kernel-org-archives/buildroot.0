From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 16 Mar 2015 20:59:25 +0100
Subject: [Buildroot] [PATCH v1] postgresql: disable spinlock support for
	xtensa
Message-ID: <1426535965-13596-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/4ae/4ae938730a74f2be0f74fef8a99622f8f42742af

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Patch depends on [v3,3/8] postgresql: enable bfin compile
https://patchwork.ozlabs.org/patch/448690/
---
 package/postgresql/postgresql.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 76b19d5..7d4bb58 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -36,7 +36,7 @@ ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 	POSTGRESQL_CONF_OPTS += --disable-thread-safety
 endif
 
-ifeq ($(BR2_bfin)$(BR2_microblazebe)$(BR2_microblazeel)$(BR2_nios2),y)
+ifeq ($(BR2_bfin)$(BR2_microblazebe)$(BR2_microblazeel)$(BR2_nios2)$(BR2_xtensa),y)
 	POSTGRESQL_CONF_OPTS += --disable-spinlocks
 endif
 
-- 
2.1.4
