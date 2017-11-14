From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Nov 2017 23:12:26 +0100
Subject: [Buildroot] [PATCH] genimage: change upstream URL
In-Reply-To: <20171114174651.12184-1-vivien.didelot@savoirfairelinux.com>
References: <20171114174651.12184-1-vivien.didelot@savoirfairelinux.com>
Message-ID: <1f1f2eba-dfd9-c253-34c1-1902c7d934ce@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-11-17 18:46, Vivien Didelot wrote:
> Pengutronix moved the official genimage repository to Github.
> 
> This patch updates the official URL from the package description. The
> sources from Github do not include the configure script so update the
> sha256 hash and set GENIMAGE_AUTORECONF to execute ./autogen.sh first.

 Since the archive still exists on Pengutronix, and there it's an .xz instead of
a .gz, and that archive doesn't need to be AUTORECONF'ed, I think it's better to
stick with the original archive.

 Changing the upstream URL in Config.in is still relevant though.

 Regards,
 Arnout

> 
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> ---
>  package/genimage/Config.in.host | 2 +-
>  package/genimage/genimage.hash  | 2 +-
>  package/genimage/genimage.mk    | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/genimage/Config.in.host b/package/genimage/Config.in.host
> index 5c5a8a8a2c..cf831a143c 100644
> --- a/package/genimage/Config.in.host
> +++ b/package/genimage/Config.in.host
> @@ -10,4 +10,4 @@ config BR2_PACKAGE_HOST_GENIMAGE
>  	  environment variables, the config file or commandline
>  	  switches.
>  
> -	  http://www.pengutronix.de/software/genimage/
> +	  https://github.com/pengutronix/genimage
> diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
> index 4be2fca873..0c304629c7 100644
> --- a/package/genimage/genimage.hash
> +++ b/package/genimage/genimage.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256	69f35af7edf6f4dbdac7a18ddc69dcf38c501e43d8b50c524555754c51479078	genimage-9.tar.xz
> +sha256 c5f6063cab834cd9a6d484c5773430f68cb61aa7203c8270c9e42dac2a0461f0        genimage-v9.tar.gz
> diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
> index 2e7aad20c6..913d745cec 100644
> --- a/package/genimage/genimage.mk
> +++ b/package/genimage/genimage.mk
> @@ -4,11 +4,11 @@
>  #
>  ################################################################################
>  
> -GENIMAGE_VERSION = 9
> -GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
> -GENIMAGE_SITE = http://www.pengutronix.de/software/genimage/download
> +GENIMAGE_VERSION = v9
> +GENIMAGE_SITE = $(call github,pengutronix,genimage,$(GENIMAGE_VERSION))
>  HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
>  GENIMAGE_LICENSE = GPL-2.0
>  GENIMAGE_LICENSE_FILES = COPYING
> +GENIMAGE_AUTORECONF = YES
>  
>  $(eval $(host-autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
