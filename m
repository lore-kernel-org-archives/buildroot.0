From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 Jan 2015 17:17:04 +0100
Subject: [Buildroot] [PATCH v2 0/2] Portability fixes for "make
 menuconfig"
In-Reply-To: <1420145678-11134-1-git-send-email-bjorn.forsman@gmail.com>
References: <1420145678-11134-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <20150102161704.GG4392@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bj?rn, All,

On 2015-01-01 21:54 +0100, Bj?rn Forsman spake thusly:
> Here are two portability fixes needed to be able to run "make menuconfig" on
> NixOS[1].
> 
> [1]: http://nixos.org/
> 
> Bj?rn Forsman (2):
>   kconfig/lxdialog: get ncurses CFLAGS with pkg-config
>   Makefile: pass host PKG_CONFIG_PATH at "make menuconfig" time

I think the order should be the other way around, because you need the
latter for the former to work.

Regards,
Yann E. MORIN.

>  Makefile                                           |  6 ++-
>  ...dialog-get-ncurses-CFLAGS-with-pkg-config.patch | 50 ++++++++++++++++++++++
>  support/kconfig/patches/series                     |  1 +
>  3 files changed, 56 insertions(+), 1 deletion(-)
>  create mode 100644 support/kconfig/patches/17-kconfig-lxdialog-get-ncurses-CFLAGS-with-pkg-config.patch
> 
> -- 
> Changes v1 -> v2:
>   - make the kconfig/lxdialog patch a separate patch file, instead of modifying
>     the kconfig sources (which are synced with linux from time to time).
>     Suggested by Thomas P.
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
