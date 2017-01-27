From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2017 21:44:20 +1300
Subject: [Buildroot] [RFC] package/sdl2_ttf: include GL/gl.h while
 checking for OpenGL support
In-Reply-To: <20161229004735.6293-1-romain.naour@gmail.com>
References: <20161229004735.6293-1-romain.naour@gmail.com>
Message-ID: <20170127214420.042c9bf0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 29 Dec 2016 01:47:35 +0100, Romain Naour wrote:
> Since SDL2 2.0.4, SDL2 OpenGL headers (SDL_opengl.h) are unconditionally
> installed even if the OpenGL support has been disabled. So the SDL_ttf
> build system enable the OpenGL support without checking for a GL
> provider.

Isn't the real fix to modify SDL so that it doesn't install
SDL_opengl.h when OpenGL support is disabled?

What was the motivation between the change in SDL to install
SDL_opengl.h unconditionally?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
