From: Gilles Talis <gilles.talis@gmail.com>
Date: Fri, 8 May 2015 22:20:53 +0200
Subject: [Buildroot] probleme building tesseract-ocr
In-Reply-To: <1431014547.27289.16.camel@halley>
References: <1431014547.27289.16.camel@halley>
Message-ID: <CAKcgs2yf20HHub-qRXMsct88BfrFRxeKdbLVDhh7fEXKEHEEBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Cedric,

2015-05-07 18:02 GMT+02:00 C?dric Castanet <cedriccastanet@free.fr>:
> Hello,
> I started recently to use buildroot for a Pi Target.
> I'm not sure i'm on the right place to ask for support, if not please
> tel where to post.
You have come to the right place.


> after somme succes building target whith simple custom package, I succed
> in adding leptonica (leptonica.org) as autotools-package, but i find a
> probleme for adding tesseract-ocr as autotools-package:
> during the build process, it include file
> from /usr/local/include/leptonica in place of $STAGING_DIR/... !!!
> so there is a warning for this during compilation then an error probably
> du to this.
>
> ex : arm-none-linux-gnueabi-g++: WARNING: unsafe header/library path
> used in cross-compilation: '/usr/local/include/leptonica'
>
> here is my .mk file :
>
> ################################################################################
> #
> # TESSERACT_OCR
> #
> ################################################################################
>
> # TESSERACT_OCR_VERSION = 53eab2ee9239a2400f97c6194207432e5837aede
> TESSERACT_OCR_SITE = https://code.google.com/p/tesseract-ocr/
> TESSERACT_OCR_SITE_METHOD = git
> TESSERACT_OCR_VERSION = d508751e585559e2bfe1dcb1c460cba765470884
> TESSERACT_OCR_LICENSE = Apache
> TESSERACT_OCR_AUTORECONF = YES
> TESSERACT_OCR_AUTORECONF_ENV = ./autogen.sh
> TESSERACT_OCR_INSTALL_STAGING = YES
> TESSERACT_OCR_DEPENDENCIES = leptonica
>
> $(eval $(autotools-package))
>
>
> I've found the right includes in the staging directory. I ned help to
> solve my problem.
> regards
I have some work-in-progress patches around these packages, that you
can re-use. Both packages build and have been quickly tested. However,
they need to be cleaned up, verified against toolchain dependencies,
etc...
Patches are attached, I'd be grateful if you could clean them up and
send them for review once you are happy with them.

Thanks
Gilles.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-leptonica-new-package.patch
Type: text/x-patch
Size: 2646 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150508/792cb4e7/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-tesseract-ocr-new-package.patch
Type: text/x-patch
Size: 23226 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150508/792cb4e7/attachment-0001.bin>
