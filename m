From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jul 2017 18:21:42 +0200
Subject: [Buildroot] [PATCH 085/100] e2fsprogs: remove libintl static
 linking handling
In-Reply-To: <20170704144920.12318-86-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
 <20170704144920.12318-86-thomas.petazzoni@free-electrons.com>
Message-ID: <8dea9469-8b46-ac57-1a31-03103f016919@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-17 16:49, Thomas Petazzoni wrote:
> We no longer support building the full-blown libintl in static linking
> scenarios, as it causes too many problems. Therefore, remove the
> special code in e2fsprogs that was handling this.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/e2fsprogs/e2fsprogs.mk | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
> index 84af7ab..75e9213 100644
> --- a/package/e2fsprogs/e2fsprogs.mk
> +++ b/package/e2fsprogs/e2fsprogs.mk
> @@ -77,12 +77,6 @@ HOST_E2FSPROGS_CONF_ENV += \
>  	ac_cv_header_magic_h=no \
>  	ac_cv_lib_magic_magic_file=no
>  
> -ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE)$(BR2_STATIC_LIBS),yy)
> -# util-linux libuuid pulls in libintl if needed, so ensure we also
> -# link against it, otherwise static linking fails
> -E2FSPROGS_CONF_ENV += LIBS=-lintl
> -endif
> -
>  E2FSPROGS_MAKE_OPTS = LDCONFIG=true
>  
>  E2FSPROGS_INSTALL_STAGING_OPTS = \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
