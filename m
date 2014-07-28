From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Jul 2014 20:53:05 +0200
Subject: [Buildroot] [git commit] postgresql: enable staging installation
Message-ID: <20140728202918.1DDF99D28A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0d7236bd3068da8a527e1b9f1da434790cf09c20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Certain packages need the headers/libraries from Postgresql to build
properly.

[Thomas: slightly reword the commit message.]

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/postgresql.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
