From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jun 2021 22:06:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/proftpd: requires RMD160
 support in openssl
In-Reply-To: <20210613093944.878452-1-fontaine.fabrice@gmail.com>
References: <20210613093944.878452-1-fontaine.fabrice@gmail.com>
Message-ID: <20210613200628.GV168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-13 11:39 +0200, Fabrice Fontaine spake thusly:
> Enable RMD160 in openssl to fix build failure raised since commit
> a83d41867c8d69a77d5cd0a665aa216af5340359
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4c3e7a77d8d6c326135fe467bfcae627df4a9b9b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/proftpd/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
> index 4898f49dd2..83094028a0 100644
> --- a/package/proftpd/Config.in
> +++ b/package/proftpd/Config.in
> @@ -29,6 +29,7 @@ config BR2_PACKAGE_PROFTPD_MOD_REDIS
>  config BR2_PACKAGE_PROFTPD_MOD_SFTP
>  	bool "mod_sftp support"
>  	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
>  	help
>  	  Compile ProFTPD with mod_sftp support
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
