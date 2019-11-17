From: Koen Martens <gmc@sonologic.nl>
Date: Sun, 17 Nov 2019 14:37:55 +0100
Subject: [Buildroot] SDL2 depends on shared libraries,
 but Config.in depends on BR2_STATIC_LIBS ?
Message-ID: <20191117133755.GB13372@coltrane>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm updating linuxconsoletools. However, I'm running into issues
with test-pkg. There is an optional binary for force-feedback 
testing that requires SDL2.

SDL2 seems to require shared library support (in that it includes
dlfcn.h somewhere along the line), however this is not declared
in package/sdl2/Config.in. In fact, there is an odd comment 
at the bottom of that file:

comment "sdl2 needs a toolchain w/ dynamic library"
    depends on BR2_STATIC_LIBS

Isn't it contradictory to say 'needs dynamic library' but then depend
on BR2_STATIC_LIBS??

As a work-around, in my linuxconsoletools Config.in i've added
'depends on BR2_SHARED_LIBS' to prevent the build failures
with test-pkg, but that feels like an ugly way to fix this. It
feels like SDL2 should declare its dependency on BR2_SHARED_LIBS
instead of me declaring it?

This has left me a bit confused.

Cheers,

Koen
