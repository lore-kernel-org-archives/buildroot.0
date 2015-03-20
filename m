From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 20 Mar 2015 08:12:08 +0200
Subject: [Buildroot] [PATCH] package: add mosh 1.2.4
In-Reply-To: <1426736888-29437-6-git-send-email-steven@uplinklabs.net>
References: <1426736888-29437-1-git-send-email-steven@uplinklabs.net>
 <1426736888-29437-6-git-send-email-steven@uplinklabs.net>
Message-ID: <20150320061208.GD25388@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steven,

On Wed, Mar 18, 2015 at 08:48:08PM -0700, Steven Noonan wrote:
> diff --git a/package/mosh/Config.in b/package/mosh/Config.in
> new file mode 100644
> index 0000000..a05c711
> --- /dev/null
> +++ b/package/mosh/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_MOSH
> +	bool "mosh"
> +	select BR2_PACKAGE_OPENSSH
> +	select BR2_PACKAGE_PERL
> +	select BR2_PACKAGE_PROTOBUF
> +	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_PERL

Duplicate.

> +	select BR2_PACKAGE_ZLIB

Please propagate dependencies.

> +	help
> +	  Remote terminal application that allows roaming, supports intermittent
> +	  connectivity, and provides intelligent local echo and line editing of
> +	  user keystrokes.
> +
> +	  Mosh is a replacement for SSH. It's more robust and responsive,
> +	  especially over Wi-Fi, cellular, and long-distance links.
> diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
> new file mode 100644
> index 0000000..c4f2c07
> --- /dev/null
> +++ b/package/mosh/mosh.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# mosh
> +#
> +################################################################################
> +
> +MOSH_VERSION = 1.2.4
> +MOSH_SITE = http://mosh.mit.edu
> +MOSH_SOURCES = mosh-$(MOSH_VERSION).tar.gz

That's the default.

> +MOSH_DEPENDENCIES = host-protobuf-c ncurses openssh openssl perl protobuf zlib

You missed selecting BR2_PACKAGE_OPENSSL in Config.in.

> +MOSH_LICENSE = GPLv3+
> +MOSH_LICENSE_FILES = COPYING
> +
> +$(eval $(autotools-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
