From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 May 2014 09:54:23 +0200
Subject: [Buildroot] [git commit] postgresql: disable spinlock support for
	microblaze (el/be)
Message-ID: <20140516081754.2039A9CC33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6811423894d350b77db392542d9950f24c2c773e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.org/results/686/6860988c9edb62d0d32cc6b0bd6af4f35ca0e343/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
