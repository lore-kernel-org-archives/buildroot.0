From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Aug 2015 11:32:30 +0200
Subject: [Buildroot] [PATCH] [autobuild] package/nbd: fix static builds
In-Reply-To: <20150818111826.16620df1@free-electrons.com>
References: <1439495731-8645-1-git-send-email-yann.morin.1998@free.fr>
 <20150818111826.16620df1@free-electrons.com>
Message-ID: <20150818093230.GA3799@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-08-18 11:18 +0200, Thomas Petazzoni spake thusly:
> On Thu, 13 Aug 2015 21:55:31 +0200, Yann E. MORIN wrote:
> > +rename err() function to avoid clashing with err() form C library
> > +
> > +err() is a function available in the C library, so when static linking,
> > +there is a clash at link timebecause the function is provided both by
> > +nbd and the C library:
> > +    http://autobuild.buildroot.org/results/aa8/aa8a1ac35a93e1c8b9fddbc2b5d66ecaa921f31e/build-end.log
> > +
> > +Fix that by renaming err() to nbd_err() and providing a small maco
> > +wrapper to avoid touching the many call sites.
> > +
> > +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > +
> > +---
> > +Upstream status: hack, not submitted.
> 
> Please submit the patch upstream anyway, so that upstream is aware of
> the problem, and hopefully implements a proper solution.

I'm doing a proper patch for upstream, that does the rename globally,
and that's what I'm gonna submit.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
