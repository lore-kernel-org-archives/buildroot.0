From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 17 Oct 2014 16:11:00 +0200
Subject: [Buildroot] [PATCH 1/4] libshout: new package
In-Reply-To: <1413408231-31696-1-git-send-email-jkrause@posteo.de>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Wed, 15 Oct 2014 23:23:48 +0200")
References: <1413408231-31696-1-git-send-email-jkrause@posteo.de>
Message-ID: <87a94ueqh7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <jkrause@posteo.de> writes:

 > Signed-off-by: J?rg Krause <jkrause@posteo.de>

 > +++ b/package/libshout/libshout.mk
 > @@ -0,0 +1,14 @@
 > +################################################################################
 > +#
 > +# libshout
 > +#
 > +################################################################################
 > +
 > +LIBSHOUT_VERSION = 2.3.1
 > +LIBSHOUT_SITE = http://downloads.xiph.org/releases/libshout
 > +LIBSHOUT_LICENSE = LGPLv2
 > +LIBSHOUT_LICENSE_FILES = COPYING
 > +LIBSHOUT_INSTALL_STAGING = YES
 > +LIBSHOUT_DEPENDENCIES = libogg libvorbis

Thanks - Next to the issues Thomas pointed out there's a few more:

The configure script uses PKG_CHECK_MODULES, so you need
host-pkgconf. There's also optional support for libtheora and speex so
I've added that.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
