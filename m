From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Aug 2016 18:48:33 +0200
Subject: [Buildroot] [PATCH v2] glibc: add version 2.24
In-Reply-To: <1470407808-26534-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1470407808-26534-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160808164833.GB5876@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2016-08-05 15:36 +0100, Vicente Olivert Riera spake thusly:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v1 -> v2:
>  - Fix type in glibc.hash: 2.23 -> 2.24 (Thanks Khem Raj)
> 
>  package/glibc/Config.in  | 6 ++++++
>  package/glibc/glibc.hash | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index f86822d..a9a6cc7 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -22,6 +22,11 @@ config BR2_GLIBC_VERSION_2_23
>  	# No support for pthread barriers on < v9 ISA
>  	depends on !BR2_sparc
>  
> +config BR2_GLIBC_VERSION_2_24
> +	bool "2.24"
> +	# No support for pthread barriers on < v9 ISA
> +	depends on !BR2_sparc

It shall also depends on kernel headers >= 3.2 for all but x86/x86_64,
as discussed in your previous iteration. Something like:

    depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2 || BR2_i386 || BR2_x86_64

Regards,
Yann E. MORIN.

> +
>  endchoice
>  
>  endif
> @@ -30,3 +35,4 @@ config BR2_GLIBC_VERSION_STRING
>  	string
>  	default "2.22" if BR2_GLIBC_VERSION_2_22
>  	default "2.23" if BR2_GLIBC_VERSION_2_23
> +	default "2.24" if BR2_GLIBC_VERSION_2_24
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> index 052f281..befe80c 100644
> --- a/package/glibc/glibc.hash
> +++ b/package/glibc/glibc.hash
> @@ -1,3 +1,4 @@
>  # Locally calculated after checking pgp signature (glibc)
>  sha256	eb731406903befef1d8f878a46be75ef862b9056ab0cde1626d08a7a05328948	glibc-2.22.tar.xz
>  sha256	94efeb00e4603c8546209cefb3e1a50a5315c86fa9b078b6fad758e187ce13e9	glibc-2.23.tar.xz
> +sha256	99d4a3e8efd144d71488e478f62587578c0f4e1fa0b4eed47ee3d4975ebeb5d3	glibc-2.24.tar.xz
> -- 
> 2.7.3
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
