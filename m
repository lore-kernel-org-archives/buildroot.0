From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Jan 2014 23:48:26 +0100
Subject: [Buildroot] [PATCH v3 06/12] libshairplay: new package
In-Reply-To: <1390165448-9130-7-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Sun, 19 Jan 2014 22:04:02 +0100")
References: <1390165448-9130-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1390165448-9130-7-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <877g9rd45h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > libshairplay is a client library that emulates an airplay server
 > This package was originally found at : https://github.com/huceke/buildroot-rbp
 > By gimli <ebsi4711@gmail.com>

Committed with minor fixes (see below) - Thanks.

 > +config BR2_PACKAGE_LIBSHAIRPLAY
 > +  bool "libshairplay"
 > +  depends on BR2_INET_IPV6
 > +  help

Indentation is wrong (should be tab).

It uses pthreads, so it should also depend on BR2_TOOLCHAIN_HAS_THREADS.

 > +++ b/package/libshairplay/libshairplay.mk
 > @@ -0,0 +1,15 @@
 > +################################################################################
 > +#
 > +# libshairplay
 > +#
 > +################################################################################
 > +
 > +LIBSHAIRPLAY_VERSION = 139d5ef55564514c31f02dd82cef91236c9ff523
 > +LIBSHAIRPLAY_SITE = $(call github,juhovh,shairplay,$(LIBSHAIRPLAY_VERSION))
 > +LIBSHAIRPLAY_INSTALL_STAGING = YES
 > +LIBSHAIRPLAY_INSTALL_TARGET = YES

This defaults to YES, so that isn't needed.

 > +LIBSHAIRPLAY_AUTORECONF = YES
 > +LIBSHAIRPLAY_LICENSE = MIT, BSD-3c, LGPLv2.1+
 > +LIBSHAIRPLAY_LICENSE_FILES = LICENSE

The configure script uses pkg-config so it should depend on
host-pkgconf. It also has optional support for libao, so we should add
that as well if enabled.

-- 
Bye, Peter Korsgaard
