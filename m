From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 15:01:07 +0100
Subject: [Buildroot] [git commit] mysql: rename package to oracle-mysql,
	make a virtual package
Message-ID: <20161217140139.2F7AA81841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d707d2b4fa6362cb37754f6c5fbb06240f5faf5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit turns mysql into a virtual package, after renaming the
original mysql package to oracle-mysql. This way, all existing packages
that "depends on" or "select" BR2_PACKAGE_MYSQL continue to work with no
modification.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |   1 -
 package/mariadb/Config.in                          |  32 -----
 package/mariadb/mariadb.mk                         |   1 +
 package/mysql/Config.in                            |  74 ++++++++++--
 package/mysql/mysql.mk                             | 130 +--------------------
 .../0000-ac_cache_check.patch                      |   0
 .../0001-configure-ps-cache-check.patch            |   0
 .../0002-use-new-readline-iface.patch              |   0
 .../0003-ac_stack_direction-is-unset.patch         |   0
 .../0004-Fix-gen_lex_hash-execution.patch          |   0
 .../0005-bison_3_breaks_mysql_server_build.patch   |   0
 .../0006-no-force-static-build.patch               |   0
 .../0007-dont-install-in-mysql-directory.patch     |   0
 package/{mysql => oracle-mysql}/S97mysqld          |   0
 package/{mysql => oracle-mysql}/mysqld.service     |   0
 .../mysql.hash => oracle-mysql/oracle-mysql.hash}  |   0
 .../mysql.mk => oracle-mysql/oracle-mysql.mk}      |  67 +++++------
 17 files changed, 102 insertions(+), 203 deletions(-)

Patch is too large, so refusing to show it
