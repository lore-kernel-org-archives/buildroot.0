From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 16 Mar 2015 21:55:11 +0200
Subject: [Buildroot] [PATCH] postgresql: disable spinlock for xtensa
Message-ID: <37fe72ab36cbf930531d04106a9402595a4bc5ee.1426535711.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/fbf/fbf601af8b194effcad21a431ca447cb69c2bbd9/
http://autobuild.buildroot.net/results/822/822bd05bcb7384c671bfe13125db3a818982781a/
http://autobuild.buildroot.net/results/4ae/4ae938730a74f2be0f74fef8a99622f8f42742af/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/postgresql/postgresql.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 7ebf79530f62..7dc3f0bf029e 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -31,7 +31,7 @@ ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 	POSTGRESQL_CONF_OPTS += --disable-thread-safety
 endif
 
-ifeq ($(BR2_microblazeel)$(BR2_microblazebe)$(BR2_nios2),y)
+ifeq ($(BR2_microblazeel)$(BR2_microblazebe)$(BR2_nios2)$(BR2_xtensa),y)
 	POSTGRESQL_CONF_OPTS += --disable-spinlocks
 endif
 
-- 
2.1.4
