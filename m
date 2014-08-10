From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 10 Aug 2014 20:45:58 +0200
Subject: [Buildroot] [PATCH] postgresql: disable spinlock support for nios2
Message-ID: <1407696358-4451-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
	http://autobuild.buildroot.net/results/4d2/4d2f962ae59cfe11fce4d6790dbccfbb527a8f5f/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/postgresql/postgresql.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 0fecbc7..73762e2 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -16,7 +16,7 @@ ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 	POSTGRESQL_CONF_OPT += --disable-thread-safety
 endif
 
-ifeq ($(BR2_microblazeel)$(BR2_microblazebe),y)
+ifeq ($(BR2_microblazeel)$(BR2_microblazebe)$(BR2_nios2),y)
 	POSTGRESQL_CONF_OPT += --disable-spinlocks
 endif
 
-- 
1.8.1.4
