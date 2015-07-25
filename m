From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2015 23:28:07 +0200
Subject: [Buildroot] [PATCH 1/1] xterm: force detection of libICE
In-Reply-To: <1437749654-29431-1-git-send-email-bas@bmail.ru>
References: <1437749654-29431-1-git-send-email-bas@bmail.ru>
Message-ID: <20150725212807.GD1847@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mikhail, All,

On 2015-07-24 17:54 +0300, kyak spake thusly:
> With some hosts, xterm configure script fails to detect presence of
> libICE. This results in error during xterm linking stage, because -lICE
> is not passed to linker. This patches forces configure script to detect
> libICE.

Could you share the error message you get, with some mor einfo about
your host that exhibit the issue, please?

Also, a defconfig to reproduce the build would be helpful! ;-)

Regards,
Yann E. MORIN.

> Signed-off-by: Mikhail Peselnik <bas@bmail.ru>
> ---
>  package/xterm/xterm.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
> index 56f692d..dd07e35 100644
> --- a/package/xterm/xterm.mk
> +++ b/package/xterm/xterm.mk
> @@ -11,5 +11,6 @@ XTERM_DEPENDENCIES = ncurses xlib_libXaw
>  XTERM_LICENSE = MIT
>  XTERM_LICENSE_FILES = version.c
>  XTERM_CONF_OPTS = --enable-256-color
> +XTERM_CONF_ENV = ac_cv_lib_ICE_IceConnectionNumber=yes
>  
>  $(eval $(autotools-package))
> -- 
> 2.4.6
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
