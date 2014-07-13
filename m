From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jul 2014 11:05:35 +0200
Subject: [Buildroot] Open bug overview: help wanted!
In-Reply-To: <20140712205430.1abdf0bf@core2quad.morethan.org>
References: <CAAXf6LU8ZkC4uk5qkq8HGN-zfL=MwAKJP4E=1sDNRDMSJwUutw@mail.gmail.com>
 <20140712215353.GD3582@free.fr>
 <20140712205430.1abdf0bf@core2quad.morethan.org>
Message-ID: <20140713090535.GC3588@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mike, All,

On 2014-07-12 20:54 -0500, Mike Zick spake thusly:
> On Sat, 12 Jul 2014 23:53:53 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > > https://bugs.busybox.net/show_bug.cgi?id=7172 major
> > > unassigned at buildroot.uclibc.org Name collision of rpath token
> > > expansion and internal variables
> > > The puzzle pieces for a solution are present in this bug report. All
> > > it needs is someone caring enough to create a proper patch for this.
> > > Any candidates?  
> > 
> > I'm not a fan of all this rpath trickery.
> > 
> > Basically, the submitter (probably) wants this to run his
> > buildroot-built system from somewhere else than / and does not want to
> > chroot into it.
> > 
> > Should we add complexity to Buildroot for this use-case?
> >
> 
> Some members here in the past have expressed interest in supporting
> after-market firmware creation for consumer devices.

And I am completely OK with that. What I'm arguing about is whether we
want to support running a Buildroot system out-side of / , ie. when the
root of the generated filesystem is not the root at runtime.

What I'm saying is that, if one wants to run the Buildroot generated
system as a complement to an existing system, that should be done by
chrooting into the Buildroot system, so that / is seen as / .

> Buildroot does provide the string field for the end-user to pass
> custom link-time options.
> 
> The point is, it should either work or be documented as to its
> limitations.

OK, I agree.

> That meets any definition of a "bug" in Buildroot.
> Not a "unsupported use case", a "bug", as in "broke" by implementation".

Well, this is a bit borderline, IMHO. ;-)

But OK, either we make it work (without adding too much complexity), or
we document it as a limitation.

> I would be glad to fix it for you if I could.

Oh, but you already provided quite a good analysis of the problem, and
even hinted to a possible solution. That's already good! :-)

Of course, the above is just my own feelings on the issue. I'd like to
get ThomasP's feelings on the issue, and your proposed solution.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
