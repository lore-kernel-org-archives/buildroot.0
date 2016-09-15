From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Sep 2016 23:50:50 +0200
Subject: [Buildroot] [PATCH 1/5] grub2: bump up version
In-Reply-To: <CAK4VdL3qyfs+o66W8ekmPOWO7bpxEXg-d2_V0wqYn9pa9NxL6w@mail.gmail.com>
References: <20160913041548.10290-1-nunes.erico@gmail.com>
 <20160913041548.10290-2-nunes.erico@gmail.com>
 <c4d34da0-6dc8-3eec-a2aa-08cf5b05bf42@mind.be>
 <CAK4VdL3qyfs+o66W8ekmPOWO7bpxEXg-d2_V0wqYn9pa9NxL6w@mail.gmail.com>
Message-ID: <20160915215050.GA3668@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Erico, Arnout, All,

On 2016-09-15 23:29 +0200, Erico Nunes spake thusly:
> On Wed, Sep 14, 2016 at 2:25 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> > On 13-09-16 06:15, Erico Nunes wrote:
> >> Grub 2 version 2.00 which exists in Buildroot dates back from 2012 and
> >> does not support new interesting features such as ARM support.
> >>
> >> Despite it being the last official non-beta release, it makes sense to
> >> bump Grub 2 to current master HEAD as the project has not been providing
> >> regular releases since then.
> >> Other distributions such as Fedora have also been shipping variations of
> >> the newer "beta" releases.
> > [snip]
> >> diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
> >> index dc4e51e..ecdf421 100644
> >> --- a/boot/grub2/grub2.mk
> >> +++ b/boot/grub2/grub2.mk
> >> @@ -4,9 +4,9 @@
> >>  #
> >>  ################################################################################
> >>
> >> -GRUB2_VERSION = 2.00
> >> -GRUB2_SITE = $(BR2_GNU_MIRROR)/grub
> >> -GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
> >> +GRUB2_VERSION = 4e0f8f66e321cf1051c0e01f6fbcc6fc35a807b6
> >> +GRUB2_SITE = git://git.savannah.gnu.org/grub.git
> >
> >  It's not so nice that we have to download via git, no http protocol, we have to
> > autoregen, we can't check the signature...

A few nits:
  - http is available: http://git.savannah.gnu.org/r/grub.git
  - it is possible to add a hash for a git download; one just has to
    generate it manually locally

autogen.sh is ugly, really ugly: there is no way we can do without it.
They run a bunch of python scripts to "import" a few things: unicode (?)
and glib.

Then the copy/move files around.

Then again call other python scripts top generate some files.

They eventually call autoreconf -fi.

Meh... :-(

Seing that, I withdraw my suggestion to use the latest sha1: please use
the latest release tarball...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
