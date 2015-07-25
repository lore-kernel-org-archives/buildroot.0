From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2015 23:38:21 +0200
Subject: [Buildroot] [PATCH] package/kyua: add atf reverse dependency
In-Reply-To: <1437744272-27546-1-git-send-email-romain.naour@openwide.fr>
References: <1437744272-27546-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150725213821.GF1847@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, all,

On 2015-07-24 15:24 +0200, Romain Naour spake thusly:
> atf package depends on BR2_USE_MMU, therefore kyua must
> also depend on it.
> 
> Fixes:
> http://autobuild.buildroot.net/results/929/9290a39d9b77e5a57e59912ce3d901149e9d6c11/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/kyua/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/kyua/Config.in b/package/kyua/Config.in
> index e1bcd48..4f887b0 100644
> --- a/package/kyua/Config.in
> +++ b/package/kyua/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_KYUA
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_PACKAGE_HAS_LUAINTERPRETER # lutok
>  	depends on !BR2_PACKAGE_LUAJIT # lutok
> +	depends on BR2_USE_MMU # atf
>  	select BR2_PACKAGE_ATF
>  	select BR2_PACKAGE_LUTOK
>  	select BR2_PACKAGE_SQLITE
> @@ -18,3 +19,4 @@ config BR2_PACKAGE_KYUA
>  comment "kyua needs a toolchain w/ C++ and full Lua"
>  	depends on !BR2_INSTALL_LIBSTDCPP || BR2_PACKAGE_LUAJIT
>  	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
> +	depends on BR2_USE_MMU
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
