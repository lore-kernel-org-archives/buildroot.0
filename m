From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 23 Jul 2015 09:58:35 +0300
Subject: [Buildroot] [PATCH v3 1/1] mosh: new package
In-Reply-To: <1437633426-23375-1-git-send-email-christian@paral.in>
References: <1437633426-23375-1-git-send-email-christian@paral.in>
Message-ID: <20150723065835.GR13027@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,

On Wed, Jul 22, 2015 at 11:37:06PM -0700, Christian Stewart wrote:
> diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
> new file mode 100644
> index 0000000..4d6f0b3
> --- /dev/null
> +++ b/package/mosh/mosh.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# mosh
> +#
> +################################################################################
> +
> +MOSH_VERSION = 1.2.4.95rc2
> +MOSH_SITE = $(call github,keithw,mosh,mosh-$(MOSH_VERSION))
> +MOSH_DEPENDENCIES = protobuf
> +MOSH_LICENSE = GPLv3

Source files contain the "or any later version" language, so GPLv3+.

I'd also add the exceptions, so something like:

MOSH_LICENSE = GPLv3+ with OpenSSL and iOS exceptions

> +MOSH_LICENSE_FILES = COPYING COPYING.iOS
> +MOSH_MAKE_ENV = VERSION="mosh-$(MOSH_VERSION)"
> +
> +# Necessary as we are pulling from Git.
> +MOSH_AUTORECONF = YES
> +
> +$(eval $(autotools-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
