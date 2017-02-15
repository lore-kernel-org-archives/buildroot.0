From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 22:34:44 +0100
Subject: [Buildroot] [git commit] postgresql: disable spinlocks on openrisc
Message-ID: <20170215213527.2D4ED82227@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ae3dce5275915a1784b00bf145af907827fed0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just like all non-mainstream architectures, postgresql doesn't provide
its internal spinlock implementation on OpenRISC, so disable it.

Fixes:

  http://autobuild.buildroot.net/results/e9de750e34f10c4a2403696936260ad1547d0d15/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/postgresql.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 786ef48..bc2bf47 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -29,7 +29,7 @@ ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 POSTGRESQL_CONF_OPTS += --disable-thread-safety
 endif
 
-ifeq ($(BR2_arcle)$(BR2_arceb)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_nios2)$(BR2_xtensa),y)
+ifeq ($(BR2_arcle)$(BR2_arceb)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_or1k)$(BR2_nios2)$(BR2_xtensa),y)
 POSTGRESQL_CONF_OPTS += --disable-spinlocks
 endif
 
