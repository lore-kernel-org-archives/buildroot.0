From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 21 Sep 2016 18:21:14 +0200
Subject: [Buildroot] [PATCH] circus,
 python-psutil: fix syntax in Config.in
In-Reply-To: <1474474708-4848-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1474474708-4848-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160921162114.GC3405@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rahul, All,

On 2016-09-21 21:48 +0530, Rahul Bedarkar spake thusly:
> After commit ab930190d775 ("python-psutil: not available on musl")
> we are getting following error when we set defconfig
> 
> package/python-psutil/Config.in:14: syntax error
> package/python-psutil/Config.in:13: invalid option
> package/circus/Config.in:21: syntax error
> package/circus/Config.in:20: invalid option
> 
> Fixes: ab930190d775 ("python-psutil: not available on musl")
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/circus/Config.in        | 2 +-
>  package/python-psutil/Config.in | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/circus/Config.in b/package/circus/Config.in
> index 3df41f5..94c59a4 100644
> --- a/package/circus/Config.in
> +++ b/package/circus/Config.in
> @@ -18,5 +18,5 @@ config BR2_PACKAGE_CIRCUS
>  
>  comment "circus needs Python and a uClibc or glibc toolchain w/ C++, wchar, threads"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> -		!BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL \
> +		!BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL || \
>  		!(BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3)
> diff --git a/package/python-psutil/Config.in b/package/python-psutil/Config.in
> index 0b1333c..1aec35d 100644
> --- a/package/python-psutil/Config.in
> +++ b/package/python-psutil/Config.in
> @@ -10,4 +10,4 @@ config BR2_PACKAGE_PYTHON_PSUTIL
>  	  https://pypi.python.org/pypi/psutil
>  
>  comment "python-psutil needs a uClibc or glibc toolchain"
> -	depends BR2_TOOLCHAIN_USES_MUSL
> +	depends on BR2_TOOLCHAIN_USES_MUSL
> -- 
> 2.6.2
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
