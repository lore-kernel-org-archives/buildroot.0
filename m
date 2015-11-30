From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 30 Nov 2015 16:08:57 +0000
Subject: [Buildroot] [PATCH] mplayer: use autodetection for dvdnav
In-Reply-To: <1447927571-38206-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1447927571-38206-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <565C7499.4080808@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ping. This patch is quite trivial, I think.

Regards,

Vincent.

On 19/11/15 10:06, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/mplayer/mplayer.mk |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
> index ad2d9dd..3051afa 100644
> --- a/package/mplayer/mplayer.mk
> +++ b/package/mplayer/mplayer.mk
> @@ -125,9 +125,10 @@ MPLAYER_CONF_OPTS +=  \
>  MPLAYER_DEPENDENCIES += libdvdread
>  endif
>  
> +# We intentionally don't pass --enable-dvdnav to let the autodetection
> +# find which library to link with.
>  ifeq ($(BR2_PACKAGE_LIBDVDNAV),y)
>  MPLAYER_CONF_OPTS +=  \
> -	--enable-dvdnav \
>  	--with-dvdnav-config=$(STAGING_DIR)/usr/bin/dvdnav-config
>  MPLAYER_DEPENDENCIES += libdvdnav
>  endif
> 
