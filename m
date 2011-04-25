From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 25 Apr 2011 21:44:28 +0200
Subject: [Buildroot] tic compile stops (resolved)
In-Reply-To: <1303759440.1283.16.camel@feynman.coloradoengineeringinc.com>
References: <1303749477.1283.5.camel@feynman.coloradoengineeringinc.com>
	<1303751802.1283.12.camel@feynman.coloradoengineeringinc.com>
	<1303759440.1283.16.camel@feynman.coloradoengineeringinc.com>
Message-ID: <201104252144.28571.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael, All,

On Monday 25 April 2011 21:24:00 Michael J. Hammel wrote:
> On Mon, 2011-04-25 at 11:16 -0600, Michael J. Hammel wrote:
> > FYI: Found something that is probably related but I need to investigate
> > more.  The version of ncurses with 2010.11 is 5.7.
> > This comes from
> > http://invisible-island.net/ncurses/ncurses.faq.html#cross_compiles
> 
> Okay, even simpler than patching Buildroot - I just had to install a
> newer version of ncurses to the host platform.  CentOS 5.4 has ncurses
> 5.5.  I downloaded and installed 5.7 from source and that fixed the
> buildroot build.
> 
> Just following up in case someone else runs into this issue.

What I do in crosstool-NG is that I first natively build the 'tic' program
and use that later when cross-building ncurses.
Native build of tic: see lines 159 to 190:
http://crosstool-ng.org/hg/crosstool-ng/file/tip/scripts/build/debug/300-gdb.sh#l159

So, to be fool-proff in all cases, buildroot should build its own native
tic program first.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
