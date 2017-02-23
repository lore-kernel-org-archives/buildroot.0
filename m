From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Feb 2017 21:06:31 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-22
In-Reply-To: <20170223184807.1deec0de@free-electrons.com>
References: <20170223072850.D0F0B20BE0@mail.free-electrons.com>
 <20170223171655.GA3910@free.fr>
 <20170223184807.1deec0de@free-electrons.com>
Message-ID: <20170223200631.GB3910@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-02-23 18:48 +0100, Thomas Petazzoni spake thusly:
> On Thu, 23 Feb 2017 18:16:55 +0100, Yann E. MORIN wrote:
> > So, chocolate-doom uses gcc to link, instead of g++. In so doing, it
> > bring in neither libstdc++.a nor libz.a
> > 
> > I did a quick hack to verify this, and added -lstdc++ and -lz to the SDL
> > Libs.Privte in sdl.pc, and the build suceeded.
> 
> It should be added to the DirectFB .pc files instead. It's really
> DirectFB that is bringing the libstdc++ dependency.

Yup. I was still investigating... :-/

> > For the C++ dependency, SDL unconditionally checks for a C++ compiler:
> > 
> >     AC_PROG_CXX
> > 
> > so we should probably add a dependency on C++ to SDL.
> 
> Why? It's DirectFB that needs it.

SDL does have some source file written in C++, but they are only in
directories named 'symbian', which I did not previously noticed. So SDL
does not need C++.

And now I seem to remember that we already questioned that some time in
the past...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
