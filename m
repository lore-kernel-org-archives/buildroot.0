From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 06 Nov 2012 00:35:51 +0100
Subject: [Buildroot] [PATCH] BR2_PREFER_STATIC_LIB and LDFLAGS+= -static
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C628A986@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C628A986@ex-mb1.corp.adtran.com>
Message-ID: <50984D57.3080402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/05/12 17:55, ANDY KENNEDY wrote:
> The following changes LDFLAGS from += -static to += --static if building
> with BR2_PREFER_STATIC_LIB so that various components actually build
> statically.
>
> Signed-off-by: Andy Kennedy<andy.kennedy@adtran.com>

  Although I'm OK with this patch, I have been unable to reproduce the problem
and I'd like to know why it is going wrong with -static.  Can you post a
defconfig that I can rebuild and that exposes the problem?

  Note: a few autobuilders with BR2_PREFER_STATIC_LIB enabled could be nice -
or maybe not, because many packages _will_break.

  Regards,
  Arnout

> ---
> diff -Naur a/package/Makefile.in b/package/Makefile.in
> --- a/package/Makefile.in       2012-08-31 03:49:41.000000000 -0500
> +++ b/package/Makefile.in       2012-11-05 10:45:45.000000000 -0600
> @@ -299,7 +299,7 @@
>
>   ifeq ($(BR2_PREFER_STATIC_LIB),y)
>   SHARED_STATIC_LIBS_OPTS=--enable-static --disable-shared
> -TARGET_LDFLAGS += -static
> +TARGET_LDFLAGS += --static
>   else
>   SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
>   endif
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
