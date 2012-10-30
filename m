From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 31 Oct 2012 00:35:38 +0100
Subject: [Buildroot] [PATCH 0/7] Introduce the _AVAILABLE mechanism
In-Reply-To: <50905E98.3080207@mind.be>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
 <50905E98.3080207@mind.be>
Message-ID: <201210310035.38831.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Wednesday 31 October 2012 Arnout Vandecappelle wrote:
>   Although we'll discuss this at the BR devel day next Saturday, Yann won't be there
> so we'd better have some discussion on the list as well (unless, Yann, you could
> be available on chat?).

No, I won't be on-line at all.

I'll be in Bracelona, too, but will be touring with my girlfriend. That
excludes any form of interaction with you guys during these two days! ;-)

> On 09/10/12 01:40, Yann E. MORIN wrote:
> [snip]
> > On the other hand, Arnout pointed out that only packages with depenencies on
> > toolchain features should be converted, and in cascade, packages that depend
> > on those, leaving alone packages that do not have any depednency at all (if
> > I understood correctly):
> >      http://lists.busybox.net/pipermail/buildroot/2012-August/058040.html
> >
> > Of course, no need to say I'm in favor of modifying all packages, if at least
> > only for points 1&2 above. ;-) Of course, I understand Arnout's concerns about
> > keeping simplicity and not adding cruft where it is not needed. This post is
> > to request comments on this new deeply-impacting change.
> 
>   With the pkg-new script, my concern is much reduced.  The simplicity of having
> the same pattern all over wins out in that case.

OK. Did you have a look at it? Does it fit your use-case? What would
be missing? (Note: it's still a little bare, and would probably do with
a little bit of enhancements, but at least proves the point that it is
possible to help adding new packages.)

> [snip]
> > Again, this series is an _RFC_ on the _AVAILABLE mechanism, so the first
> > question we must answer is:
> >
> >      Do we even want this mechanism in buildroot at all?
> >
> > Then, and only then, can we decide what to do, and how far to push it.
> 
>   There is still an alternative: patch Kconfig to "properly" handle
> select/depend transitivity.  I.e., when a symbol selects another symbol,
> this implies that all dependencies of the other symbol are inherited.  Did
> anyone ever investigate the feasibility of such an feature?

Yes. Both Thomas and I have had a look (but separately). I got an headache
each time I tried to understand the kconfig code. IIRC, Thomas' experience
was a bit in the same vein.

My point of view is that we must consider (unless proven otherwise) that
modifying kconfig to handle this select/depends mess is not possible.

If it were to be the case, then the change should go upstream (eg. the
Linux kernel) for review first, and then we should lobby for it to be
included there, before we should even try to use it.

But until then, lets consider this to be a limitation in kconfig that we
have no possibiliy to overcome in kconfig itself.

With this in mind, I think the _AVAILABLE stuff (or any other alternate
solution that still has to emerge) is the way to go.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
