From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:16:33 +0100
Subject: [Buildroot] [PATCH] package/sdl2_net: add missing host-pkgconf
 dependency
In-Reply-To: <20181212085212.12149-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 12 Dec 2018 09:52:12 +0100")
References: <20181212085212.12149-1-thomas.petazzoni@bootlin.com>
Message-ID: <8736qx6uku.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The sdl2_net configure script uses pkg-config to finx sdl2. If it
 > doesn't find pkg-config, it tries to locate sdl2-config, and defaults
 > to /usr/bin/sdl2-config, which causes the build to fail with:

 > arm-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include/SDL2'

 > Fix this by adding host-pkgconf to the dependencies of sdl2_net. We
 > could have added the right autoconf cache variable to tell the
 > configure script where sdl2-config is located, but since pkg-config is
 > tried first, let's use that.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, 2018.08.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
