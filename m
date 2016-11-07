From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 7 Nov 2016 22:06:23 +0100
Subject: [Buildroot] [PATCH v4 01/22] Use already qstripped
 BR2_TOOLCHAIN_EXTERNAL_PREFIX everywhere
In-Reply-To: <20161107012017.22505-2-arnout@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
 <20161107012017.22505-2-arnout@mind.be>
Message-ID: <7db0a4e3-9316-f3f7-f62a-d5d27ba2fa73@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 07/11/2016 ? 02:19, Arnout Vandecappelle (Essensium/Mind) a ?crit :
> The BR2_TOOLCHAIN_EXTERNAL_PREFIX variable is already qstripped and
> stored in the TOOLCHAIN_EXTERNAL_PREFIX variable in
> toolchain-external.mk, so use this variable everywhere.
> 
> This will be useful for a later patch that makes the derivation of
> TOOLCHAIN_EXTERNAL_PREFIX a little more complex.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> [Arnout: split off into separate patch]
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> ---
> v4: split off into separate patch [Arnout]
> ---
>  package/Makefile.in  | 2 +-
>  package/wine/wine.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 5d591e9..bd73219 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -184,7 +184,7 @@ endif
>  ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
>  TARGET_CROSS = $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-
>  else
> -TARGET_CROSS = $(HOST_DIR)/usr/bin/$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))-
> +TARGET_CROSS = $(HOST_DIR)/usr/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
>  endif
>  
>  # Define TARGET_xx variables for all common binutils/gcc
> diff --git a/package/wine/wine.mk b/package/wine/wine.mk
> index d9a0ecf..47ba90a 100644
> --- a/package/wine/wine.mk
> +++ b/package/wine/wine.mk
> @@ -34,7 +34,7 @@ WINE_CONF_OPTS = \
>  # wrapper believes what the real gcc is named, and force the tuple of
>  # the external toolchain, not the one we compute in GNU_TARGET_NAME.
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
> -WINE_CONF_OPTS += TARGETFLAGS="-b $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))"
> +WINE_CONF_OPTS += TARGETFLAGS="-b $(TOOLCHAIN_EXTERNAL_PREFIX)"
>  endif
>  
>  ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_SEQ)$(BR2_PACKAGE_ALSA_LIB_RAWMIDI),yyy)
> 
