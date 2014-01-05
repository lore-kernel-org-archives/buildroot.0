From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 05 Jan 2014 12:39:12 +0100
Subject: [Buildroot] [PATCH 01/36] xorg: New package xproto_presentproto
In-Reply-To: <BLU0-SMTP3392FC30020A7614B059A1DD9B50@phx.gbl> (Bernd Kuhls's
 message of "Sat, 4 Jan 2014 14:38:30 +0100")
References: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP3392FC30020A7614B059A1DD9B50@phx.gbl>
Message-ID: <87mwja64kf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <berndkuhls@hotmail.com> writes:

 > Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
 > ---
 > +################################################################################
 > +#
 > +# xproto_presentproto
 > +#
 > +################################################################################
 > +
 > +XPROTO_PRESENTPROTO_VERSION = 1.0
 > +XPROTO_PRESENTPROTO_SOURCE = presentproto-$(XPROTO_PRESENTPROTO_VERSION).tar.bz2
 > +XPROTO_PRESENTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 > +XPROTO_PRESENTPROTO_LICENSE = MIT
 > +XPROTO_PRESENTPROTO_LICENSE_FILES = COPYING

There's no COPYING in the tarball, so I've changed it to presentproto.h

The configure script uses pkg-config to find xorg-macros, so I've added
host-pkgconf and xutil_util-macros to the dependencies.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
