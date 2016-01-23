From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2016 00:00:27 +0100
Subject: [Buildroot] [PATCH] support/graph-depends: detect circular
 dependencies
In-Reply-To: <20160123223112.GD3363@free.fr>
References: <1453586685-24190-1-git-send-email-yann.morin.1998@free.fr>
 <20160123232121.10d1ffe3@free-electrons.com>
 <20160123223112.GD3363@free.fr>
Message-ID: <20160123230027.GE3363@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-01-23 23:31 +0100, Yann E. MORIN spake thusly:
> On 2016-01-23 23:21 +0100, Thomas Petazzoni spake thusly:
> > On Sat, 23 Jan 2016 23:04:45 +0100, Yann E. MORIN wrote:
> [--SNIP--]
> > I am a bit worried about the algorithmic complexity of this new
> > function. As you know, we had issues with other parts of graph-depends
> > having a too high algorithmic complexity to handle large
> > configurations, or configurations having specific patterns of
> > dependencies.
> > 
> > Have you measured the time impact of this new check on a very large
> > configuration (like allyespackageconfig) ?
> 
> I have an allyespackageconfig with an recent toolchain so I get a lot
> of packages, and I tweaked the config to disable a few to enable others.
> 
> And no, the speed impact is not measurable for me. I'll come up with
> numbers (of course, when there's no loop!) a bit later.

Damn, I spoke too fast. The speed was totally fine as long as there were
those circular dependencies I was hunting for.

But without any circular deps, the speed is awfull and totally
inacceptable.

I'll see what I can do to speed this up.

One option is to not do the check in graph-depends, but to off-load that
into the package infrastructure, so we detect them even earlier.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
