From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Aug 2016 16:09:18 +0200
Subject: [Buildroot] [PATCHv2] pckages/sconeserver: fix build with gcc-6
In-Reply-To: <CAFt09wOQ9fOLGkdbM-Jtuw9G_tizsO8103x317ADp2Rf+YU7wQ@mail.gmail.com>
References: <1472111153-14215-1-git-send-email-yann.morin.1998@free.fr>
 <20160825102650.0acafa05@free-electrons.com>
 <CAFt09wOQ9fOLGkdbM-Jtuw9G_tizsO8103x317ADp2Rf+YU7wQ@mail.gmail.com>
Message-ID: <20160827140918.GA5755@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew, All,

On 2016-08-27 07:38 -0500, Matthew Weber spake thusly:
> On Thu, Aug 25, 2016 at 3:26 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Hello,
> >
> > On Thu, 25 Aug 2016 09:45:53 +0200, Yann E. MORIN wrote:
> >> We simply bump the version rather than backport the patch, as there has
> >> been only very few, minor commits in-between.
> >>
> >> Fixes:
> >>     http://autobuild.buildroot.org/results/fa7/fa7881c6ffb821a2aff139f95ba53c96d6e2b942/
> >>     http://autobuild.buildroot.org/results/749/749fbd6cc505f6f3c0cccfeb63be6deddab8fba5/
> >>
> >> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >>
> <snip>
> 
> 
> Looks like the new revision has a failed build.
> http://autobuild.buildroot.org/results/e92/e929799366e6f574c7b08d8635b18623afd3e3e1//
> 
> ModuleLoader.cpp:29:19: fatal error: dlfcn.h: No such file or directory
>  #include <dlfcn.h>
>                    ^
> I didn't have a chance to check if the conf opts for disable-load
> works on this package yet but that might fix it (assuming it can be
> statically built).

This code hasn't changed in sconeserver since 2013, so we would have
seen similar failures previously...

> When I first rebuilt, I tried just doing a "make clean sconeserver"
> and got this error.
> 
> configure.in:118: error: possibly undefined macro: AC_MSG_FAILURE
>       If this token and others are legitimate, please use m4_pattern_allow.
>       See the Autoconf documentation.
> configure.in:120: error: possibly undefined macro: AC_MSG_WARN
> autoreconf: /home/mlweber/buildroot/output/host/usr/bin/autoconf
> failed with exit status: 1
> package/pkg-generic.mk:191: recipe for target
> '/home/mlweber/buildroot/output/build/sconeserver-d659468cd164e6a6cc12932cc6780566b04f8328/.stamp_configured'
> failed

This autoreconf issue also occurs when reverting the bump...

I'll be investigating, but sconeserver is not something I'm really
interested in (was just trying to fix autobuild failures...)

Adding Simon in the loop, since he added that package. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
