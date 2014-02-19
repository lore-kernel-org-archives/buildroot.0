From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 19 Feb 2014 16:14:47 +0100
Subject: [Buildroot] [PATCH v7 2/4] sdl_image: add host version
In-Reply-To: <20140218171156.414cb304@skate> (Thomas Petazzoni's message of
 "Tue, 18 Feb 2014 17:11:56 +0100")
References: <1392680233-24585-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1392680233-24585-3-git-send-email-maxime.hadjinlian@gmail.com>
 <20140218171156.414cb304@skate>
Message-ID: <874n3v16e0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Maxime Hadjinlian,
 > On Tue, 18 Feb 2014 00:37:11 +0100, Maxime Hadjinlian wrote:

 >> diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
 >> index ba9751d..05b9a1f 100644
 >> --- a/package/sdl_image/sdl_image.mk
 >> +++ b/package/sdl_image/sdl_image.mk
 >> @@ -38,4 +38,15 @@ SDL_IMAGE_DEPENDENCIES = sdl \
 >> $(if $(BR2_PACKAGE_SDL_IMAGE_TIFF),tiff) \
 >> $(if $(BR2_PACKAGE_SDL_IMAGE_WEBP),webp)
 >> 
 >> +HOST_SDL_IMAGE_CONF_OPT = --with-sdl-prefix=$(HOST_DIR)/usr \
 >> +                --with-sdl-exec-prefix=$(HOST_DIR)/usr \
 >> +                --disable-sdltest \
 >> +                --disable-static \
 >> +                --disable-jpg-shared \
 >> +                --disable-png-shared \
 >> +                --disable-tif-shared \

 > This is nitpicking, but we normally intend this with one tab, do not
 > have a backslash on the last line, and also intend the first line. So,
 > something like:

 > HOST_SDL_IMAGE_CONF_OPT = \
 > 	--with-sdl-prefix=... \
 > 	--foo \
 > 	--bar \
 > 	--baz

True, but this atleast matches what is done just above for the target
version. With that being said, a followup patch to cleanup both would be
nice.

-- 
Bye, Peter Korsgaard
