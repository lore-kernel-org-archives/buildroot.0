From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 18:48:07 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-22
In-Reply-To: <20170223171655.GA3910@free.fr>
References: <20170223072850.D0F0B20BE0@mail.free-electrons.com>
 <20170223171655.GA3910@free.fr>
Message-ID: <20170223184807.1deec0de@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 18:16:55 +0100, Yann E. MORIN wrote:

> So, chocolate-doom uses gcc to link, instead of g++. In so doing, it
> bring in neither libstdc++.a nor libz.a
> 
> I did a quick hack to verify this, and added -lstdc++ and -lz to the SDL
> Libs.Privte in sdl.pc, and the build suceeded.

It should be added to the DirectFB .pc files instead. It's really
DirectFB that is bringing the libstdc++ dependency.

> For the C++ dependency, SDL unconditionally checks for a C++ compiler:
> 
>     AC_PROG_CXX
> 
> so we should probably add a dependency on C++ to SDL.

Why? It's DirectFB that needs it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
