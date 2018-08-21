From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Aug 2018 00:11:41 +0200
Subject: [Buildroot] [PATCH next 2/4] e2fsprogs: build shared library
 for the host
In-Reply-To: <20180821215954.11971-3-thomas.petazzoni@bootlin.com>
References: <20180821215954.11971-1-thomas.petazzoni@bootlin.com>
 <20180821215954.11971-3-thomas.petazzoni@bootlin.com>
Message-ID: <20180821221141.GU15347@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-08-21 23:59 +0200, Thomas Petazzoni spake thusly:
> By default, the e2fsprogs package builds and installs only static
> libraries, unless --enable-elf-shlibs is passed. For the target
> variant, we pass the appropriate
> --enable-elf-shlibs/--disable-elf-shlibs options, but not for the host
> package, and therefore static e2fsprogs libraries get installed.
> 
> However, on the host, our policy is to build shared libraries and not
> static libraries, as visible in the default configure options passed
> to host package in pkg-autotools.mk (--enable-shared
> --disable-static). Let's do the same with e2fsprogs.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/e2fsprogs/e2fsprogs.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
> index efc10d0e99..65f9774afb 100644
> --- a/package/e2fsprogs/e2fsprogs.mk
> +++ b/package/e2fsprogs/e2fsprogs.mk
> @@ -27,7 +27,8 @@ HOST_E2FSPROGS_CONF_OPTS = \
>  	--disable-libblkid \
>  	--disable-libuuid \
>  	--enable-symlink-install \
> -	--disable-testio-debug
> +	--disable-testio-debug \
> +	--enable-elf-shlibs

I lknow this is not your fault, but I find it more readable when the
--disable are all grouped together, and the --enable ones as well.

It also helps spot potentialy issues when the ordering is the same btw
host and target variants.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  # Set the binary directories to "/bin" and "/sbin", as busybox does,
>  # so that we do not end up with two versions of e2fs tools.
> -- 
> 2.14.4
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
