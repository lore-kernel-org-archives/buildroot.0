From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 22:00:14 +0100
Subject: [Buildroot] [git commit] postgresql: disable spinlock for xtensa
Message-ID: <20150316210303.0E307817E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ebbf2e5c55fb11a7c828ffc7a93c9ef7a800c6b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/fbf/fbf601af8b194effcad21a431ca447cb69c2bbd9/
http://autobuild.buildroot.net/results/822/822bd05bcb7384c671bfe13125db3a818982781a/
http://autobuild.buildroot.net/results/4ae/4ae938730a74f2be0f74fef8a99622f8f42742af/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/postgresql.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 7ebf795..7dc3f0b 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -31,7 +31,7 @@ ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 	POSTGRESQL_CONF_OPTS += --disable-thread-safety
 endif
 
-ifeq ($(BR2_microblazeel)$(BR2_microblazebe)$(BR2_nios2),y)
+ifeq ($(BR2_microblazeel)$(BR2_microblazebe)$(BR2_nios2)$(BR2_xtensa),y)
 	POSTGRESQL_CONF_OPTS += --disable-spinlocks
 endif
 
