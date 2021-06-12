From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 23:40:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/heirloom-mailx: requires DES
 and RC2 support in openssl
In-Reply-To: <20210612210400.546894-1-fontaine.fabrice@gmail.com>
References: <20210612210400.546894-1-fontaine.fabrice@gmail.com>
Message-ID: <20210612214051.GH168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-12 23:04 +0200, Fabrice Fontaine spake thusly:
> Enable DES and RC2 in openssl to fix build failure raised since commit
> a83d41867c8d69a77d5cd0a665aa216af5340359
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2da419416da0cc34b65c89aa966b327640a177e2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/heirloom-mailx/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/heirloom-mailx/Config.in b/package/heirloom-mailx/Config.in
> index 87664b489e..c5b0bcbea7 100644
> --- a/package/heirloom-mailx/Config.in
> +++ b/package/heirloom-mailx/Config.in
> @@ -3,6 +3,8 @@ config BR2_PACKAGE_HEIRLOOM_MAILX
>  	# uses fork()
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2 if BR2_PACKAGE_LIBOPENSSL
>  	help
>  	  Heirloom mailx (previously known as nail) is a mail user
>  	  agent for Unix systems.
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
