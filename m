From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2020 18:27:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/kismet: link with libatomic if
 needed
In-Reply-To: <20201016064320.1980661-1-fontaine.fabrice@gmail.com>
References: <20201016064320.1980661-1-fontaine.fabrice@gmail.com>
Message-ID: <20201017162754.GR3466@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-10-16 08:43 +0200, Fabrice Fontaine spake thusly:
> Fix build of kismet-2020-09-R3 with riscv64
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9c3d56ef837c7c5bfbb34a0ec51b349108e201b1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kismet/kismet.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
> index 853dabf106..54d014021f 100644
> --- a/package/kismet/kismet.mk
> +++ b/package/kismet/kismet.mk
> @@ -27,6 +27,10 @@ endif
>  
>  KISMET_CONF_ENV += CXXFLAGS="$(KISMET_CXXFLAGS)"
>  
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +KISMET_CONF_ENV += LIBS=-latomic
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBCAP),y)
>  KISMET_DEPENDENCIES += libcap
>  KISMET_CONF_OPTS += --enable-libcap
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
