From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Aug 2020 14:26:55 +0200
Subject: [Buildroot] [PATCH] package/efl: avoid optimization flags added
 by meson
In-Reply-To: <20200808094230.1593546-1-romain.naour@gmail.com>
References: <20200808094230.1593546-1-romain.naour@gmail.com>
Message-ID: <20200808122655.GP2186@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-08-08 11:42 +0200, Romain Naour spake thusly:
> Efl's meson build system add some optimization flags related to cpu
> architecture [1]. In the context of Buildroot, such optimization flags
> are already provided by the toolchain wrapper.
> 
> For ppc, efl's meson expect the altivec support is available but this is
> not the case for ppc e500 cpus.
> 
> Disable native-arch-optimization option to avoid such issue.
> 
> [1] https://git.enlightenment.org/core/efl.git/tree/meson.build?h=v1.24.3#n165
> 
> Fixes:
> http://autobuild.buildroot.net/results/dd2586be32c25d93eebfaa743c1f7d36915bb0d7
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/efl/efl.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/efl/efl.mk b/package/efl/efl.mk
> index 6dc38b1626..b8c4a506ad 100644
> --- a/package/efl/efl.mk
> +++ b/package/efl/efl.mk
> @@ -29,6 +29,7 @@ EFL_DEPENDENCIES = host-pkgconf host-efl host-luajit dbus freetype \
>  # elua=true: build elua for the target.
>  # sdl=false: disable sdl2 support.
>  # embedded-lz4=false: use liblz4 from lz4 package.
> +# native-arch-optimization=false: avoid optimization flags added by meson.
>  # network-backend=none: disable connman networkmanager.
>  EFL_CONF_OPTS = \
>  	-Davahi=false \
> @@ -39,6 +40,7 @@ EFL_CONF_OPTS = \
>  	-Delua=true \
>  	-Dembedded-lz4=false \
>  	-Dlua-interpreter=luajit \
> +	-Dnative-arch-optimization=false \
>  	-Dnetwork-backend=none \
>  	-Dpixman=false \
>  	-Dsdl=false \
> -- 
> 2.25.4
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
