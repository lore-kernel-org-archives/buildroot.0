From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 16 Jan 2018 22:21:30 -0200
Subject: [Buildroot] [PATCH] aoetools: new package
In-Reply-To: <20180115214905.10772c21@windsurf>
References: <1516007331-17509-1-git-send-email-sergio.prado@e-labworks.com>
 <20180115214905.10772c21@windsurf>
Message-ID: <CANu7NGtLujkC5izMfRAh8nHuLzU9PWBonn+Em_Ws+dcCEyBgSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for reviewing/applying the patch.

> > +config BR2_PACKAGE_AOETOOLS
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS
> > +     bool "aoetools"
>
> The bool property goes before the depends on. This is reported by
> check-package.

My mistake. I should definitely have run check-package.

> > +     help
> > +       The aoetools are programs for users of the ATA over Ethernet
(AoE)
> > +       network storage protocol, a simple protocol for using storage
over
> > +       an ethernet LAN.
>
> The lines here are too long. This is also reported by check-package.

Yep. I'll make sure to always run check-package in the next contributions.

> > +AOETOOLS_VERSION = 37
> > +AOETOOLS_SITE = https://github.com/OpenAoE/aoetools/archive
>
> You should have used the github helper here, since there is no tarball
> uploaded by the maintainer.

So the tarballs in https://github.com/OpenAoE/aoetools/releases was not
uploaded by the developer? It was generated automatically by GitHub? How to
know that?

> > +AOETOOLS_LICENSE = GPLv2
>
> This should have been GPL-2.0, which is the SPDX license code for the
> GPLv2.

Right.

> > +AOETOOLS_LICENSE_FILES = COPYING
> > +
> > +define AOETOOLS_BUILD_CMDS
> > +     $(TARGET_MAKE_ENV) $(MAKE) CC=$(TARGET_CC) -C $(@D)
>
> And here, I've changed to use $(TARGET_CONFIGURE_OPTS) instead of just
> CC, so that the CFLAGS are properly passed/used.

OK.

> One thing I didn't fix is that the aoe-stat script installed by this
> package uses /bin/bash in its shebang, so it won't work because this
> package doesn't depend on bash. Does this script really needs bash?
> Should we remove it in a post-install target hook? Something else?

It does not seem to need specifically /bin/bash. I'll propose a change to
/bin/sh to the developer. If I did not get any response in the next weeks,
I'll remove it with a post-install target hook.

Best regards,

Sergio Prado
Embedded Labworks

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180116/718c12a8/attachment.html>
