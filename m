From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Wed, 28 Feb 2018 07:15:27 -0500
Subject: [Buildroot] [PATCH 1/1] postgresql: bump to 10.2
Message-ID: <20180228121527.2556-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
Hi,

It solves the following error met when I tried to compile all qt5 modules,
including the PostgreSQL Plugin (BR2_PACKAGE_QT5BASE_PSQL).

Fixes (with 10.1):

	copy_fetch.c:159:1: error: conflicting types for ?copy_file_range?
	 copy_file_range(const char *path, off_t begin, off_t end, bool trunc)
	 ^~~~~~~~~~~~~~~
	In file included from copy_fetch.c:15:0:
	/home/gportay/src/buildroot-for-int/output-qt5.10-next/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/unistd.h:1110:9:
	note: previous declaration of ?copy_file_range? was here
	 ssize_t copy_file_range (int __infd, __off64_t *__pinoff,
	         ^~~~~~~~~~~~~~~
	<builtin>: recipe for target 'copy_fetch.o' failed
	make[5]: *** [copy_fetch.o] Error 1

Regards,
Gael

 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index e2347701c1..2950470fb9 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,5 +1,5 @@
-# From https://ftp.postgresql.org/pub/source/v10.1/postgresql-10.1.tar.bz2.sha256
-sha256	3ccb4e25fe7a7ea6308dea103cac202963e6b746697366d72ec2900449a5e713	postgresql-10.1.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v10.2/postgresql-10.2.tar.bz2.sha256
+sha256	fe32009b62ddb97f7f014307ce9d0edb6972f5a698e63cb531088e147d145bad	postgresql-10.2.tar.bz2
 
 # License file, Locally calculated
 sha256	7dc8de32741ad1b03e21710771b55a1b9d460671d47f28a8840f917e38c66676	COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 4657489a53..4b2bca714b 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 10.1
+POSTGRESQL_VERSION = 10.2
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.11.0
