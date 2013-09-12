From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Sep 2013 19:11:26 +0200
Subject: [Buildroot] [PATCH 1/1] igmpproxy: new package
In-Reply-To: <1378924125-441-1-git-send-email-mlweber1@rockwellcollins.com>
References: <1378924125-441-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <20130912191126.7db8180f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Wed, 11 Sep 2013 13:28:45 -0500, Matt Weber wrote:

> diff --git a/package/igmpproxy/Config.in b/package/igmpproxy/Config.in
> new file mode 100755
> index 0000000..53a25b1
> --- /dev/null
> +++ b/package/igmpproxy/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_IGMPPROXY
> +	bool "igmpproxy"

For some odd reason, the configure check that verifies if the compiler
supports C99 builds a program that needs wchar support. So you should
add a:

	depends on BR2_USE_WCHAR

and also a:

comment "igmpproxy needs a toolchain with wchar support"
	depends on !BR2_USE_WCHAR

> +	help
> +	  A simple dynamic Multicast Routing Daemon 
> +	  using only IGMP signalling. It's intended 
> +	  for simple forwarding of Multicast traffic 
> +	  between networks.

Please add an empty line and the upstream URL of the project. I know
the contents at http://sourceforge.net/projects/igmpproxy/ are not very
fancy, but it's better than nothing.

> diff --git a/package/igmpproxy/igmpproxy.mk b/package/igmpproxy/igmpproxy.mk
> new file mode 100755
> index 0000000..468f356
> --- /dev/null
> +++ b/package/igmpproxy/igmpproxy.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# igmpproxy 
> +#
> +################################################################################
> +
> +IGMPPROXY_VERSION = 0.1
> +IGMPPROXY_SITE = http://downloads.sourceforge.net/project/igmpproxy/igmpproxy/$(IGMPPROXY_VERSION)
> +IGMPPROXY_SOURCE = igmpproxy-$(IGMPPROXY_VERSION).tar.gz

This last line is not needed since it's the default value.

> +IGMPPROXY_LICENSE = GPLv2+
> +IGMPPROXY_LICENSE_FILES = COPYING
> +
> +$(eval $(autotools-package))

Other than that, looks good. Can you send an updated version that takes
into account those comments?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
