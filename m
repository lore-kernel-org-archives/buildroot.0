From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 May 2019 21:39:52 +0200
Subject: [Buildroot] [git commit] postgresql: disable spinlock support for
 nds32
Message-ID: <20190506193621.5153081368@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db64e5ecc3df5f4b464a8e1653382976b5006173
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  - http://autobuild.buildroot.net/results/881318dad8217be0cd0eb18ce3c5ab3aff216272
Signed-off-by: Nylon Chen <nylon7@andestech.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 8f01460109..2f2b49ca24 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -36,7 +36,7 @@ ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 POSTGRESQL_CONF_OPTS += --disable-thread-safety
 endif
 
-ifeq ($(BR2_arcle)$(BR2_arceb)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_or1k)$(BR2_nios2)$(BR2_riscv)$(BR2_xtensa),y)
+ifeq ($(BR2_arcle)$(BR2_arceb)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_or1k)$(BR2_nios2)$(BR2_riscv)$(BR2_xtensa)$(BR2_nds32),y)
 POSTGRESQL_CONF_OPTS += --disable-spinlocks
 endif
 
