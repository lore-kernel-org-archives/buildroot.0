From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Feb 2020 20:28:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/qpdf: fix comment
In-Reply-To: <20200229190701.3340502-1-fontaine.fabrice@gmail.com>
References: <20200229190701.3340502-1-fontaine.fabrice@gmail.com>
Message-ID: <20200229192812.GU8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-02-29 20:07 +0100, Fabrice Fontaine spake thusly:
> Commit 3f9bcc01b3ef94c8f138b6dccc861d9e222de5ef forgot to update comment
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

BTW, it seems upstream is revising their position on !wchar support:
    https://github.com/qpdf/qpdf/issues/406

Next time we bump, we may be able to drop the dependency. Thanks for
handling that (and fixing up my mess).

Regards,
Yann E. MORIN.

> ---
>  package/qpdf/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qpdf/Config.in b/package/qpdf/Config.in
> index 6f586f651a..56a96e4f41 100644
> --- a/package/qpdf/Config.in
> +++ b/package/qpdf/Config.in
> @@ -15,6 +15,6 @@ config BR2_PACKAGE_QPDF
>  
>  	  http://qpdf.sourceforge.net/
>  
> -comment "qpdf needs a toolchain w/ C++, gcc >= 4.7"
> -	depends on !BR2_INSTALL_LIBSTDCPP || \
> +comment "qpdf needs a toolchain w/ C++, wchar, gcc >= 4.7"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> -- 
> 2.25.0
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
