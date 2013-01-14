From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 14 Jan 2013 18:51:51 +0000
Subject: [Buildroot] [PATCH][poke] BR2_PREFER_STATIC_LIB and LDFLAGS+=
	-static
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C628A986@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C628A986@ex-mb1.corp.adtran.com>
Message-ID: <F9C551623D2CBB4C9488801D14F864C610BB3983@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

I just pulled the latest snapshot (buildroot-20130114.tar.bz2), did a
quick grep to see if the patch was applied:

buildroot/package# grep static *
Makefile.in:SHARED_STATIC_LIBS_OPTS=--enable-static --disable-shared
Makefile.in:TARGET_LDFLAGS += -static
Makefile.in:SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
pkg-autotools.mk:               --enable-shared --disable-static \

and see that it wasn't.  Is it on anyone's tree right now or did it
get lost in the shuffle?

Thanks!
Andy

> -----Original Message-----
> From: ANDY KENNEDY
> Sent: Monday, November 05, 2012 10:55 AM
> To: 'buildroot at busybox.net'
> Subject: [PATCH] BR2_PREFER_STATIC_LIB and LDFLAGS+= -static
> 
> The following changes LDFLAGS from += -static to += --static if building
> with BR2_PREFER_STATIC_LIB so that various components actually build
> statically.
> 
> Signed-off-by: Andy Kennedy <andy.kennedy@adtran.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> diff -Naur a/package/Makefile.in b/package/Makefile.in
> --- a/package/Makefile.in       2012-08-31 03:49:41.000000000 -0500
> +++ b/package/Makefile.in       2012-11-05 10:45:45.000000000 -0600
> @@ -299,7 +299,7 @@
> 
>  ifeq ($(BR2_PREFER_STATIC_LIB),y)
>  SHARED_STATIC_LIBS_OPTS=--enable-static --disable-shared
> -TARGET_LDFLAGS += -static
> +TARGET_LDFLAGS += --static
>  else
>  SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
>  endif
> 
