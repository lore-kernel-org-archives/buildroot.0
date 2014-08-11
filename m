From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Aug 2014 22:57:56 +0200
Subject: [Buildroot] [git commit] postgresql: disable spinlock support for
	nios2
Message-ID: <20140811205829.6C7009D419@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf3d9840d7843cdb49a6baff7090a413c3ac4d6f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
	http://autobuild.buildroot.net/results/4d2/4d2f962ae59cfe11fce4d6790dbccfbb527a8f5f/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
