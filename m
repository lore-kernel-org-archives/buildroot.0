From: Steve Calfee <stevecalfee@gmail.com>
Date: Tue, 8 Aug 2017 08:47:34 -0700
Subject: [Buildroot] Mysqld startup problems
In-Reply-To: <ba440c62-d192-435f-2b3f-099611dd88fd@mind.be>
References: <CAJJ6jxuKy46_6sk=J9XsRuo8JXnBgyFk1A076cie+C5p=uDwPw@mail.gmail.com>
 <ba440c62-d192-435f-2b3f-099611dd88fd@mind.be>
Message-ID: <CAJJ6jxs0YL9hEumc5xwLYdTU0d6iM3CVtSyLiAMVM_9U0S1Erg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, thanks for trying to help.

On Tue, Aug 8, 2017 at 8:30 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>  Hi Steve,
>
>  No reason to send this twice :-)

Sorry, I did not receive anything from the list from my send, so I
thought maybe gmail sent html mail and maybe it got dropped.


>
> On 08-08-17 17:10, Steve Calfee wrote:
>> Hi, I am trying to upgrade to the latest buildroot from I think it was
>> 2016.08. As an intermediate step, while waiting for 2017.08, I am
>> upgrading to 2017.05.02.
>>
>> Everything builds fine, it boots and runs ok.
>>
>> But mysqld did not get started. I did have it working before. I know
>> something was done with the mariadb and mysql becoming virtual
>> packages, but I am not sure what.
>
>  Since the new oracle-mysql package does seem to get built, the virtual package
> itself can't be the issue.
>
>  I also don't see any other change since 2016.08 that could be relevant.
>
>> The problem I see is S97mysqld wants
>> to start /usr/bin/mysqld_safe and mysqld_safe is not installed
>> anywhere in the target.
>
>  That is indeed a problem... Could you see what the package *does* install? Just
> 'grep ^oracle-mysql output/build/packages-file-list.txt'.


grep ^oracle-mysql output/build/packages-file-list.txt
oracle-mysql,./usr/bin/mysqlslap
oracle-mysql,./usr/include/mysql/mysql_com.h
oracle-mysql,./usr/include/mysql/my_getopt.h
oracle-mysql,./usr/lib/libdbug.a
oracle-mysql,./usr/lib/libmysqlclient_r.la
oracle-mysql,./usr/include/mysql/mysql.h
oracle-mysql,./usr/share/mysql/mysql_test_data_timezone.sql
oracle-mysql,./usr/include/mysql/plugin.h
oracle-mysql,./usr/bin/mysql
oracle-mysql,./usr/include/mysql/mysqld_ername.h
oracle-mysql,./usr/bin/mysqld_multi
oracle-mysql,./usr/bin/mysql_setpermission
oracle-mysql,./usr/include/mysql/my_global.h
oracle-mysql,./usr/share/mysql/mysql.server
oracle-mysql,./usr/include/mysql/m_string.h
oracle-mysql,./usr/include/mysql/m_ctype.h
oracle-mysql,./usr/bin/mysqlhotcopy
oracle-mysql,./usr/bin/mysql_fix_privilege_tables
oracle-mysql,./usr/include/mysql/my_config.h
oracle-mysql,./usr/bin/mysqlbug
oracle-mysql,./usr/bin/mysql_config
oracle-mysql,./usr/include/mysql/sslopt-vars.h
oracle-mysql,./usr/include/mysql/my_list.h
oracle-mysql,./usr/bin/mysql_waitpid
oracle-mysql,./usr/share/mysql/config.small.ini
oracle-mysql,./usr/lib/libmysqlclient.so.16.0.0
oracle-mysql,./usr/bin/msql2mysql
oracle-mysql,./usr/include/mysql/mysql_version.h
oracle-mysql,./usr/bin/my_print_defaults
oracle-mysql,./usr/include/mysql/my_attribute.h
oracle-mysql,./usr/include/mysql/my_sys.h
oracle-mysql,./usr/bin/mysql_secure_installation
oracle-mysql,./usr/include/mysql/sslopt-longopts.h
oracle-mysql,./usr/include/mysql/decimal.h
oracle-mysql,./usr/share/mysql/my-innodb-heavy-4G.cnf
oracle-mysql,./usr/lib/libmystrings.a
oracle-mysql,./usr/share/mysql/my-small.cnf
oracle-mysql,./usr/lib/libmysys.a
oracle-mysql,./usr/include/mysql/sql_common.h
oracle-mysql,./usr/include/mysql/mysql_time.h
oracle-mysql,./usr/share/mysql/config.medium.ini
oracle-mysql,./usr/share/mysql/mysql_system_tables.sql
oracle-mysql,./usr/bin/mysqlimport
oracle-mysql,./usr/share/mysql/my-huge.cnf
oracle-mysql,./usr/bin/mysql_find_rows
oracle-mysql,./usr/bin/mysql_convert_table_format
oracle-mysql,./usr/include/mysql/my_compiler.h
oracle-mysql,./usr/bin/replace
oracle-mysql,./usr/bin/mysql_client_test
oracle-mysql,./usr/bin/perror
oracle-mysql,./usr/share/mysql/mysql_fix_privilege_tables.sql
oracle-mysql,./usr/lib/libmysqlclient_r.so.16.0.0
oracle-mysql,./usr/bin/mysql_zap
oracle-mysql,./usr/bin/mysqlshow
oracle-mysql,./usr/bin/mysqlcheck
oracle-mysql,./usr/share/mysql/ndb-config-2-node.ini
oracle-mysql,./usr/bin/mysqldump
oracle-mysql,./usr/share/mysql/mysqld_multi.server
oracle-mysql,./usr/include/mysql/typelib.h
oracle-mysql,./usr/include/mysql/my_xml.h
oracle-mysql,./usr/include/mysql/my_dir.h
oracle-mysql,./usr/share/mysql/my-medium.cnf
oracle-mysql,./usr/bin/mysqlaccess
oracle-mysql,./usr/include/mysql/keycache.h
oracle-mysql,./usr/bin/resolveip
oracle-mysql,./usr/include/mysql/my_no_pthread.h
oracle-mysql,./usr/include/mysql/my_alloc.h
oracle-mysql,./usr/bin/mysqltest
oracle-mysql,./usr/share/mysql/config.huge.ini
oracle-mysql,./usr/bin/mysqlbinlog
oracle-mysql,./usr/bin/resolve_stack_dump
oracle-mysql,./usr/share/mysql/mysql-log-rotate
oracle-mysql,./usr/bin/mysqldumpslow
oracle-mysql,./usr/share/aclocal/mysql.m4
oracle-mysql,./usr/bin/mysql_upgrade
oracle-mysql,./usr/include/mysql/mysqld_error.h
oracle-mysql,./usr/share/mysql/binary-configure
oracle-mysql,./usr/bin/innochecksum
oracle-mysql,./usr/share/mysql/fill_help_tables.sql
oracle-mysql,./usr/include/mysql/my_dbug.h
oracle-mysql,./usr/include/mysql/sql_state.h
oracle-mysql,./usr/bin/mysqladmin
oracle-mysql,./usr/lib/libmysqlclient.la
oracle-mysql,./usr/share/mysql/my-large.cnf
oracle-mysql,./usr/include/mysql/errmsg.h
oracle-mysql,./usr/include/mysql/sslopt-case.h
oracle-mysql,./usr/include/mysql/mysql_embed.h
oracle-mysql,./usr/bin/mysql_fix_extensions
oracle-mysql,./usr/share/mysql/mysql_system_tables_data.sql
oracle-mysql,./usr/include/mysql/my_pthread.h
oracle-mysql,./usr/include/mysql/my_net.h





>
>> So I would appreciate any tips on where to look.
>>
>> Thanks, Steve
>>
>> Here is my dockstar_glibc_buildroot_defconfig
>
>  I'll try to build with this defconfig when I find the time. However:
>
>>
>> BR2_arm=y
>> BR2_TOOLCHAIN_EXTERNAL=y
>> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>> BR2_TOOLCHAIN_EXTERNAL_PATH="$(TOPDIR)/../new_sept_2014_tools/output/host/usr"
>
>  I obviously can't use this toolchain, but I would be surprised if that were the
> issue.

Yes, it is a buildroot built toolchain, which I use as an external for
faster "clean" rebuild times.

>
>> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-linux"
>> BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
>> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
>> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
>> BR2_TOOLCHAIN_EXTERNAL_CXX=y
>> BR2_PACKAGE_HOST_GDB=y
>> BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY=y
>> BR2_TARGET_GENERIC_HOSTNAME="dockstar"
>> BR2_TARGET_GENERIC_ISSUE="Welcome to Steve's Dockstar"
>> BR2_ROOTFS_DEVICE_TABLE="$(BR2_EXTERNAL)/seagatedockstar/device_table.txt"
>> BR2_GENERATE_LOCALE="en_US.UTF-8"
>> BR2_ROOTFS_OVERLAY="$(BR2_EXTERNAL)/seagatedockstar/skeleton"
>> BR2_ROOTFS_POST_BUILD_SCRIPT="$(BR2_EXTERNAL)/seagatedockstar/patchrootfs.sh"
>
>  This script doesn't happen to remove mysqld_safe, does it? :-)

No the script just copies stuff into /etc. It may be obsolete now,
buildroot may do the copy automatically.

>
> [snip]
>> There are quite a few warnings in the server build, but no errors that
>> I can see:
>
>  Please use a pastebin for such huge output.
>
> [snip]
>>>>> oracle-mysql 5.1.73 Autoreconfiguring
>> aclocal: warning: autoconf input should be named 'configure.ac', not
>> 'configure.in'
>
>  Autoreconf often gives a lot of warnings, they can be ignored.
>
>  Regards,
>  Arnout
>

Thanks for trying to help,

Steve
