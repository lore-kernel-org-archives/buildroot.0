From: hartleys <hartleys@visionengravers.com>
Date: Tue, 4 Nov 2008 20:29:41 -0500
Subject: [Buildroot] Cross compiling SDL examples with buildroot
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909C91B4E@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I have just started looking at SDL and can't quite figure out how to get
the headers included. Hopefully someone can give me some pointers.

The main SDL library (./package/sdl) uses an older, none
Makefile.autotools based .mk file. In it the .compiled step has

		INCLUDE="-I./include $(SDL_DIRECTFB_INCLUDES)" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib" \

As part of the make process.

SDL_image (./package/sdl_image) on the other hand, is Makefile.autotools
based and has nothing special in the .mk

Just for completeness:

SDL_mixer (./package/sdl_mixer) -> older .mk, no INCLUDE= or LDFLAGS= in
the .complied step.
SDL_net (./package/sdl_net) -> Makefile.autotools based, nothing special
in the .mk
SDL_ttf (./package/sdl_ttf) -> older .mk, has this in the .compiled
step:

		INCLUDE="-I$(STAGING_DIR)/usr/include/SDL" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib" \

The sdl_ttf.mk is the only one I get that "works" since it actually
includes the correct directory for the headers.

I tried creating a dummy package using an autotools based source tarball
and a Makefile.autotools type .mk. The config step finds:

...
checking for SDL - version >= 1.0.1... cross compiling; assumed OK...
Yes
...

So I would assume everything would work. But package but when it
compiles I get:

sdl.cpp:2:17: error: SDL.h: No such file or directory

Any ideas what I'm missing?

Thanks,
Hartley
