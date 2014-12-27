From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Dec 2014 22:20:10 +0100
Subject: [Buildroot] [PATCHv2 2/2] package/tmux: remove unsafe headers
 path
In-Reply-To: <1419712467-20090-2-git-send-email-romain.naour@openwide.fr>
References: <1419712467-20090-1-git-send-email-romain.naour@openwide.fr>
 <1419712467-20090-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141227212010.GO4098@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2014-12-27 21:34 +0100, Romain Naour spake thusly:
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v2: fix typo (ThomasP)
> 
>  ...01-Makefile.am-remove-unsafe-headers-path.patch | 35 ++++++++++++++++++++++
>  package/tmux/tmux.mk                               |  3 ++
>  2 files changed, 38 insertions(+)
>  create mode 100644 package/tmux/0001-Makefile.am-remove-unsafe-headers-path.patch
> 
> diff --git a/package/tmux/0001-Makefile.am-remove-unsafe-headers-path.patch b/package/tmux/0001-Makefile.am-remove-unsafe-headers-path.patch
> new file mode 100644
> index 0000000..4a20945
> --- /dev/null
> +++ b/package/tmux/0001-Makefile.am-remove-unsafe-headers-path.patch
> @@ -0,0 +1,35 @@
> +From 4095ee95141063ff3f91153e84bd029b019b8dad Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@openwide.fr>
> +Date: Fri, 26 Dec 2014 17:44:15 +0100
> +Subject: [PATCH] Makefile.am: remove unsafe headers path
> +
> +/usr/local/include is probably not needed and it's unsafe for
> +cross-compilation.
> +
> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> +---
> + Makefile.am | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index a9ad5b9..0109e5d 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -38,12 +38,12 @@ else
> + CFLAGS += -O2
> + endif
> + if IS_GCC4
> +-CPPFLAGS += -iquote. -I/usr/local/include
> ++CPPFLAGS += -iquote.
> + if IS_DEBUG
> + CFLAGS += -Wno-pointer-sign
> + endif
> + else
> +-CPPFLAGS += -I. -I- -I/usr/local/include
> ++CPPFLAGS += -I. -I-
> + endif
> + endif
> + 
> +-- 
> +1.9.3
> +
> diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
> index 055e97a..9c8921e 100644
> --- a/package/tmux/tmux.mk
> +++ b/package/tmux/tmux.mk
> @@ -10,4 +10,7 @@ TMUX_LICENSE = ISC
>  TMUX_LICENSE_FILES = README
>  TMUX_DEPENDENCIES = libevent ncurses host-pkgconf
>  
> +# we patch Makefile.am
> +TMUX_AUTORECONF = YES
> +
>  $(eval $(autotools-package))
> -- 
> 1.9.3
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
