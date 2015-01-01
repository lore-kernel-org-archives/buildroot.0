From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Jan 2015 22:58:45 +0100
Subject: [Buildroot] [PATCH 2/7] linux: add option to rely on a
 bootloader-provided DTB
In-Reply-To: <20150101225102.64944ac5@free-electrons.com>
References: <cover.1420142707.git.yann.morin.1998@free.fr>
 <e330f5c885f762feb6f4d7487fe3f6aa29c7fca3.1420142707.git.yann.morin.1998@free.fr>
 <20150101222449.18453adb@free-electrons.com>
 <20150101214435.GJ4360@free.fr>
 <20150101225102.64944ac5@free-electrons.com>
Message-ID: <20150101215845.GK4360@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-01-01 22:51 +0100, Thomas Petazzoni spake thusly:
> On Thu, 1 Jan 2015 22:44:35 +0100, Yann E. MORIN wrote:
> 
> > Fact is, the prompt reads:
> > 
> >     [*] Device tree support
> > 
> > So, I take that as "build a kernel with support for the device tree",
> > not as "build a DTB".
> 
> Right, the prompt may not be the most appropriate one.

OK.

> > But Now I think of it, this patch is doing two things:
> > 
> >   - enable USE_OF when that option is enabled,
> > 
> >   - add support for bootloader- or board-provided DTB.
> > 
> > Maybe that should be split up in two, then?
> > 
> > Or do you still want that option to mean "build a DTB" ?
> 
> Yes, I believe the prompt should be changed. I really don't see the
> point of adding a new entry in the choice to simply mean "do nothing".
> 
> And also, enabling CONFIG_OF should be done by the defconfig of the
> platform, not by Buildroot.

OK, thanks for the position statement.

However, I beg to disagree on that last part: I think we should have
this as an option in Buildroot.

The reason is that some platforms can be built with or without support
for the device tree. The Raspberry Pi is but one such platform; there
are others. Their defconfig do not always enable USE_OF by default, it
must be a volunteer selection from the user.

In that case, your opinion is to delegate to the user the responsibility
to enable that on his own, right? So, it would no longer be possible to
use in-tree defconfigs for those boards, for example.

But as a starter, I'll rename the prompt, so it is no longer ambiguous.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
