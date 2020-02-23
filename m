From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2020 11:04:55 +0100
Subject: [Buildroot] [PATCH/next 2/2] replace MESA_EGL_NO_X11_HEADERS
 hack with upstream EGL_NO_X11
In-Reply-To: <t2r9igxv9o.ln2@ID-313208.user.individual.net>
References: <20200220185917.37908-1-bernd.kuhls@t-online.de>
 <20200220185917.37908-2-bernd.kuhls@t-online.de>
 <20200223084120.GJ8743@scaer>
 <t2r9igxv9o.ln2@ID-313208.user.individual.net>
Message-ID: <20200223100455.GL8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-02-23 09:52 +0100, Bernd Kuhls spake thusly:
> Am Sun, 23 Feb 2020 09:41:20 +0100 schrieb Yann E. MORIN:
> > On 2020-02-20 19:59 +0100, Bernd Kuhls spake thusly:
> >> Mesa3d 20.0.0 deprecated MESA_EGL_NO_X11_HEADERS:
> >> https://cgit.freedesktop.org/mesa/mesa/commit/?
> id=6202a13b71e18dc31ba7e2f4ea915b67eacc1ddb
> > I think this change should be folded in the previous commit: indeed,
> > that's the bump of mesa3d that causes the trouble.
> even with mesa being bumped to 20.x old code still builds,

Before, the code built without warnings, now it builds with warnings.

> mesa3d 20.0.0
> just added a warning about the old define being deprecated. Splitting 
> both topics, version bump and EGL_NO_X11, still creates a bisectable 
> history and makes it easier to pinpoint problems to either one of these 
> topics so I would still vote for two patches.

Since that's us, Buildroot, adding the define in the first place, it's
our fault that the warnings appear.

So, the bump introduces a regression, that is a build without warnigns
now has warnings, and so the bump should come with the fix.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
