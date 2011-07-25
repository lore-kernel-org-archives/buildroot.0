From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2011 09:49:03 +0200
Subject: [Buildroot] [git commit] ipset: ensure target kernel headers
 are used
In-Reply-To: <20110722115833.2A3F08B422@busybox.osuosl.org>
References: <20110722115833.2A3F08B422@busybox.osuosl.org>
Message-ID: <20110725094903.35873b1a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 22 Jul 2011 13:51:45 +0200,
Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

> diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
> index 9d901fc..700d2bc 100644
> --- a/package/ipset/ipset.mk
> +++ b/package/ipset/ipset.mk
> @@ -9,5 +9,6 @@ IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
>  IPSET_SITE = http://ipset.netfilter.org
>  IPSET_AUTORECONF = YES
>  IPSET_DEPENDENCIES = libmnl host-pkg-config
> +IPSET_CONF_OPT = --with-ksource=$(LINUX_HEADERS_DIR)

I am sorry, but LINUX_HEADERS_DIR is only defined when the internal
toolchain backend is used, so I guess this is broken for external
toolchain or ct-ng toolchain builds.

bridge-utils, busybox and iptables are already using LINUX_HEADERS_DIR,
but I guess this needs some work as well.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
