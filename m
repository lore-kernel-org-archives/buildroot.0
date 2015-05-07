From: =?ISO-8859-1?Q?C=E9dric?= Castanet <cedriccastanet@free.fr>
Date: Thu, 07 May 2015 18:02:27 +0200
Subject: [Buildroot] probleme building tesseract-ocr
Message-ID: <1431014547.27289.16.camel@halley>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I started recently to use buildroot for a Pi Target.
I'm not sure i'm on the right place to ask for support, if not please
tel where to post.

after somme succes building target whith simple custom package, I succed
in adding leptonica (leptonica.org) as autotools-package, but i find a
probleme for adding tesseract-ocr as autotools-package: 
during the build process, it include file
from /usr/local/include/leptonica in place of $STAGING_DIR/... !!!
so there is a warning for this during compilation then an error probably
du to this.

ex : arm-none-linux-gnueabi-g++: WARNING: unsafe header/library path
used in cross-compilation: '/usr/local/include/leptonica'

here is my .mk file : 

################################################################################
#
# TESSERACT_OCR
#
################################################################################

# TESSERACT_OCR_VERSION = 53eab2ee9239a2400f97c6194207432e5837aede
TESSERACT_OCR_SITE = https://code.google.com/p/tesseract-ocr/
TESSERACT_OCR_SITE_METHOD = git
TESSERACT_OCR_VERSION = d508751e585559e2bfe1dcb1c460cba765470884
TESSERACT_OCR_LICENSE = Apache
TESSERACT_OCR_AUTORECONF = YES
TESSERACT_OCR_AUTORECONF_ENV = ./autogen.sh
TESSERACT_OCR_INSTALL_STAGING = YES
TESSERACT_OCR_DEPENDENCIES = leptonica

$(eval $(autotools-package))


I've found the right includes in the staging directory. I ned help to
solve my problem.
regards 
