From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Jun 2017 21:13:54 +0200
Subject: [Buildroot] [PATCH 1/2] package/imagemagick: change download
	url to github
In-Reply-To: <20170618074538.1237-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 18 Jun 2017 09:45:37 +0200")
References: <20170618074538.1237-1-bernd.kuhls@t-online.de>
Message-ID: <877f09glcd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Upstream quickly removes old versions from
 > http://www.imagemagick.org/download/releases

 > For our LTS versions we should switch to a stable upstream repo which
 > provides all released versions.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/imagemagick/imagemagick.hash | 4 ++--
 >  package/imagemagick/imagemagick.mk   | 4 ++--
 >  2 files changed, 4 insertions(+), 4 deletions(-)

 > diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
 > index 173dd415c..3e2749dd4 100644
 > --- a/package/imagemagick/imagemagick.hash
 > +++ b/package/imagemagick/imagemagick.hash
 > @@ -1,2 +1,2 @@
 > -# From http://www.imagemagick.org/download/releases/digest.rdf
 > -sha256 0058fcde533986334458a5c99600b1b9633182dd9562cbad4ba618c5ccf2a28f  ImageMagick-7.0.5-10.tar.xz
 > +# Locally computed
 > +sha256 bd965d36a65cbcd420ec79a509a5ce0ecdfef036770cdc87fcd5374b9ed15ea7  7.0.5-10.tar.gz
 > diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
 > index 7aade62da..23552d708 100644
 > --- a/package/imagemagick/imagemagick.mk
 > +++ b/package/imagemagick/imagemagick.mk
 > @@ -5,8 +5,8 @@
 >  ################################################################################
 
 >  IMAGEMAGICK_VERSION = 7.0.5-10
 > -IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
 > -IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
 > +IMAGEMAGICK_SOURCE = $(IMAGEMAGICK_VERSION).tar.gz
 > +IMAGEMAGICK_SITE = https://github.com/ImageMagick/ImageMagick/archive

That SOURCE name is a bit annoying. Is it a big issue that upstream
(re)moves the downloads after some time when we transparently fall back
to getting it from sources.buildroot.org?

-- 
Bye, Peter Korsgaard
