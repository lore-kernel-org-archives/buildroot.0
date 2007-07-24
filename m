From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 24 Jul 2007 20:18:17 +0200
Subject: [Buildroot] config update
In-Reply-To: <46A63685.5060806@cs.helsinki.fi>
References: <469C604E.5060703@cs.helsinki.fi> <20070724123433.GA18856@aon.at>
	<46A63685.5060806@cs.helsinki.fi>
Message-ID: <20070724181817.GC20613@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 24, 2007 at 08:27:33PM +0300, Heikki Lindholm wrote:
> Bernhard Fischer kirjoitti:
>> On Tue, Jul 17, 2007 at 09:23:10AM +0300, Heikki Lindholm wrote:
>>> Hello,
>>>
>>> I just updated my OS X buildroot and, recent changes breaking it, I have 
>> Can you please be more specific as to how it broke?
>
> Well, basically, it was easier to fix than thought, and I posted a patch 
> already:
> http://buildroot.uclibc.org/lists/buildroot/2007-July/003659.html

I'm curious if you need the same patch if you make menuconfig with e.g.
linux-2.6.21.5.
If so, then please fix this upstream first. If not then there must be
something different going on and we need to track that down.

> The two culprits for the breakage are:
> (1) foo.h includes features.h, which doesn't exist on OS X. Referring to my 
> above patch, this could also be fixed in the Makefile by not including 
> foo.h on OS X, but IMHO that's trickier (uname).
> (2) The linking was changed so, that ncurses wasn't linked in on OS X 
> anymore
>
> BUT I also noted another breakage, which I'm clueless about:
> http://buildroot.uclibc.org/lists/buildroot/2007-July/003658.html
> I'm using the same config I was with an older version (for example, rev 
> 18688 worked).

Do you have SYSROOT set in your .config?

You're using 4.1.2 and there was a reason why i only enabled sysroot for
gcc >= 4.2.0 (IIRC sjhill changed this, so you're better off to ask him
why he enabled sysroot support for 4.1.2.. I figure that it worked for
him else he wouldn't have enabled it. Perhaps it was erroneously enabled,
i wouldn't know.)
