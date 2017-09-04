From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Sep 2017 08:43:13 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] host-mariadb: compile
	against bundled yassl
Message-ID: <20170904205600.B1FC881EC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0813899c435a41240898b94df73c54e8aa8e94f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

On Fedora26, openssl 1.1.x is included by default.  This causes build
errors when building the host variant of mariadb.

Adding -DWITH_SSL=bundled fixes this issue.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 6103ce335acabd8f336f8eb7c239da6f1c080e04)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/mariadb.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index ec41726..d2d55b5 100644
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
