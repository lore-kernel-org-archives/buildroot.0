From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Jul 2014 18:21:02 +0200
Subject: [Buildroot] [PATCH 4 of 6] uclibc: rename SETUP_DOT_CONFIG to
 FIXUP_DOT_CONFIG
In-Reply-To: <CAAXf6LWobeHbQB+d8MvtMF3x3=W1FPPdfSr-4yU_bi+ZKF3cGg@mail.gmail.com>
References: <patchbomb.1405338624@localhost>
 <1f15cd84996d1bb6fb3a.1405338628@localhost>
 <20140714163325.231613e5@free-electrons.com>
 <20140714143931.GK3684@free.fr>
 <CAAXf6LWobeHbQB+d8MvtMF3x3=W1FPPdfSr-4yU_bi+ZKF3cGg@mail.gmail.com>
Message-ID: <20140714162102.GM3684@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas?, All,

On 2014-07-14 16:43 +0200, Thomas De Schampheleire spake thusly:
> On Mon, Jul 14, 2014 at 4:39 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Thomas?, All,
> >
> > On 2014-07-14 16:33 +0200, Thomas Petazzoni spake thusly:
> >> On Mon, 14 Jul 2014 13:50:28 +0200, Thomas De Schampheleire wrote:
> >>
> >> > -define UCLIBC_SETUP_DOT_CONFIG
> >> > +define UCLIBC_FIXUP_DOT_CONFIG
> >> >     $(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(@D)/.config
> >>
> >> This this variable is actually copying the configuration file, I
> >> believe the current name of the variable is more correct than the one
> >> you propose to use, no?
> >
> > Thomas did the change, because in patch 5/6 it no longer does the copy,
> > it only does the fixup.
> >
> > This should probably have been explained in the commit log that the
> > change was needed by a future patch.
> 
> Ok, I see. I split off the change to a separate patch for clarity, but
> indeed at this moment it is not yet fully accurate. I can fold this
> patch with the 5th patch, or otherwise update the commit msg as Yann
> proposed, what do you prefer?

Well, I think a separate patch is better, since it is easier to review.
Just add a blurb in the commit log.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
