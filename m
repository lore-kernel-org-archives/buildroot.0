From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 29 Jan 2015 19:56:52 +0100
Subject: [Buildroot] [PATCH 2/5] package/fbv: Switch to giflib
References: <1422300260-5361-1-git-send-email-bernd.kuhls@t-online.de>
 <1422300260-5361-2-git-send-email-bernd.kuhls@t-online.de>
 <87a914z20n.fsf@dell.be.48ers.dk>
Message-ID: <XnsA431CAEB4FCB1berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Peter Korsgaard <peter@korsgaard.com> wrote in 
news:87a914z20n.fsf at dell.be.48ers.dk:

>>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls-
zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org> writes:
> 
> > +define FBV_CONFIGURE_LIBUNGIF_IS_NOW_GIFLIB
> > +     $(SED) 's|-lungif|-lgif|' $(@D)/configure
> > +endef
> > +FBV_PRE_CONFIGURE_HOOKS += FBV_CONFIGURE_LIBUNGIF_IS_NOW_GIFLIB
> > +define FBV_MAKE_LIBUNGIF_IS_NOW_GIFLIB
> > +     $(SED) 's|-lungif|-lgif|' $(@D)/Make.conf
> > +endef
> 
> Why is it needed to patch Make.conf if you already patch configure
> (which generates it)?

right, patching Make.conf is not necessary, I will remove it in the next 
patch version.

> I would prefer to see the configure changes in the giflib patch
> instead. How do the archlinux guys handle it?

They are using sed to change Make.conf
https://projects.archlinux.org/svntogit/community.git/tree/trunk/PKGBUILD?
h=packages/fbv

which I did in the first place, but then configure printed this

checking for libungif presence... no

although compilation with libgif worked, so I patched the configure scripts 
afterwards to fix the wrong configure log but forgot to remove the 
Make.conf patch ;)

The next version will contain a patch for configure.

Regards, Bernd
