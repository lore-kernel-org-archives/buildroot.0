From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 03 May 2010 09:24:18 +0200
Subject: [Buildroot] [PATCH 2/6] package: added lirc
In-Reply-To: <1272589129-21443-3-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Fri, 30 Apr 2010 02:58:45 +0200")
References: <1272589129-21443-1-git-send-email-llandwerlin@gmail.com>
	<1272589129-21443-3-git-send-email-llandwerlin@gmail.com>
Message-ID: <87vdb5e9ct.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>

 llandwerlin> +#############################################################
 llandwerlin> +#
 llandwerlin> +# lirc
 llandwerlin> +#
 llandwerlin> +#############################################################
 llandwerlin> +
 llandwerlin> +LIRC_VERSION = 0.8.6
 llandwerlin> +LIRC_SOURCE = lirc-$(LIRC_VERSION).tar.bz2
 llandwerlin> +LIRC_SITE = http://prdownloads.sourceforge.net/lirc
 llandwerlin> +LIRC_LIBTOOL_PATCH = NO
 llandwerlin> +LIRC_INSTALL_STAGING = YES
 llandwerlin> +
 llandwerlin> +LIRC_CONF_OPT = --without-x
 llandwerlin> +
 llandwerlin> +ifeq ($(BR2_PACKAGE_LIRC_ALL),y)
 llandwerlin> +LIRC_CONF_OPT += --with-driver=all
 llandwerlin> +endif


Don't we need to point it to the kernel dir for kernel drivers to be
built? And presumably only build after the kernel has been built?

If so, then this option should depend on !BR2_KERNEL_none.

-- 
Bye, Peter Korsgaard
