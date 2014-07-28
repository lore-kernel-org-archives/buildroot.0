From: Nathaniel Roach <nroach44@gmail.com>
Date: Mon, 28 Jul 2014 19:57:28 +0800
Subject: [Buildroot] [PATCH 1/2] Postgresql: Enable staging install for
	packages that need it to build
Message-ID: <1406548649-4649-1-git-send-email-nroach44@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
---
 package/postgresql/postgresql.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index b331737..0fecbc7 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -10,6 +10,8 @@ POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
 POSTGRESQL_LICENSE_FILES = COPYRIGHT
 
+POSTGRESQL_INSTALL_STAGING = YES
+
 ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 	POSTGRESQL_CONF_OPT += --disable-thread-safety
 endif
-- 
2.0.1
