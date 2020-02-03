From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Feb 2020 18:21:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/jack2: bump to version 1.9.14
In-Reply-To: <20200203165734.25937-1-titouan.christophe@railnova.eu> (titouan
 christophe's message of "Mon, 3 Feb 2020 17:57:34 +0100")
References: <20200203165734.25937-1-titouan.christophe@railnova.eu>
Message-ID: <87imkn1t9s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "titouan" == titouan christophe <titouan.christophe@railnova.eu> writes:

 > From: Titouan Christophe <titouan.christophe@railnova.eu>
 > Amongst other things, the jack2 waf script has been made
 > compatible with Python3 in this latest release, which makes
 > it possible to be built on py3

This presumably doesn't help much as long as it has host-python in its
_DEPENDENCIES and our pkg-waf.mk hard codes python2?

Still, bumping the version is fine - So committed, thanks.

 > See also upstream release notes:
 > - https://github.com/jackaudio/jack2/releases/tag/v1.9.13
 > - https://github.com/jackaudio/jack2/releases/tag/v1.9.14


 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
 > ---
 >  package/jack2/jack2.hash | 2 +-
 >  package/jack2/jack2.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/jack2/jack2.hash b/package/jack2/jack2.hash
 > index f6f2345eb5..aec56e24a4 100644
 > --- a/package/jack2/jack2.hash
 > +++ b/package/jack2/jack2.hash
 > @@ -1,2 +1,2 @@
 >  # Locally calculated
 > -sha256 deefe2f936dc32f59ad3cef7e37276c2035ef8a024ca92118f35c9a292272e33  jack2-1.9.12.tar.gz
 > +sha256 a20a32366780c0061fd58fbb5f09e514ea9b7ce6e53b080a44b11a558a83217c  jack2-1.9.14.tar.gz
 > diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
 > index c4cad32ed6..b08c45cce7 100644
 > --- a/package/jack2/jack2.mk
 > +++ b/package/jack2/jack2.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -JACK2_VERSION = 1.9.12
 > +JACK2_VERSION = 1.9.14
 >  JACK2_SITE = $(call github,jackaudio,jack2,v$(JACK2_VERSION))
 >  JACK2_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 >  JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib host-python

So if it can 

 > -- 
 > 2.24.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
