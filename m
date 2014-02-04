From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 04 Feb 2014 10:59:29 +0100
Subject: [Buildroot] [PATCH 1/3] gnupg: depend on libiconv if appropriate
In-Reply-To: <BLU0-SMTP112B1A733C43DA19ABF8DF9D9CE0@phx.gbl>
References: <BLU0-SMTP112B1A733C43DA19ABF8DF9D9CE0@phx.gbl>
Message-ID: <52F0BA01.5020806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/12/13 18:57, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Ideally, the explanation that you put in the follow-up message should be
in the commit log, but OK.

 Regards,
 Arnout

> ---
>  package/gnupg/gnupg.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
> index 39a37d0..c334ac6 100644
> --- a/package/gnupg/gnupg.mk
> +++ b/package/gnupg/gnupg.mk
> @@ -9,7 +9,7 @@ GNUPG_SOURCE = gnupg-$(GNUPG_VERSION).tar.bz2
>  GNUPG_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
>  GNUPG_LICENSE = GPLv3+
>  GNUPG_LICENSE_FILES = COPYING
> -GNUPG_DEPENDENCIES = zlib ncurses
> +GNUPG_DEPENDENCIES = zlib ncurses $(if $(BR2_PACKAGE_LIBICONV),libiconv)
>  GNUPG_CONF_ENV = ac_cv_sys_symbol_underscore=no
>  GNUPG_CONF_OPT = --disable-rpath --enable-minimal --disable-regex
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
