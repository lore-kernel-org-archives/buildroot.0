From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Nov 2015 11:20:51 +0100
Subject: [Buildroot] [PATCH v1] x265: needs threads
In-Reply-To: <1446330228-28495-1-git-send-email-ps.report@gmx.net>
References: <1446330228-28495-1-git-send-email-ps.report@gmx.net>
Message-ID: <20151101102051.GA3535@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-10-31 23:23 +0100, Peter Seiderer spake thusly:
> Fixes [1]:
> 
>   build/x265-1.8/source/common/threading.h:34:21: fatal error: pthread.h: No such file or directory
> 
> [1] http://autobuild.buildroot.net/results/261/26134a234be5a67914cde0fb81601f6860d943d2
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/x265/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/x265/Config.in b/package/x265/Config.in
> index 4d202a9..15ae933 100644
> --- a/package/x265/Config.in
> +++ b/package/x265/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_X265
>  	bool "x265"
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	help
>  	  x265 is an open source free software and library for encoding video
>  	  using the High Efficiency Video Coding (HEVC/H.265) standard. x265 is
> @@ -19,5 +20,5 @@ config BR2_PACKAGE_X265_CLI
>  
>  endif
>  
> -comment "x265 needs a toolchain w/ C++"
> -	depends on !BR2_INSTALL_LIBSTDCPP
> +comment "x265 needs a toolchain w/ C++, threads"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> -- 
> 2.1.4
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
