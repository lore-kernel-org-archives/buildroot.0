From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Jan 2020 17:55:17 +0100
Subject: [Buildroot] [PATCH v2] package/bluez-alsa: bump to version 2.0.0
In-Reply-To: <20200108141808.21387-1-joerg.krause@embedded.rocks>
References: <20200108141808.21387-1-joerg.krause@embedded.rocks>
Message-ID: <20200108165517.GA17943@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2020-01-08 15:18 +0100, J?rg Krause spake thusly:
> Version 2.0.0 adds optional support for MP3 with lame and full MPEG
> support with mpg123.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v2:
>  - do not make enabling aplay tool a user choice, but built it by
>    default
> ---
>  package/bluez-alsa/bluez-alsa.hash |  2 +-
>  package/bluez-alsa/bluez-alsa.mk   | 16 +++++++++++++++-
>  2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/package/bluez-alsa/bluez-alsa.hash b/package/bluez-alsa/bluez-alsa.hash
> index afc84329b3..37c4919f91 100644
> --- a/package/bluez-alsa/bluez-alsa.hash
> +++ b/package/bluez-alsa/bluez-alsa.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated:
> -sha256  6287ae6135795a78470068ef9d9ea660d556cefc409905bd9211fda04d1e1f8e  bluez-alsa-1.4.0.tar.gz
> +sha256  451c99c2045a1ec1ffe0d054be4774fbd01af34d6d1a2757d346d02718381697  bluez-alsa-2.0.0.tar.gz
>  sha256  45fe8648faa0e735d4aaf60c32ddd37fc7f027d34ccedcf0f69d8aa961b63b25  LICENSE
> diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
> index 4552be82f3..5c07a1a5e8 100644
> --- a/package/bluez-alsa/bluez-alsa.mk
> +++ b/package/bluez-alsa/bluez-alsa.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BLUEZ_ALSA_VERSION = 1.4.0
> +BLUEZ_ALSA_VERSION = 2.0.0
>  BLUEZ_ALSA_SITE = $(call github,Arkq,bluez-alsa,v$(BLUEZ_ALSA_VERSION))
>  BLUEZ_ALSA_LICENSE = MIT
>  BLUEZ_ALSA_LICENSE_FILES = LICENSE
> @@ -32,6 +32,20 @@ else
>  BLUEZ_ALSA_CONF_OPTS += --disable-aac
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LAME),y)
> +BLUEZ_ALSA_DEPENDENCIES += lame
> +BLUEZ_ALSA_CONF_OPTS += --enable-mp3lame
> +else
> +BLUEZ_ALSA_CONF_OPTS += --disable-mp3lame
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MPG123),y)
> +BLUEZ_ALSA_DEPENDENCIES += mpg123
> +BLUEZ_ALSA_CONF_OPTS += --enable-mpg123
> +else
> +BLUEZ_ALSA_CONF_OPTS += --disable-mpg123
> +endif
> +
>  # no build dependency, disables internal HFP in favor of oFonos HFP profile
>  ifeq ($(BR2_PACKAGE_OFONO),y)
>  BLUEZ_ALSA_CONF_OPTS += --enable-ofono
> -- 
> 2.24.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
