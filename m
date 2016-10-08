From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Oct 2016 15:51:30 +0200
Subject: [Buildroot] [PATCH v2 04/20] python3: make it exclusive from
 python
In-Reply-To: <20161008145107.277673a8@free-electrons.com>
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392756013-27757-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <8nrfcdx2pk.ln2@ID-313208.user.individual.net>
 <20161005213018.7a5567da@free-electrons.com>
 <20161008122434.GA3802@free.fr>
 <20161008145107.277673a8@free-electrons.com>
Message-ID: <20161008135130.GB3802@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-10-08 14:51 +0200, Thomas Petazzoni spake thusly:
> On Sat, 8 Oct 2016 14:24:34 +0200, Yann E. MORIN wrote:
> > First, as Thomas said, we'd need to have the kcofnig-side sorted out.
> > When looking only at external python modules for themselves, it is not
> > very complex: we already have some modules depend on either python xor
> > python3 for those modules that have an explicit dependency.
> > 
> > Where it gets more complex is when a package needs a modules that works
> > only with python and another module that works only with python3. I
> > don't know if this situation is realistic, but we have to at least take
> > it in consideration.
> 
> I don't understand how you solve the Kconfig side of the problem. How
> will you select which of the modules should be compiled for python2
> only, for python3 only or for both ?
> 
> Let's say you have three Python packages A, B and C. They are all
> compatible with both Python 2 and Python 3. And for the purpose of my
> system, I need A only with Python 2, I need B only for Python 3 and I
> need C for both Python 2 and Python 3.

Plain and simple: if a python module supports both python and python3,
and both are enabled, that python module is built for both python and
python3.

If for your system you only need A for python and B for python3, then it
is *your* responsibility to remove A for python3 and B for python in a
post-build script. That's what we've been advertising in similar cases
when people only wanted a subset of a package, and what you've been
suggesting when we were arguing about the libudev stuff (i.e. build the
full eudev and get rid of the udevd program in a post-build script). ;-)

> > I've started looking into this, but I have absolutely no code to show. I
> > think it *might* be possible to come up with something, but that may
> > probably add quite a bit of complexity and uglyness in the python-package
> > infra. I'm not sure it would be worth the effort... :-/
> 
> Please explain how to solve the Kconfig problem first. Until there is
> no solution for the Kconfig problem, there is really no point in even
> thinking about the build problems.

I don't think there is a "kconfig problem" to start with. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
