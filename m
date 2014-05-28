From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 May 2014 18:22:49 +0200
Subject: [Buildroot] [PATCH] package infra: remove duplicats in
 dependencies list
In-Reply-To: <CAAXf6LUpMnSNoaPAtAzcSvAWobugT_ZY+SWEH3GrOWf1B1RH1Q@mail.gmail.com>
References: <1401027172-27405-1-git-send-email-yann.morin.1998@free.fr>
 <CAAXf6LUpMnSNoaPAtAzcSvAWobugT_ZY+SWEH3GrOWf1B1RH1Q@mail.gmail.com>
Message-ID: <20140528162249.GF3510@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-05-28 18:05 +0200, Thomas De Schampheleire spake thusly:
> On Sun, May 25, 2014 at 4:12 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> > Currently, we just use what a package declares as its dependencies.
> >
> > But some packages may declare the same depdency more than once. For
> 
> Some typo nits:
> 
> title: duplicates
> above: dependency
[--SNIP--]
> has

Gah. OK.

> > Although that does not cause any grievance for make, we end up generating
> > dependency graphs where this duplicate dependency is visible.
> >
> > Add an intermediary variable which contains the $(sort)-ed list of the
> > dependnecies, thus eliminating any duplicates.
> >
> > This has the side effect of also sorting the list, which is probably
> > good for reproducibility anyway.
> 
> While I'm ok with the idea, it could cause some new build failures
> initially due to missing mandatory dependencies which were hidden
> behind the current order.
> So I would add this to -next only so we have time to fix any problems.

Yes, I should have marked it for -next.

> > +# Eliminate dupes in dependencies
> > +$(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
> 
> I would write the full word: duplicates

OK.

Thanks for the review!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
