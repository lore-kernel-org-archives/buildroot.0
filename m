From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 15 May 2014 18:42:11 +0200
Subject: [Buildroot] [PATCH] postgresql: disable spinlock support for
	microblaze (el/be)
Message-ID: <1400172131-724-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.org/results/686/6860988c9edb62d0d32cc6b0bd6af4f35ca0e343/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/postgresql/postgresql.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 2606e25..b331737 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -14,6 +14,10 @@ ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 	POSTGRESQL_CONF_OPT += --disable-thread-safety
 endif
 
+ifeq ($(BR2_microblazeel)$(BR2_microblazebe),y)
+	POSTGRESQL_CONF_OPT += --disable-spinlocks
+endif
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 	POSTGRESQL_DEPENDENCIES += readline
 else
-- 
1.8.1.4
