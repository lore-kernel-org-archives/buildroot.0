From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Feb 2018 23:27:23 +0100
Subject: [Buildroot] [RFCv3 05/15] pkg-generic: add .stamp_installed step
In-Reply-To: <CANQCQpb9_0-pcZXJ3egrmDZfMtdv9UYNuZzCcycO=87Ku=OAEg@mail.gmail.com>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
 <20171201205352.24287-6-thomas.petazzoni@free-electrons.com>
 <CANQCQpb9_0-pcZXJ3egrmDZfMtdv9UYNuZzCcycO=87Ku=OAEg@mail.gmail.com>
Message-ID: <20180222232723.5a9a5ac9@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Feb 2018 15:48:46 -0600, Matthew Weber wrote:

> On Fri, Dec 1, 2017 at 9:53 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> 
> > +# Some packages use install-staging stuff for install-target
> > +$$($(2)_TARGET_INSTALL_TARGET):                $$($(2)_TARGET_INSTALL_STAGING)
> > +
> >  $(1)-build:            $$($(2)_TARGET_BUILD)
> >  $$($(2)_TARGET_BUILD): $$($(2)_TARGET_CONFIGURE)
> >
> > @@ -813,6 +822,7 @@ $(1)-reconfigure:   $(1)-clean-for-reconfigure $(1)
> >  
> 
> Should the pkgname-dirclean target also remove its per-package folder ?

Yes, I would think so indeed.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
