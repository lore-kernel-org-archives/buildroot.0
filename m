From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Mar 2020 17:59:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/dav1d: needs dynamic library
In-Reply-To: <20200321163316.139938-1-fontaine.fabrice@gmail.com>
References: <20200321163316.139938-1-fontaine.fabrice@gmail.com>
Message-ID: <20200321165950.GE4290@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-03-21 17:33 +0100, Fabrice Fontaine spake thusly:
> dav1d needs dynamic library since version 0.6.0 and
> https://github.com/videolan/dav1d/commit/6b611d36acab8ce1afdd528599322bb6b2d28727
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c82b6e3c1cf968c644f3dee376b16760fb4593bb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/dav1d/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dav1d/Config.in b/package/dav1d/Config.in
> index 00d2fd17f1..fb2902558f 100644
> --- a/package/dav1d/Config.in
> +++ b/package/dav1d/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_DAV1D
>  	bool "dav1d"
> +	depends on !BR2_STATIC_LIBS # dlfcn.h
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # pthread
>  	help
>  	  dav1d is a new AV1 cross-platform decoder, open-source, and
> @@ -7,5 +8,5 @@ config BR2_PACKAGE_DAV1D
>  
>  	  https://code.videolan.org/videolan/dav1d
>  
> -comment "dav1d needs a toolchain w/ threads"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +comment "dav1d needs a toolchain w/ threads, dynamic library"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> -- 
> 2.25.1
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
