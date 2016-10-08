From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Oct 2016 18:55:49 +0200
Subject: [Buildroot] [PATCH v2 04/20] python3: make it exclusive from
 python
In-Reply-To: <20161008160228.71f9e08f@free-electrons.com>
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392756013-27757-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <8nrfcdx2pk.ln2@ID-313208.user.individual.net>
 <20161005213018.7a5567da@free-electrons.com>
 <20161008122434.GA3802@free.fr>
 <20161008145107.277673a8@free-electrons.com>
 <20161008135130.GB3802@free.fr>
 <20161008160228.71f9e08f@free-electrons.com>
Message-ID: <20161008165549.GD3802@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-10-08 16:02 +0200, Thomas Petazzoni spake thusly:
> On Sat, 8 Oct 2016 15:51:30 +0200, Yann E. MORIN wrote:
> > Plain and simple: if a python module supports both python and python3,
> > and both are enabled, that python module is built for both python and
> > python3.
> 
> Well, that's horrible from a filesystem size point of view, and I'm not
> really sure this would solve Bernd's issue. I'm pretty sure Bernd would
> like to have a given set of modules built for Python 2, and another set
> of modules built for Python 3.

Well, short of duplicating (tripling? more?) the kconfig symbols, there
is no easy solution.

But again, I would argue that, for Buildroot, we would be just happy to
at least have that situation: having both python2 and python3 on the
target, even with duplicated and useless python modules in some cases.
That would be an improvement against the current situation.

If anything, that would make scenarii currently impossible, possible.

*Then*, we could look at solving how to remove the useless duplicated
modules, if at all possible in a sane way...

> > If for your system you only need A for python and B for python3, then it
> > is *your* responsibility to remove A for python3 and B for python in a
> > post-build script. That's what we've been advertising in similar cases
> > when people only wanted a subset of a package, and what you've been
> > suggesting when we were arguing about the libudev stuff (i.e. build the
> > full eudev and get rid of the udevd program in a post-build script). ;-)
> 
> Well, yes, you could see it this way.
> 
> But on the eudev thing, you still get it wrong: having libudev
> installed separately from udevd is not an option offered by upstream.
> You had to hack all around the place to make this possible.

Hmm... Don't get me started on this topic (woops, I did start it!).
There are things not supporrted by upstream for which we patch some
stuff; and in some situations, I believe this is insane. The best
(worst!) example being the patch to build openssl in parallel; that one
is insane and dangerous: openssl is a tricky and critical piece of code,
and I'm not sure patching it with a patch that was not blessed (and was
even refused!) by upstream is sane... :-/

But OK, I'll first push upstream eudev to enable building only libudev.
I already started that, but time being always in short supplies, this
hasn't progressed too much for now... :-/

Topic closed. ;-)

> With your solution, indeed. However, I'm not sure it is worth the
> hassle supporting this mechanism. But it can certainly be done.

On contrary, I do believe this is worth the hassle.

But until I have some code, I'll close the topic... ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
