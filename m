From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 23:47:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/znc: requires blowfish support
 in openssl
In-Reply-To: <20210612213624.654663-1-fontaine.fabrice@gmail.com>
References: <20210612213624.654663-1-fontaine.fabrice@gmail.com>
Message-ID: <20210612214751.GK168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-12 23:36 +0200, Fabrice Fontaine spake thusly:
> Enable blowfish in openssl to fix build failure raised since commit
> a83d41867c8d69a77d5cd0a665aa216af5340359
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/600f2b09da919d511df87d3f19fea71149c1260c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/znc/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/znc/Config.in b/package/znc/Config.in
> index 4fc7bbb95b..915b5f632c 100644
> --- a/package/znc/Config.in
> +++ b/package/znc/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_ZNC
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH if BR2_PACKAGE_LIBOPENSSL
>  	help
>  	  Advanced IRC bouncer
>  
> -- 
> 2.30.2
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
