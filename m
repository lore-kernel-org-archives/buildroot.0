From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Apr 2019 10:30:26 +0200
Subject: [Buildroot] [PATCH] Revert "package/gettext-tiny: bump version
 to add --template option"
In-Reply-To: <CADvTj4ofweg9YnvMz6bzd_QMsgOVv14EKL1ARCP6LKPCYdVXDA@mail.gmail.com>
References: <20190407073708.11205-1-yann.morin.1998@free.fr>
 <CADvTj4ofweg9YnvMz6bzd_QMsgOVv14EKL1ARCP6LKPCYdVXDA@mail.gmail.com>
Message-ID: <20190407083026.GI2659@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2019-04-07 10:23 +0200, James Hilliard spake thusly:
> On Sun, Apr 7, 2019 at 9:37 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >
> > This reverts commit 758ea0e518492c703482a323653c3d20520b599b.
> >
> > 758ea0e bumped gettext-tiny to the latest (at the time) head of the
> > upstream git tree. In so doing, it included an upstream change of
> > behaviour that eventually broke the build of packages that use
> > -Werror=format-string.
> I'm assuming the glib2 build error was caused by this change.

Yes, see the build failure I pointed to below...

> I have a potential fix for that here:
> https://gitlab.gnome.org/GNOME/glib/merge_requests/770/diffs

I've ahd a quick look, but since I don;t know the glib2 code, I have no
idea if that is the correct solution.

However, you're probably going to have to provide more explanations
about your change to upstream, because libglib2 does build with the
non-tiny  implementations (either from glibc or from GNU gettext).

Regards,
Yann E. MORIN.

> >
> > Even though in Buildroot we usually try to avoid building with -Werror,
> > it is sometimes hard to go against such flags, especially when the
> > package uses an expicit, long list of such -Werror=foo flags.
> >
> > Revert the bump.
> >
> > Fixes:
> >     http://autobuild.buildroot.org/results/dec/decbbcad11fbf312f6e5fbe0bf32143bedb6610b/
> >     [and many more...]
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Giulio Benetti <giulio.benetti@micronovasrl.com>
> > Cc: Vadim Kochan <vadim4j@gmail.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Peter Korsgaard <peter@korsgaard.com>
> > ---
> >  package/gettext-tiny/gettext-tiny.hash | 2 +-
> >  package/gettext-tiny/gettext-tiny.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
> > index 7d13054144..672e964186 100644
> > --- a/package/gettext-tiny/gettext-tiny.hash
> > +++ b/package/gettext-tiny/gettext-tiny.hash
> > @@ -1,5 +1,5 @@
> >  # Locally Computed:
> > -sha256 00b03b08d909021aa5580fb45b6cf0ec45e9084ef94c26f034f03a64a69942bc  gettext-tiny-c6dcdcdef801127549d3906d153c061880d25a73.tar.gz
> > +sha256 654dcd52f2650476c8822b60bee89c20a0aa7f6a1bf6001701eeacd71a9e388b  gettext-tiny-v0.3.1.tar.gz
> >  sha256 b57aa4fdc1c614c28d41c1e2d5c4090935964c5f86291ba7d1c99ffd1d698b34  LICENSE
> >  sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  extra/COPYING
> >  # From http://lists.gnu.org/archive/html/bug-gettext/2016-06/msg00008.html
> > diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
> > index e3a6d11399..881edc6f35 100644
> > --- a/package/gettext-tiny/gettext-tiny.mk
> > +++ b/package/gettext-tiny/gettext-tiny.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >
> > -GETTEXT_TINY_VERSION = c6dcdcdef801127549d3906d153c061880d25a73
> > +GETTEXT_TINY_VERSION = v0.3.1
> >  GETTEXT_TINY_SITE = $(call github,sabotage-linux,gettext-tiny,$(GETTEXT_TINY_VERSION))
> >  GETTEXT_TINY_LICENSE = MIT, GPL-3.0+ (extra gettext)
> >  GETTEXT_TINY_INSTALL_STAGING = YES
> > --
> > 2.14.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
