From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Oct 2016 14:51:07 +0200
Subject: [Buildroot] [PATCH v2 04/20] python3: make it exclusive from
 python
In-Reply-To: <20161008122434.GA3802@free.fr>
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392756013-27757-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <8nrfcdx2pk.ln2@ID-313208.user.individual.net>
 <20161005213018.7a5567da@free-electrons.com>
 <20161008122434.GA3802@free.fr>
Message-ID: <20161008145107.277673a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 8 Oct 2016 14:24:34 +0200, Yann E. MORIN wrote:

> First, as Thomas said, we'd need to have the kcofnig-side sorted out.
> When looking only at external python modules for themselves, it is not
> very complex: we already have some modules depend on either python xor
> python3 for those modules that have an explicit dependency.
> 
> Where it gets more complex is when a package needs a modules that works
> only with python and another module that works only with python3. I
> don't know if this situation is realistic, but we have to at least take
> it in consideration.

I don't understand how you solve the Kconfig side of the problem. How
will you select which of the modules should be compiled for python2
only, for python3 only or for both ?

Let's say you have three Python packages A, B and C. They are all
compatible with both Python 2 and Python 3. And for the purpose of my
system, I need A only with Python 2, I need B only for Python 3 and I
need C for both Python 2 and Python 3.

> I've started looking into this, but I have absolutely no code to show. I
> think it *might* be possible to come up with something, but that may
> probably add quite a bit of complexity and uglyness in the python-package
> infra. I'm not sure it would be worth the effort... :-/

Please explain how to solve the Kconfig problem first. Until there is
no solution for the Kconfig problem, there is really no point in even
thinking about the build problems.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
