From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 15:04:46 +0200
Subject: [Buildroot] [PATCH v8 12/12] e2fsprogs: only add -lintl for
 static builds
In-Reply-To: <20170422115955.22718-13-arnout@mind.be>
References: <20170422115955.22718-1-arnout@mind.be>
 <20170422115955.22718-13-arnout@mind.be>
Message-ID: <20170422150446.5596010b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Apr 2017 13:59:55 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:

> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
> index a60c69b395..84af7abab8 100644
> --- a/package/e2fsprogs/e2fsprogs.mk
> +++ b/package/e2fsprogs/e2fsprogs.mk
> @@ -77,17 +77,19 @@ HOST_E2FSPROGS_CONF_ENV += \
>  	ac_cv_header_magic_h=no \
>  	ac_cv_lib_magic_magic_file=no
>  
> -ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
> +ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE)$(BR2_STATIC_LIBS),yy)
>  # util-linux libuuid pulls in libintl if needed, so ensure we also
>  # link against it, otherwise static linking fails
>  E2FSPROGS_CONF_ENV += LIBS=-lintl
>  endif
>  
>  E2FSPROGS_MAKE_OPTS = LDCONFIG=true
> +

Unrelated change.

>  E2FSPROGS_INSTALL_STAGING_OPTS = \
>  	DESTDIR=$(STAGING_DIR) \
>  	LDCONFIG=true \
>  	install-libs
> +

Ditto.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
