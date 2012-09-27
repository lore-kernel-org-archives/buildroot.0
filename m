From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 27 Sep 2012 23:40:54 +0200
Subject: [Buildroot] [PATCHv2 4/4] iw: pkg-config nitpicking
In-Reply-To: <1348656522-13698-4-git-send-email-gustavo@zacarias.com.ar>
References: <1348656522-13698-1-git-send-email-gustavo@zacarias.com.ar>
 <1348656522-13698-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <5064C7E6.3080005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/09/12 12:48, Gustavo Zacarias wrote:
> Since we're now using pkgconf with a wrapper script we no longer need to
> pass PKG_CONFIG_PATH to pkg-config to do the right thing.
> Also point PKG_CONFIG to PKG_CONFIG_HOST_BINARY rather than the
> hardcoded option.
>
> Signed-off-by: Gustavo Zacarias<gustavo@zacarias.com.ar>
> ---
>   package/iw/iw.mk |    4 +---
>   1 files changed, 1 insertions(+), 3 deletions(-)
>
> diff --git a/package/iw/iw.mk b/package/iw/iw.mk
> index b1a86b3..af11140 100644
> --- a/package/iw/iw.mk
> +++ b/package/iw/iw.mk
> @@ -9,9 +9,7 @@ IW_SOURCE = iw-$(IW_VERSION).tar.bz2
>   IW_SITE = http://wireless.kernel.org/download/iw
>   IW_DEPENDENCIES = host-pkgconf libnl
>   IW_CONFIG = $(IW_DIR)/.config
> -IW_MAKE_ENV = PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
> -	PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
> -	GIT_DIR=$(IW_DIR)
> +IW_MAKE_ENV = PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)"
>
>   ifeq ($(BR2_PREFER_STATIC_LIB),y)
>   # libnl needs pthread/m, so we need to explicitly with them when static

Doesn't removing GIT_DIR break version.sh?

Regards,
Arnout

-- 

Arnout Vandecappelle             arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . +32-16-286540 . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 31BB CF53 8660 6F88 345D 54CC A836 5879 20D7 CF43
