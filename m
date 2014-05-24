From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 May 2014 00:25:15 +0200
Subject: [Buildroot] [PATCH v9 00/29] xbmc: bump version to 13.1 Beta2
In-Reply-To: <1400618488-6995-1-git-send-email-bernd.kuhls@t-online.de>
References: <1400618488-6995-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140524222515.GF3491@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-05-20 22:40 +0200, Bernd Kuhls spake thusly:
> the patch series combines my latest patches to bump xbmc.

OK, I've teted this on the RPi tonight, and it is indeed quite
impressive! I'm pretty happy with it! :-)

We've discussed this at length with MAxime on IRC tonight, and we came
to the following conclusions.

First, we want to bump it as soon as possible, after the next merge
window opens (due by the end of the month, maybe next week-end?). This
will ensure we continue to have a working XBMC on the RPI (the currently
only really supported platform for XBMC in Buildroot.)

After it is bumped, we can add the mising pieces needed to make it work
on x86.

Therefore, we have the following steps to follow:

First, it needs a few other patches to be applied first:
    http://patchwork.ozlabs.org/patch/352141/
        package/rpi-userland: bump version
    http://patchwork.ozlabs.org/patch/352146/
        xbmc: Add missing unicode properties supports

Those have already been posted, so should trickle down in the tree soon.

Then, we need to add the possibility to install the gconv libraries when
using glibc. Without the gconv libraries, there are no label on the
menus. This is a new strict requirement for Gotham, which was not needed
for Frodo.

This will be a bit challenging, so I have a simple patch I'm working on
that will enable thos gconv libs to be installed. If there's something
to be done for iconv, it can be done later on, when needed.

Then, we can apply the few preparatory patches (although strictly
speaking, only one is really needed for the actual bump, the rest being
to add support for x86, which is new stuff.)

Then we can bump it. Tis is not as simple as changing the version, as
XBMC no behaves differently when shutting down. I have to look at what
changed, but our br-xbmc wrapper script no longer works when shutting
down, XBMC just restarts, and the machine never shuts down... (I have an
idea where to look at, so it's good! :-) )

Then we can add new packages, and fix/enhance the existing packages.
Your expertise on mesa3d and the other X11-related packages will be very
much appreciated in this step.

Going this route means the easy patches will be at the beginning, and
so can be applied more easily, and thus the series should shrink, and be
more manageable.

If you don't mind, I'll wait for your v10. I'll start from there,
re-order the series as per the above, add the missing gconv stuff in it,
and respin it, so you can get it back.

Does that sound like an OK plan for you?

Again, thank you for working so hard on this series! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
