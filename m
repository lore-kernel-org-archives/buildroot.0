From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 29 Oct 2012 22:11:44 +0100
Subject: [Buildroot] [PATCHv7 1/5] pkgconf: new package
In-Reply-To: <1351109444-3301-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 24 Oct 2012 17:10:44 -0300")
References: <1351109444-3301-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87boflhtkf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> pkgconf is a drop-in replacement for pkg-config that doesn't need
 Gustavo> itself to build and just requires a C89 compiler.

 Gustavo> Instead of using a patch for hardcoded sysroot support (as the patch to
 Gustavo> pkg-config does) we rely instead on a wrapper script that takes the
 Gustavo> appropiate action.

 Gustavo> +#############################################################
 Gustavo> +#
 Gustavo> +# pkgconf
 Gustavo> +#
 Gustavo> +#############################################################
 Gustavo> +
 Gustavo> +PKGCONF_VERSION = 0.8.9
 Gustavo> +PKGCONF_SITE = http://tortois.es/~nenolod/distfiles
 Gustavo> +PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.bz2
 Gustavo> +
 Gustavo> +PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/usr/bin/pkg-config

This line doesn't really belong here (it should go in the commit
removing host-pkg-config), but as it's the same value the pkg-config.mk
one, it's not a big deal.

Committed entire series, thanks!

-- 
Bye, Peter Korsgaard
