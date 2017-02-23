From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Feb 2017 21:21:04 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-22
In-Reply-To: <20170223200631.GB3910@free.fr>
References: <20170223072850.D0F0B20BE0@mail.free-electrons.com>
 <20170223171655.GA3910@free.fr>
 <20170223184807.1deec0de@free-electrons.com>
 <20170223200631.GB3910@free.fr>
Message-ID: <20170223202104.GC3910@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-02-23 21:06 +0100, Yann E. MORIN spake thusly:
> Thomas, All,
> 
> On 2017-02-23 18:48 +0100, Thomas Petazzoni spake thusly:
> > On Thu, 23 Feb 2017 18:16:55 +0100, Yann E. MORIN wrote:
> > > So, chocolate-doom uses gcc to link, instead of g++. In so doing, it
> > > bring in neither libstdc++.a nor libz.a
> > > 
> > > I did a quick hack to verify this, and added -lstdc++ and -lz to the SDL
> > > Libs.Privte in sdl.pc, and the build suceeded.
> > 
> > It should be added to the DirectFB .pc files instead. It's really
> > DirectFB that is bringing the libstdc++ dependency.

But in this case, that does not help, because chocolate-doom does not
use pkg-config to find SDL, so it does not pull in the libs needed for
sdl.

Furthermore, sdl.pc does not reference directfb in its "Reuqires" field,
but it lists -ldirectfb in the libs it needs.

This is so uterly broken... :-(

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
