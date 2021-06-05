From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Jun 2021 12:52:06 +0200
Subject: [Buildroot] [PATCH next] package/libssh2: requires RIPEMD160 in
 openssl
In-Reply-To: <2a3232b207a3fc5f9f7c21a1fc923096aca662cf.1622790019.git.baruch@tkos.co.il>
References: <2a3232b207a3fc5f9f7c21a1fc923096aca662cf.1622790019.git.baruch@tkos.co.il>
Message-ID: <20210605105206.GO168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2021-06-04 10:00 +0300, Baruch Siach spake thusly:
> Enable RIPEMD160 in openssl for libssh2 to avoid link time failure.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c6e031fca123865138d18c96d895778c03b639be/
> http://autobuild.buildroot.net/results/4284098c0f29fdb7a4df9acbc23986e685c542d2/
> http://autobuild.buildroot.net/results/a457bf27dfc0029cbfc2fdbf371aad1e2efa5b83/
> 
> Cc: Matt Weber <matthew.weber@collins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libssh2/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libssh2/Config.in b/package/libssh2/Config.in
> index 90c38813b35f..ce2dd303fa35 100644
> --- a/package/libssh2/Config.in
> +++ b/package/libssh2/Config.in
> @@ -27,6 +27,7 @@ config BR2_PACKAGE_LIBSSH2_LIBGCRYPT
>  config BR2_PACKAGE_LIBSSH2_OPENSSL
>  	bool "openssl"
>  	depends on BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
>  
>  endchoice
>  endif
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
