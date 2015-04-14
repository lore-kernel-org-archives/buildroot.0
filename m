From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Apr 2015 10:18:28 +0200
Subject: [Buildroot] [PATCHv2 04/21] Makefile: rename TARGETS to PACKAGES
In-Reply-To: <20150413200115.GE29025@free.fr>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150413200115.GE29025@free.fr>
Message-ID: <20150414101828.6b30606d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 13 Apr 2015 22:01:15 +0200, Yann E. MORIN wrote:

> > diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
> > index aec57c0..fe1a7db 100644
> > --- a/package/matchbox/matchbox.mk
> > +++ b/package/matchbox/matchbox.mk
> > @@ -1,4 +1,4 @@
> >  ifeq ($(BR2_PACKAGE_MATCHBOX),y)
> >  include $(sort $(wildcard package/matchbox/*/*.mk))
> > -TARGETS += matchbox-lib matchbox-wm
> > +PACKAGES += matchbox-lib matchbox-wm
> 
> I understand we need to manually add them to the list of packages,
> because neither matchbox-lib nor matchbox-wm have an associated Kconfig
> option.
> 
> Yet, I believe this should be changed so that they behave like any other
> package, and that we use 'select' from the matchbox package to select
> the -lib and -wm dependenct packages.
> 
> If we are really concerned that we do not want to make those
> user-selectable, we could make them prompt-less packages, and so they'd
> be hidden.
> 
> Of course, this is not a blocker for this patch, as you're doing a mere
> renaming of an existing variable, and the fix can be done in a follow-up
> patch (OK, written on my TODO-list).

Fully agreed, this custom matchbox stuff is weird, and should be
changed to better match what we normally do with other packages.
Looking forward to your patches on this, once you reach this point in
your ever-growing TODO-list!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
