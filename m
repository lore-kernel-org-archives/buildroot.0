From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 17:23:00 +0200
Subject: [Buildroot] [PATCH v4 1/4] package/imagemagick: add host package
In-Reply-To: <1535118300-26815-1-git-send-email-angelo@amarulasolutions.com>
 (Angelo Compagnucci's message of "Fri, 24 Aug 2018 15:44:57 +0200")
References: <1535118300-26815-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <871s8j7297.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
 > This patch adds the host package for imagemagick.
 > It comes with a minimal selection of configure options to
 > compile fast cause it is used only to convert
 > the image files for the custom linux logo.

 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 > ---
 >  package/imagemagick/imagemagick.mk | 11 +++++++++++
 >  1 file changed, 11 insertions(+)

 > diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
 > index 4aa9d56..0eb94b7 100644
 > --- a/package/imagemagick/imagemagick.mk
 > +++ b/package/imagemagick/imagemagick.mk
 > @@ -143,4 +143,15 @@ else
 >  IMAGEMAGICK_CONF_OPTS += --without-bzlib
 >  endif
 
 > +HOST_IMAGEMAGICK_CONF_OPTS = \
 > +	--with-jpeg \
 > +	--with-png \
 > +	--with-zlib

You forgot to explicitly disable all the other configure options like we
do for the target variant.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
