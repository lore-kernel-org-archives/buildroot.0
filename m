From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 15:17:01 +1300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-01-26
In-Reply-To: <87y3xw9mr5.fsf@dell.be.48ers.dk>
References: <20170127073003.CA12320D83@mail.free-electrons.com>
 <20170127215534.GC3430@free.fr> <87y3xw9mr5.fsf@dell.be.48ers.dk>
Message-ID: <20170128151701.52fb05ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 27 Jan 2017 23:11:26 +0100, Peter Korsgaard wrote:

> I don't really know much about SDL2, but how about deleting SDL_opengl.h
> as a sdl2 post-target-install step? (or rather, get upstream to fix it
> so it doesn't get installed in the first place, but this can be a
> solution for now).

Romain already had a look at this issue, and proposed a patch for
SDL2_ttf: https://patchwork.ozlabs.org/patch/709443/.

However, reviewing Romain's proposal, I wondered if it really made
sense for SDL2 to install SDL_opengl.h when OpenGL support is not
enabled. This is what SDL2 used to do in the past, and upstream changed
this for some reason.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
