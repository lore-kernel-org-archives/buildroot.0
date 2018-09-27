From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 28 Sep 2018 00:01:17 +0300
Subject: [Buildroot] [PATCH 1/1] bird: new package
In-Reply-To: <20180927204116.29484-1-adrien@gallouet.fr>
References: <20180927204116.29484-1-adrien@gallouet.fr>
Message-ID: <874lea4puq.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adrien,

Adrien Gallou?t writes:
> diff --git a/package/bird/bird.mk b/package/bird/bird.mk
> new file mode 100644
> index 0000000000..959021f94f
> --- /dev/null
> +++ b/package/bird/bird.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# bird
> +#
> +################################################################################
> +
> +BIRD_VERSION = 2.0.2
> +BIRD_SOURCE = v$(BIRD_VERSION).tar.gz
> +BIRD_SITE = https://github.com/BIRD/bird/archive

Please use the github helper:

  BIRD_SITE = $(call github,BIRD,bird,$(BIRD_VERSION))

BIRD_SOURCE should not be needed.

> +BIRD_LICENSE = GPL-2.0+
> +BIRD_LICENSE_FILES = README
> +BIRD_AUTORECONF = YES

Please mention in a comment that autoreconf is needed since the package
is fetched from github so there is no configure script.

> +
> +$(eval $(autotools-package))

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
