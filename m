From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Feb 2020 17:41:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/cairo: security bump to version
 1.17.2
In-Reply-To: <20200229132533.2761046-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 29 Feb 2020 14:25:33 +0100")
References: <20200229132533.2761046-1-fontaine.fabrice@gmail.com>
Message-ID: <871rqdibw4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2018-19876: cairo 1.16.0, in cairo_ft_apply_variations() in
 >   cairo-ft-font.c, would free memory using a free function incompatible
 >   with WebKit's fastMalloc, leading to an application crash with a
 >   "free(): invalid pointer" error.
 > - Update indentation of hash file (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Moving from a 2018 release to a snapshot isn't really great here just
before the release :/

Looking at the security tracker, wouldn't it make more sense to apply
the 2 patches (+ autoreconf) instead for master?

https://security-tracker.debian.org/tracker/CVE-2018-19876


 > ---
 >  package/cairo/cairo.hash | 12 ++++++------
 >  package/cairo/cairo.mk   |  4 ++--
 >  2 files changed, 8 insertions(+), 8 deletions(-)

 > diff --git a/package/cairo/cairo.hash b/package/cairo/cairo.hash
 > index 949ed3ffee..c86ccc31ab 100644
 > --- a/package/cairo/cairo.hash
 > +++ b/package/cairo/cairo.hash
 > @@ -1,9 +1,9 @@
 > -# From https://www.cairographics.org/releases/cairo-1.16.0.tar.xz.sha1
 > -sha1 00e81842ae5e81bb0343108884eb5205be0eac14 cairo-1.16.0.tar.xz
 > +# From https://cairographics.org/snapshots/cairo-1.17.2.tar.xz.sha1
 > +sha1  c5d6f12701f23b2dc2988a5a5586848e70e858fe  cairo-1.17.2.tar.xz
 >  # Calculated based on the hash above
 > -sha256	5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d44be45e66052331	cairo-1.16.0.tar.xz
 > +sha256  6b70d4655e2a47a22b101c666f4b29ba746eda4aa8a0f7255b32b2e9408801df  cairo-1.17.2.tar.xz
 
 >  # Hash for license files:
 > -sha256	67228a9f7c5f9b67c58f556f1be178f62da4d9e2e6285318d8c74d567255abdf	COPYING
 > -sha256	9e9e8608c4cdda51a78cc3a385f4ec9a2e4c96d5ecad74ac8bca5fca3e563b7d	COPYING-LGPL-2.1
 > -sha256	53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f	COPYING-MPL-1.1
 > +sha256  67228a9f7c5f9b67c58f556f1be178f62da4d9e2e6285318d8c74d567255abdf  COPYING
 > +sha256  9e9e8608c4cdda51a78cc3a385f4ec9a2e4c96d5ecad74ac8bca5fca3e563b7d  COPYING-LGPL-2.1
 > +sha256  53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  COPYING-MPL-1.1
 > diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
 > index 902f505aaa..10f6a661f8 100644
 > --- a/package/cairo/cairo.mk
 > +++ b/package/cairo/cairo.mk
 > @@ -4,11 +4,11 @@
 >  #
 >  ################################################################################
 
 > -CAIRO_VERSION = 1.16.0
 > +CAIRO_VERSION = 1.17.2
 >  CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
 >  CAIRO_LICENSE = LGPL-2.1 or MPL-1.1 (library)
 >  CAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
 > -CAIRO_SITE = http://cairographics.org/releases
 > +CAIRO_SITE = http://cairographics.org/snapshots
 >  CAIRO_INSTALL_STAGING = YES
 
 >  # relocation truncated to fit: R_68K_GOT16O
 > -- 
 > 2.25.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
