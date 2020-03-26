From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 26 Mar 2020 21:56:58 +0100
Subject: [Buildroot] [PATCH v2] package/libapparmor: new package
In-Reply-To: <CA+_SqVaJV25AFu3btPK6OfgNLsz_DEpxfohgW-cDKzRdCrHTtA@mail.gmail.com>
References: <20200326180115.30643-1-angelo@amarulasolutions.com>
 <20200326185659.GT22325@scaer>
 <CA+_SqVaJV25AFu3btPK6OfgNLsz_DEpxfohgW-cDKzRdCrHTtA@mail.gmail.com>
Message-ID: <20200326205658.GY22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2020-03-26 21:34 +0100, Angelo Compagnucci spake thusly:
> On Thu, Mar 26, 2020 at 7:57 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2020-03-26 19:01 +0100, Angelo Compagnucci spake thusly:
> > > From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> > > This patch adds libapparmor and it's related tools.
> > > The patch is quite complicated by the layout of the source tree:
[--SNIP--]
> > I've looked at the .mk, and I don't like it.
[--SNIP--]
> > Why don't you provide multiple packages:
> >   - libapparmor
[--SNIP--]
> >   - apparmor-utils, with just the parser (and binutils?) sub-dirs
> >   - pam
> >   - apache
> >   - python
> >   - profiles
> >   - rules caching

> I don't know. I've tried that approach at in the end it was a mess.
> Some of the steps to build the swig python are embedded into the
> makefile, so we need to call configure and make even for a package
> that instead could have been a simple python one.

Well, as far as I can see, that's exactly what your patch does: it
installs libapparmor, and then as post-staging hooks, it then builds the
rest of the package.

This is exactly what having two packages would provide.

Now, specifically about the python bindings: maybe they should be built
from the libapparmor package rather than the utils one, sure, if it
makes more sense...

> You mean having a patch series that will add bit by bit to the package?

Yes.

As you say yourself, the package is a mess as it is. By splitting it in
a series that adds each pieces one by one, it will:

   - allow you to provide a detailed commit log with full explanations
     about the required uglyness,

  - allow reviewers to understand that problem and better asses the
    uglyness, and see if it is indeed needed.

Also, "it was a mess" is not descriptive enough to dismiss the
multi-package attempt (where 'multi' may well be just '2').

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
