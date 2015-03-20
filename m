From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 14:22:19 +0100
Subject: [Buildroot] [git commit] postgresql: disable spinlock support for
	arcle/arcbe
Message-ID: <20150320132231.D4E09818AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b1d20221e820a20faafa00bbcf0a79761e0f5aa3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.net/results/9b2/9b20513253fa68a3eb5588464a206092bb45e82d
  http://autobuild.buildroot.net/results/8ea/8ea59872bd68d302a11681426a47c70d9aa1475f
  http://autobuild.buildroot.net/results/4a1/4a1cf5721af631e15e076a5bcdd8676839c2a98d
  http://autobuild.buildroot.net/results/050/050a799f2e9e864e02cf75b2a5697ece215ab0a2

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/postgresql.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 7dc3f0b..7bb1678 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -31,7 +31,7 @@ ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 	POSTGRESQL_CONF_OPTS += --disable-thread-safety
 endif
 
-ifeq ($(BR2_microblazeel)$(BR2_microblazebe)$(BR2_nios2)$(BR2_xtensa),y)
+ifeq ($(BR2_arcle)$(BR2_arceb)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_nios2)$(BR2_xtensa),y)
 	POSTGRESQL_CONF_OPTS += --disable-spinlocks
 endif
 
