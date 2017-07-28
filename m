From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 28 Jul 2017 06:44:40 -0400
Subject: [Buildroot] [PATCH 1/1] host-mariadb: compile against bundled yassl
Message-ID: <20170728104440.12303-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fedora26, openssl 1.1.x is included by default.  This causes build errors
when building the host variant of mariadb.

Addings -DWITH_SSL=bundled fixes this issue.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/mariadb/mariadb.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 1d6c2bcc4..db538fd0f 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -67,6 +67,8 @@ MARIADB_CONF_OPTS += \
 	-DMYSQL_DATADIR=/var/lib/mysql \
 	-DMYSQL_UNIX_ADDR=$(MYSQL_SOCKET)
 
+HOST_MARIADB_CONF_OPTS += -DWITH_SSL=bundled
+
 # Some helpers must be compiled for host in order to crosscompile mariadb for
 # the target. They are then included by import_executables.cmake which is
 # generated during the build of the host helpers. It is not necessary to build
-- 
2.13.3
