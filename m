From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 29 Jul 2017 00:05:25 +0200
Subject: [Buildroot] [git commit] host-mariadb: compile against bundled yassl
Message-ID: <20170728223914.8512582122@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6103ce335acabd8f336f8eb7c239da6f1c080e04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On Fedora26, openssl 1.1.x is included by default.  This causes build
errors when building the host variant of mariadb.

Adding -DWITH_SSL=bundled fixes this issue.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mariadb/mariadb.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 1d6c2bc..db538fd 100644
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
