From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Mar 2014 23:35:51 +0100
Subject: [Buildroot] [PATCH 1/2] mysql: add option to build the server
In-Reply-To: <1392244774-15356-1-git-send-email-kuyurix@gmail.com>
References: <1392244774-15356-1-git-send-email-kuyurix@gmail.com>
Message-ID: <20140303233551.75c74c6a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marcelo Guti?rrez,

On Wed, 12 Feb 2014 22:39:33 +0000, Marcelo Guti?rrez wrote:
> From: Marcelo Gutierrez <kuyurix@gmail.com>
> 
> 
> Signed-off-by: Marcelo Gutierrez (UTN/FRH) <kuyurix@gmail.com>
> ---
>  package/mysql/Config.in                            |    9 +
>  .../mysql-0003-ac_stack_direction-is-unset.patch   |   15 +
>  .../mysql-0004-Fix-gen_lex_hash-execution.patch    |   32 +
>  ...ql-0005-bison_3_breaks_mysql_server_build.patch | 3310 ++++++++++++++++++++
>  package/mysql/mysql.mk                             |   46 +-
>  5 files changed, 3411 insertions(+), 1 deletion(-)
>  create mode 100644 package/mysql/mysql-0003-ac_stack_direction-is-unset.patch
>  create mode 100644 package/mysql/mysql-0004-Fix-gen_lex_hash-execution.patch
>  create mode 100644 package/mysql/mysql-0005-bison_3_breaks_mysql_server_build.patch

I've applied this, but:

 1/ The package lacks an init script to start the MySQL server
    automatically.

 2/ When mysqld_safe is started automatically, it looks for stuff
    in /usr/var that doesn't exist:

700101 00:00:22 mysqld_safe Starting mysqld daemon with databases from /usr/var
/usr/bin/mysqld_safe: line 595: can't create /usr/var/buildroot.err: nonexistent directory
/usr/bin/mysqld_safe: eval: line 1: can't create /usr/var/buildroot.err: nonexistent directory

 3/ Peter made some comments that have not been addressed. Since the
    patch was large, I thought it would be easier to have it merged
    first, and then do incremental changes.

Could you work on those changes, and submit the corresponding patches?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
