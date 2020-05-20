From: Todd Sampson <sampsonats@gmail.com>
Date: Tue, 19 May 2020 22:36:23 -0400
Subject: [Buildroot] Fwd:
 buildroot/outputsupport/dependencies/dependencies.mk:21: target
 'dependencies' does not exist
References: <5ec45209.1c69fb81.c65a5.11fa@mx.google.com>
Message-ID: <7D678328-3BF7-40D5-B2A5-C7E8CF806B52@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> I?m trying to cross-compile MariaDB-connector-c-3.1.8 for use with MySQL 8.19.  I?ve inherited this buildroot environment so I?m not an expert at all.  I?m doing an out of tree build.  In buildroot/packages/usi/MariaDB-connector-c directory are:
>  
> Config.in
> config BR2_PACKAGE_MARIADB_CONNECTOR_C
>        bool "MariaDB Connector/C"
>        # depends on BR2_PACKAGE_OPENSSL
>        help
>          MariaDB Connector/C is used to connect applications developed
>          in C/C++ to MariaDB and MySQL databases.The client library is
>          LGPL licensed.
>          https://mariadb.com/kb/en/library/about-mariadb-connector-c/
>  
> MariaDB-connector-c.mk
> ################################################################################
> #
> # mariadb-connector-c
> #
> ################################################################################
>  
> #MARIADB_CONNECTOR_C_VERSION = 2.3.7
>  
> MARIADB_CONNECTOR_C_VERSION = 3.1.8
>  
> MARIADB_CONNECTOR_C_SITE = https://downloads.mariadb.com/Connectors/c/connector-c-$(MARIADB_CONNECTOR_C_VERSION)
> MARIADB_CONNECTOR_C_SOURCE = mariadb-connector-c-$(MARIADB_CONNECTOR_C_VERSION)-src.tar.gz
> MARIADB_CONNECTOR_C_LICENSE = LGPL-2.0
> MARIADB_CONNECTOR_C_LICENSE_FILES = README COPYING.LIB
> MARIADB_CONNECTOR_C_INSTALL_STAGING = YES
>  
>  
> MARIADB_CONNECTOR_C_DEPENDENCIES = \
> #     openssl \
> #     pthreads
>  
>  
> MARIADB_CONNECTOR_C_CONF_OPTS += \
>        -DSTACK_DIRECTION=-1 \
>        -DCMAKE_CROSSCOMPILING=1 \
>        -DMYSQL_UNIX_ADDR=$(MYSQL_SOCKET) \
>        -DWITH_SSL=OPENSSL \
>        -DWITH_OPENSSL=ON\
>        -DENABLE_DTRACE=0 \
>        -DWITH_UNIT_TESTS=0
>  
>  
> $(eval $(cmake-package))
>  
>  
>  
> When I do a build, I get the following: 
> dfr at cmake:~/m9k/buildroot$ make -w --trace mariadb-connector-c-build
> make: Entering directory '/home/dfr/m9k/buildroot'
> Makefile:84: target '_all' does not exist
> umask 0022 && \
>            make -C /home/dfr/m9k/buildroot --no-print-directory \
>                       mariadb-connector-c-build O=/home/dfr/m9k/buildroot/output
> support/dependencies/dependencies.mk:21: target 'dependencies' does not exist
> MAKE="/usr/bin/make -j3" DL_TOOLS="bzcat gzip svn xzcat" \
>            /home/dfr/m9k/buildroot/support/dependencies/dependencies.sh
> Makefile:81: update target 'mariadb-connector-c-build' due to: _all
> :
> make: Leaving directory '/home/dfr/m9k/buildroot'
>  
>  
> If I build MARIADB_CONNECTOR_C_VERSION = 2.3.7, it works
>  
> If anyone could give me any hints, I?d appreciate it!
>  
>  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200519/990e4abf/attachment.html>
