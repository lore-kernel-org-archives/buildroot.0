From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Sep 2015 23:50:17 +0200
Subject: [Buildroot] [PATCH v2 2/4] package/hplip: Un-deprecate and bump
 version to 3.15.7
In-Reply-To: <1442319834-20549-3-git-send-email-olivier.schonken@gmail.com>
References: <1442319834-20549-1-git-send-email-olivier.schonken@gmail.com>
 <1442319834-20549-3-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20150916235017.13de99e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

On Tue, 15 Sep 2015 14:23:52 +0200, Olivier Schonken wrote:

> diff --git a/package/hplip/hplip.hash b/package/hplip/hplip.hash
> index fb7d4e7..98f4262 100644
> --- a/package/hplip/hplip.hash
> +++ b/package/hplip/hplip.hash
> @@ -1,2 +1,2 @@
>  # Locally computed:
> -sha256  a8122cd824398ac6374154f86152e24fdf5c0100b5c1d6518e853308362e627d  hplip-3.13.10.tar.gz
> +sha256  d310903048f3600f93422e5a8c39ddd682511e0849cd9abc5e943f9a10bdd49d	hplip-3.15.7.tar.gz
> diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
> index 2cdddca..65f57e2 100644
> --- a/package/hplip/hplip.mk
> +++ b/package/hplip/hplip.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -HPLIP_VERSION = 3.13.10
> +HPLIP_VERSION = 3.15.7
>  HPLIP_SITE = http://downloads.sourceforge.net/hplip/hplip
>  HPLIP_AUTORECONF = YES
>  HPLIP_DEPENDENCIES = cups libusb jpeg
> @@ -29,6 +29,8 @@ HPLIP_CONF_OPTS = \
>  	--with-sysroot=$(STAGING_DIR) \
>  	--includedir=$(STAGING_DIR)/usr/include

I never saw this and 0001-fix-make.patch, but it's actually not the
proper solution. --includedir should normally remain /usr/include. But
oh well, it works this way, and it is not changed by your patch, so
let's keep it as is for now.

> +HPLIP_MAKE_OPTS += LDFLAGS+=-lpthread

Why are you adding this? I did a build after removing this line, and it
built fine for me (uClibc toolchain). Could you add a comment above the
line to explain which cases it is fixing?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
