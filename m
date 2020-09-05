From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Sep 2020 23:31:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/mg: fix build with gcc 10
In-Reply-To: <20200905125444.568775-1-fontaine.fabrice@gmail.com>
References: <20200905125444.568775-1-fontaine.fabrice@gmail.com>
Message-ID: <20200905213114.GF14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-09-05 14:54 +0200, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/aacc02abf41e120e0d0b22faa38642e6d149d73f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, after slightly editing the patch now that it is
merged upstream. Thanks!

Regards,
Yann E. MORIN.

> ---
>  ...0001-src-def.h-fix-build-with-gcc-10.patch | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/mg/0001-src-def.h-fix-build-with-gcc-10.patch
> 
> diff --git a/package/mg/0001-src-def.h-fix-build-with-gcc-10.patch b/package/mg/0001-src-def.h-fix-build-with-gcc-10.patch
> new file mode 100644
> index 0000000000..7823d5b6c5
> --- /dev/null
> +++ b/package/mg/0001-src-def.h-fix-build-with-gcc-10.patch
> @@ -0,0 +1,36 @@
> +From 29c83c917bd4f5d0c37ff0ab5da1a85762bd5530 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 5 Sep 2020 14:50:20 +0200
> +Subject: [PATCH] src/def.h: fix build with gcc 10
> +
> +Define hlp as extern to avoid the following build failure with gcc 10
> +(which defaults to -fno-common):
> +
> +  CCLD     mg
> +/home/buildroot/autobuild/run/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: mg-bell.o:(.bss+0x0): multiple definition of `hlp'; mg-basic.o:(.bss+0x0): first defined here
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/aacc02abf41e120e0d0b22faa38642e6d149d73f
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/troglobit/mg/pull/7]
> +---
> + src/def.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/def.h b/src/def.h
> +index e4c049c..cd59725 100644
> +--- a/src/def.h
> ++++ b/src/def.h
> +@@ -650,7 +650,7 @@ int		 excline(char *);
> + char		*skipwhite(char *);
> + 
> + /* help.c X */
> +-const char	*hlp;
> ++extern const char	*hlp;
> + int		 desckey(int, int);
> + int		 wallchart(int, int);
> + int		 help_help(int, int);
> +-- 
> +2.28.0
> +
> -- 
> 2.28.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
