From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 13:57:18 +0200
Subject: [Buildroot] [PATCH 1/2] packages: VERSION should reflect tag
	name
In-Reply-To: <1413715784-17421-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413715784-17421-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141019115718.GU4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-10-19 12:49 +0200, Maxime Hadjinlian spake thusly:
> As stated in the manual, for the github helper, the VERSION should value
> either a tag or a full commit ID.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/bmon/bmon.mk   | 4 ++--
>  package/geoip/geoip.mk | 4 ++--
>  package/lxc/lxc.mk     | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
> index d4c7a49..dc00d82 100644
> --- a/package/bmon/bmon.mk
> +++ b/package/bmon/bmon.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -BMON_VERSION = 3.2
> -BMON_SITE = $(call github,tgraf,bmon,v$(BMON_VERSION))
> +BMON_VERSION = v3.2
> +BMON_SITE = $(call github,tgraf,bmon,$(BMON_VERSION))

That's also a case where:
  - the package has a new release, 3.5
  - there is a release tarball, so we should not use the github helper

>  # configure not shipped
>  BMON_AUTORECONF = YES
>  BMON_DEPENDENCIES = host-pkgconf libconfuse libnl ncurses
> diff --git a/package/geoip/geoip.mk b/package/geoip/geoip.mk
> index bbfa014..869cc5e 100644
> --- a/package/geoip/geoip.mk
> +++ b/package/geoip/geoip.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -GEOIP_VERSION = 1.6.0
> +GEOIP_VERSION = v1.6.0
>  GEOIP_SOURCE = GeoIP-$(GEOIP_VERSION).tar.gz
> -GEOIP_SITE = $(call github,maxmind,geoip-api-c,v$(GEOIP_VERSION))
> +GEOIP_SITE = $(call github,maxmind,geoip-api-c,$(GEOIP_VERSION))

Ditto:
  - release 1.6.2 is out
  - there is a release tarball

>  GEOIP_AUTORECONF = YES
>  GEOIP_INSTALL_STAGING = YES
>  GEOIP_LICENSE = LGPLv2.1+
> diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
> index 38bda7e..953df13 100644
> --- a/package/lxc/lxc.mk
> +++ b/package/lxc/lxc.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -LXC_VERSION = 1.0.4
> -LXC_SITE = $(call github,lxc,lxc,lxc-$(LXC_VERSION))
> +LXC_VERSION = lxc-1.0.4o

There's also a new release: 1.0.6.

> +LXC_SITE = $(call github,lxc,lxc,$(LXC_VERSION))
>  LXC_LICENSE = LGPLv2.1+
>  LXC_LICENSE_FILES = COPYING
>  LXC_DEPENDENCIES = libcap host-pkgconf
> -- 
> 2.1.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
