From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Sep 2015 22:25:05 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/gdb (7.9): remove
 documentation
In-Reply-To: <1441531217-21814-1-git-send-email-romain.naour@openwide.fr>
References: <1441531217-21814-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150906202505.GC3580@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-09-06 11:20 +0200, Romain Naour spake thusly:
> If makeinfo is not found in the system then the missing
> script is used to warn the user.
> 
> Before commit e30465112ed4c6320dd19107302057a5f7712cf2 the missing
> script returned 0 after printing the message.
> 
> Now, missing return 127 (command not found) to the Makefile and
> the build fail.
> 
> As suggested [1], disable the documentation by removing "doc"
> directory from SUBDIRS.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2015-September/138824.html
> 
> Fixes:
> http://autobuild.buildroot.net/results/dee/dee1326baf26ad1eb6e12a7d033428eca50d00bc/build-end.log
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  .../gdb/7.9.1/0004-gdb-disable-documentation.patch | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/gdb/7.9.1/0004-gdb-disable-documentation.patch
> 
> diff --git a/package/gdb/7.9.1/0004-gdb-disable-documentation.patch b/package/gdb/7.9.1/0004-gdb-disable-documentation.patch
> new file mode 100644
> index 0000000..c04ff50
> --- /dev/null
> +++ b/package/gdb/7.9.1/0004-gdb-disable-documentation.patch
> @@ -0,0 +1,43 @@
> +From 5b7cb9de2cebb6a26ad649dfef346b43e0cacfbb Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@openwide.fr>
> +Date: Sun, 6 Sep 2015 10:54:28 +0200
> +Subject: [PATCH] gdb: disable documentation
> +
> +If makeinfo is not found in the system then the missing
> +script is used to warn the user.
> +
> +Before commit e30465112ed4c6320dd19107302057a5f7712cf2 the missing
> +script returned 0 after printing the message.
> +
> +Now, missing return 127 (command not found) to the Makefile and
> +the build fail.
> +
> +As suggested [1], disable the documentation by removing "doc"
> +directory from SUBDIRS.
> +
> +[1] http://lists.busybox.net/pipermail/buildroot/2015-September/138824.html
> +
> +Fixes:
> +http://autobuild.buildroot.net/results/dee/dee1326baf26ad1eb6e12a7d033428eca50d00bc/build-end.log
> +
> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> +---
> + gdb/Makefile.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gdb/Makefile.in b/gdb/Makefile.in
> +index 7937801..f4da17e 100644
> +--- a/gdb/Makefile.in
> ++++ b/gdb/Makefile.in
> +@@ -1065,7 +1065,7 @@ COMMON_OBS = $(DEPFILES) $(CONFIG_OBS) $(YYOBJ) \
> + 
> + TSOBS = inflow.o
> + 
> +-SUBDIRS = doc @subdirs@ data-directory $(GNULIB_BUILDDIR)
> ++SUBDIRS = @subdirs@ data-directory $(GNULIB_BUILDDIR)
> + CLEANDIRS = $(SUBDIRS)
> + 
> + # List of subdirectories in the build tree that must exist.
> +-- 
> +2.4.3
> +
> -- 
> 2.4.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
