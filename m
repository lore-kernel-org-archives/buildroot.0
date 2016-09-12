From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon, 12 Sep 2016 15:05:50 -0700
Subject: [Buildroot] [PATCH 0/1] [RFC] replace mysql with mariadb 10.0
Message-ID: <20160912220551.17934-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch represents my attempt to replace the aging mysql 5.1 that is
currently shipped with Buildroot. I am replacing mysql altogether with mariadb
version 10.0. I have been able to test this with both an arm and a x86_64
build. I have not tested it with systemd. This patch is based on the work done
by Sylvain Raybaud.

Ryan Coe (1):
  mysql: replace mysql with mariadb 10.0

 package/Config.in                                  |    2 +-
 package/mysql/0000-ac_cache_check.patch            |  156 -
 package/mysql/0001-configure-ps-cache-check.patch  |   39 -
 package/mysql/0001-fix_xtradb_cmakelist.patch      |   38 +
 package/mysql/0002-use-new-readline-iface.patch    |   21 -
 .../mysql/0003-ac_stack_direction-is-unset.patch   |   15 -
 .../mysql/0004-Fix-gen_lex_hash-execution.patch    |   32 -
 .../0005-bison_3_breaks_mysql_server_build.patch   | 3310 --------------------
 package/mysql/0006-no-force-static-build.patch     |   18 -
 .../0007-dont-install-in-mysql-directory.patch     |  182 --
 package/mysql/Config.in                            |   17 +-
 package/mysql/S97mysqld                            |  102 +-
 package/mysql/my.cnf                               |  179 ++
 package/mysql/mysql.hash                           |    4 +-
 package/mysql/mysql.mk                             |  183 +-
 package/mysql/mysqld.service                       |    4 +-
 16 files changed, 392 insertions(+), 3910 deletions(-)
 delete mode 100644 package/mysql/0000-ac_cache_check.patch
 delete mode 100644 package/mysql/0001-configure-ps-cache-check.patch
 create mode 100644 package/mysql/0001-fix_xtradb_cmakelist.patch
 delete mode 100644 package/mysql/0002-use-new-readline-iface.patch
 delete mode 100644 package/mysql/0003-ac_stack_direction-is-unset.patch
 delete mode 100644 package/mysql/0004-Fix-gen_lex_hash-execution.patch
 delete mode 100644 package/mysql/0005-bison_3_breaks_mysql_server_build.patch
 delete mode 100644 package/mysql/0006-no-force-static-build.patch
 delete mode 100644 package/mysql/0007-dont-install-in-mysql-directory.patch
 create mode 100644 package/mysql/my.cnf

-- 
2.9.3
