From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 19 Jan 2014 22:48:42 +0100
Subject: [Buildroot] [PATCH v3 01/12] libbluray: new package
In-Reply-To: <1390165448-9130-2-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Sun, 19 Jan 2014 22:03:57 +0100")
References: <1390165448-9130-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1390165448-9130-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <8738kjmymd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > LIBBLURAY is a client library for accessing bluray disks.
 > This package was originally found at : https://github.com/huceke/buildroot-rbp
 > By gimli <ebsi4711@gmail.com>

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: gimli <ebsi4711@gmail.com>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 > Changes v2 -> v3:
 > 	- None
 > Changes v1 -> v2
 > 	- Bump version to 0.5.0 and add missing build dependency (Bernd Kuhls)
 > +
 > +LIBBLURAY_VERSION = 0.5.0
 > +LIBBLURAY_SITE = ftp://ftp.videolan.org/pub/videolan/libbluray/$(LIBBLURAY_VERSION)
 > +LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
 > +LIBBLURAY_INSTALL_STAGING = YES
 > +LIBBLURAY_LICENSE = LGPLv2.1+
 > +LIBBLURAY_LICENSE_FILES = COPYING
 > +LIBBLURAY_DEPENDENCIES = host-pkgconf freetype bzip2 libxml2 zlib

You need to select these in Config.in. Looking closer I see that bzip2
and zlib aren't used, and freetype/libxml2 are optional.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
