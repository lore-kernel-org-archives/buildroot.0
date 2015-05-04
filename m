From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 May 2015 23:46:01 +0200
Subject: [Buildroot] [PATCH] package/neard: needs shared libs
In-Reply-To: <1430775351-16684-1-git-send-email-yann.morin.1998@free.fr>
References: <1430775351-16684-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150504214601.GB4280@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2015-05-04 23:35 +0200, Yann E. MORIN spake thusly:
> neard uses dlopen(), so needs shared libs.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/0a4/0a466cde55c5e128a2e201924f80f0ec6b8b5c2a/
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Note: the only package that selects neard is connman, and it already
> depends on !static.
> ---
>  package/neard/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/neard/Config.in b/package/neard/Config.in
> index ed20e06..71d979b 100644
> --- a/package/neard/Config.in
> +++ b/package/neard/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_NEARD
>  	depends on BR2_USE_WCHAR # libglib2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl, dbus, libglib2
>  	depends on BR2_USE_MMU # dbus, libglib2
> +	depends on !BR2_STATIC_LIBS # dlopen

I forgot to update the comment... Will resend... Sorry...

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_DBUS
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_LIBNL
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
