From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 May 2013 19:41:31 +0200
Subject: [Buildroot] [PATCH] package/attr: fix building out-of-tree
In-Reply-To: <20130523132517.7b028641@skate>
References: <1369304728-21798-1-git-send-email-yann.morin.1998@free.fr>
 <20130523123208.57177273@skate> <20130523132517.7b028641@skate>
Message-ID: <20130523174131.GA3250@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-05-23 13:25 +0200, Thomas Petazzoni spake thusly:
> On Thu, 23 May 2013 12:32:08 +0200, Thomas Petazzoni wrote:
> > > This needs touching a m4 macro, so requires autoreconf.
> > > 
> > > But since this is not a true autotools-package, autoreconf whines
> > > about missing macros. So we have to explicitly pass '-I m4'.
> > > 
> > > But since this is not a true autotools-package, the build then fails
> > > with missing definition for _() as the configure scripts gets confused.
> > > So, we just call autoconf, not autoreconf.
> > 
> > If it's not a true autotools-package, then it shouldn't be using the
> > autotools-package infrastructure, I'd say.
> > 
> > And making a change to the source code at the configure step (such
> > as autoconf or autoreconf) is fundamentally going into the wrong
> > direction with regard to out-of-tree support. All steps until configure
> > are done only once, on the source tree, and then all steps starting
> > from the configure step are done for both the target build and the host
> > build.
> > 
> > Therefore, autoreconf/autoconf should not be part of the configure
> > step anymore. I'm sending an e-mail about that in a moment.
> 
> Also, since this package doesn't use automake, most likely its
> Makefiles are not out-of-tree capable, so in this case, there's no
> point in fixing the configure script to be out-of-tree capable if the
> rest of the build process isn't.

Indeed. I'll look at making it a generic-package instead, which will
fix OOT at the same time (since generic-package will be not-OOT capable
by default).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
