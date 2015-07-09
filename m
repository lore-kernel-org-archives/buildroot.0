From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Thu, 09 Jul 2015 12:42:07 +0200
Subject: [Buildroot] [PATCH 0/7] Set of patches to add MariaDB galera
	cluster
In-Reply-To: <1435929086-21205-1-git-send-email-sylvain.raybaud@green-communications.fr>
References: <1435929086-21205-1-git-send-email-sylvain.raybaud@green-communications.fr>
Message-ID: <559E4FFF.4090002@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi

Thanks for your feedback. I'm working now on v2.

Cheers,

Sylvain

On 03/07/2015 15:11, Sylvain Raybaud wrote:
> Add MariaDB Galera Cluster as an alternative implementation of
> MySQL, inside package/mysql. Also add galera which is needed for
> running a cluster and check on which galera depends. Introduce a
> few other minor modifications to busybox.config and libaio.mk
> necessary to make this work.
> 
> Sylvain Raybaud (7): Add package check: unit test library Add rule
> to build host-libaio Add package galera: wsrep provider for mysql
> and mariadb Add PKG_CONFIG_* variables to help cmake find
> host-packages Add fancy options to busybox sleep, like float
> arguments Move mysql patches to version specific subdirectory 
> Propose mariadb galera cluster as an alternative to standard mysql 
> implementation, inside msyql package
> 
> package/Config.in                                  |   2 + 
> package/busybox/busybox.config                     |   4 +- 
> package/check/Config.in                            |   7 + 
> package/check/check.hash                           |   2 + 
> package/check/check.mk                             |  20 ++ 
> package/galera/Config.in                           |   9 + 
> ...lera-01-fix_sconstruct_for-crosscompiling.patch |  52 +++++ 
> package/galera/galera.hash                         |   2 + 
> package/galera/galera.mk                           |  63 ++++++ 
> package/libaio/libaio.mk                           |   1 + 
> .../mariadb-galera-01-fix_xtradb_cmakelist.patch   |  27 +++ 
> .../mariadb-galera-02-fix_innodb_cmakelist.patch   | 251
> +++++++++++++++++++++ package/mysql/{ =>
> 5.1}/0000-ac_cache_check.patch  |   0 .../{ =>
> 5.1}/0001-configure-ps-cache-check.patch  |   0 .../{ =>
> 5.1}/0002-use-new-readline-iface.patch    |   0 
> .../0003-ac_stack_direction-is-unset.patch         |   0 
> .../0004-Fix-gen_lex_hash-execution.patch          |   0 
> .../0005-bison_3_breaks_mysql_server_build.patch   |   0 .../{ =>
> 5.1}/0006-no-force-static-build.patch     |   0 
> package/mysql/Config.in                            |  43 +++- 
> package/mysql/mariadb-galera-cluster.cnf           | 204
> +++++++++++++++++ package/mysql/mysql.hash
> |   2 + package/mysql/mysql.mk                             | 216
> +++++++++++++++--- package/pkg-cmake.mk
> |   2 + 24 files changed, 869 insertions(+), 38 deletions(-) create
> mode 100644 package/check/Config.in create mode 100644
> package/check/check.hash create mode 100644 package/check/check.mk 
> create mode 100644 package/galera/Config.in create mode 100644
> package/galera/galera-01-fix_sconstruct_for-crosscompiling.patch 
> create mode 100644 package/galera/galera.hash create mode 100644
> package/galera/galera.mk create mode 100644
> package/mysql/10.0.17/mariadb-galera-01-fix_xtradb_cmakelist.patch 
> create mode 100644
> package/mysql/10.0.17/mariadb-galera-02-fix_innodb_cmakelist.patch 
> rename package/mysql/{ => 5.1}/0000-ac_cache_check.patch (100%) 
> rename package/mysql/{ => 5.1}/0001-configure-ps-cache-check.patch
> (100%) rename package/mysql/{ =>
> 5.1}/0002-use-new-readline-iface.patch (100%) rename
> package/mysql/{ => 5.1}/0003-ac_stack_direction-is-unset.patch
> (100%) rename package/mysql/{ =>
> 5.1}/0004-Fix-gen_lex_hash-execution.patch (100%) rename
> package/mysql/{ =>
> 5.1}/0005-bison_3_breaks_mysql_server_build.patch (100%) rename
> package/mysql/{ => 5.1}/0006-no-force-static-build.patch (100%) 
> create mode 100644 package/mysql/mariadb-galera-cluster.cnf
> 

- -- 
Sylvain Raybaud
www.green-communications.fr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVnk//AAoJEEkkwl4JtJ9yY6QP/is7LgHwpoAIdASFBJYs+FRg
e1EVRzB9NDBOitmWpAJCVIH8xmFMBKeq4TNsQTTXT0DE+95z9npwQ2uxmun+G5/I
SXShmcN1CM4JU9mRNsSJ45O9x6zCIG/YeXplgePKdIutef6pekbYCkGXcIqqD5/t
/WOHEmFIojuX+LjNuYih0fxKq4VQPrDudhbT/nxz0smFE+B0ci7RA6a4dJOhy4tx
hAq0VIJhPUoOyeM2xMWcChNHz+6pMGB29CJfccsJ99wcC9FvjDhSHDqwDWs8TuGu
YBuDLvrEzSsZ5dH8hO88eSN+eadPwHW1pJBTlxw3D6f1naknihdT4m5zf7Jo2Fic
MV8NOWigxE7+rJSK0k5DmyzZe+5EU6/k+0k72ZV2LfUZX+RgCTYyP5TLULS3lhF5
YSKtVhHcXVCxN8zd8QyB9H+8lGp9XZL7ml8Q95ahoM3Xt2hfCw2mLJ1RMMOdP5Af
Ilww0Bas0OGVc6jzRbaKE99HcBBamKCuGISBRSrjmPGSeoGFIEDZMZX0ocLu10zu
jfengk7WjVPSDCh5laiYggXVkii7zbF9I3ydNgmgw/oY5km1xNhsNWQ2J/oPhw8j
/xjDTqcTv9SyW1lmE+6nIsYCVN1fXWgYEPt5+OFWhQCHX91ynqHbeDx3WH1Ls4JR
xDG2zFEXKrbEpVwigMe5
=so17
-----END PGP SIGNATURE-----
