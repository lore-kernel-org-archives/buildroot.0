From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Jan 2017 23:11:26 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-01-26
In-Reply-To: <20170127215534.GC3430@free.fr> (Yann E. MORIN's message of "Fri, 
 27 Jan 2017 22:55:34 +0100")
References: <20170127073003.CA12320D83@mail.free-electrons.com>
 <20170127215534.GC3430@free.fr>
Message-ID: <87y3xw9mr5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > So... Those are due to a stupdity in both the sdl2 install procedure and
 > the sdl2_ttf configure:

 >   - sdl2 will always install all its headers, even those for features
 >     that are disabled, like SDL_opengl.h et al.;

 >   - sdl_ttf will try to compile (not link) a program that includes
 >     SDL_opengl.h and concludes that GL support is enabled;

 >   - sdl2_ttf will then build and try to link with -lGL.

 > Bummer. 

 > Cc-ing Guillaume and Peter. Any idea? ;-)

I don't really know much about SDL2, but how about deleting SDL_opengl.h
as a sdl2 post-target-install step? (or rather, get upstream to fix it
so it doesn't get installed in the first place, but this can be a
solution for now).

-- 
Bye, Peter Korsgaard
