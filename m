From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 21:02:25 +0200
Subject: [Buildroot] [PATCH 2/2] cdebootstrap: new package
In-Reply-To: <1458298843-21326-2-git-send-email-benoit.allard@greenbone.net>
References: <1458298843-21326-1-git-send-email-benoit.allard@greenbone.net>
 <1458298843-21326-2-git-send-email-benoit.allard@greenbone.net>
Message-ID: <20160330210225.27d99e78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Mar 2016 12:00:43 +0100, Beno?t Allard wrote:

> diff --git a/package/cdebootstrap/cdebootstrap.mk b/package/cdebootstrap/cdebootstrap.mk
> new file mode 100644
> index 0000000..ca140da
> --- /dev/null
> +++ b/package/cdebootstrap/cdebootstrap.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# cdebootstrap
> +#
> +################################################################################
> +
> +# Not the latest version, rather from debian-stable
> +CDEBOOTSTRAP_VERSION = 0.6.4
> +CDEBOOTSTRAP_SOURCE = cdebootstrap_$(CDEBOOTSTRAP_VERSION).tar.gz
> +CDEBOOTSTRAP_SITE = http://snapshot.debian.org/archive/debian/20141116T035859Z/pool/main/c/cdebootstrap/
> +CDEBOOTSTRAP_LICENSE = GPLv2

License is GPLv2+.

> +CDEBOOTSTRAP_LICENSE_FILES = debian/copyright
> +CDEBOOTSTRAP_DEPENDENCIES = libcurl libdebian-installer zlib bzip2 host-pkgconf xz

I think you should pass --with-debian-architecture=NAME, otherwise it
will use dpkg-architecture.

To make sure that it works fine, I think you should try to build
libdebian-installer + cdebootstrap targetting an ARM architecture, on a
Linux machine that doesn't use Debian. You can for example use an Arch
Linux or Gentoo chroot to that effect.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
