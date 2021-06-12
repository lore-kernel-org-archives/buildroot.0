From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 14:28:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/netatalk: requires CAST and DES
 support in openssl
In-Reply-To: <20210609215422.1593908-1-fontaine.fabrice@gmail.com>
References: <20210609215422.1593908-1-fontaine.fabrice@gmail.com>
Message-ID: <20210612122818.GS168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-09 23:54 +0200, Fabrice Fontaine spake thusly:
> Enable CAST and DES in openssl to fix build failures raised since commit
> a83d41867c8d69a77d5cd0a665aa216af5340359
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b7347e3e4b828901dcb954f7cc37b712b80ac49b
>  - http://autobuild.buildroot.org/results/453c10ff24ef48f1340ec91412e504fe604033cf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/netatalk/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
> index 1560a18747..9d0a8b2ec4 100644
> --- a/package/netatalk/Config.in
> +++ b/package/netatalk/Config.in
> @@ -9,6 +9,8 @@ config BR2_PACKAGE_NETATALK
>  	select BR2_PACKAGE_LIBEVENT
>  	select BR2_PACKAGE_LIBGCRYPT
>  	select BR2_PACKAGE_LIBGPG_ERROR
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_CAST if BR2_PACKAGE_LIBOPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL

I've moved those 'select' closer to where openssl is itself selected,
otherwise it is a bit confusion...

Regards,
Yann E. MORIN.

>  	help
>  	  Netatalk can be used to turn a *NIX machine into an
>  	  extremely high-performance and reliable file server for
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
