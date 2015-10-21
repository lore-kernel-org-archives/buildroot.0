From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 23:22:43 +0200
Subject: [Buildroot] [PATCH V4] sdl2: new package
In-Reply-To: <5627FF26.40805@openwide.fr>
References: <20151019134532.GA12643@laptop-vstehle>
 <5627FBE0.5010004@openwide.fr> <5627FF26.40805@openwide.fr>
Message-ID: <20151021232243.600d83cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Wed, 21 Oct 2015 23:09:58 +0200, Romain Naour wrote:

> I confirm there is a poisoned path returned by this script:
> 
> sdl2-config --cflags
> -I/usr/include/SDL2
> -I/home/naourr/buildroot/test/efl-1.15.2-v2/host/usr/i686-buildroot-linux-gnu/sysroot/usr/include
> -D_REENTRANT
> 
> sdl2-config --libs
> -L/usr/lib -lSDL2 -lpthread
> 
> And thanks to your fix:
> 
> sdl2-config --cflags
> -I/home/naourr/buildroot/test/efl-1.15.2-v2/host/usr/i686-buildroot-linux-gnu/sysroot/usr/include/SDL2
> -I/home/naourr/buildroot/test/efl-1.15.2-v2/host/usr/i686-buildroot-linux-gnu/sysroot/usr/include
> -D_REENTRANT
> 
> sdl2-config --libs
> -L/home/naourr/buildroot/test/efl-1.15.2-v2/host/usr/i686-buildroot-linux-gnu/sysroot/usr/lib
> -lSDL2 -lpthread

I'm finally looking at sdl2, and added the SDL2_CONFIG_SCRIPTS line
suggested by Vincent. If that's the only issue I find, I'll apply the
patch with this change.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
