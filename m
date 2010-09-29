From: Martin Banky <Martin.Banky@gmail.com>
Date: Wed, 29 Sep 2010 13:18:09 -0700
Subject: [Buildroot] [PATCH 1/6] coreutils: converted to autotarget
In-Reply-To: <20100929132354.69c0efed@surf>
References: <1285296904-25793-1-git-send-email-Martin.Banky@gmail.com>
	<20100929132354.69c0efed@surf>
Message-ID: <AANLkTimeWRDQyvXv2ZvjxRKYVDYReUz8=oAt4J=KfpuJ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 29, 2010 at 4:23 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello Martin,
>
> On Thu, 23 Sep 2010 19:54:59 -0700
> Martin Banky <martin.banky@gmail.com> wrote:
>
> > +#COREUTILS_SITE = ftp://alpha.gnu.org/gnu/coreutils/
>
> Remove this line.
>
> > +BIN_PROGS = cat chgrp chmod chown cp date dd df dir echo false hostname
> \
> > +     ln ls mkdir mknod mv pwd rm rmdir vdir sleep stty sync touch true \
> > +     uname join
>
> The variable namespace is completely global in Buildroot, so I'd prefer
> to see this variable prefixed with COREUTILS_
>
> > +ifneq ($(BR2_ENABLE_LOCALE),y)
> > +define COREUTILS_REMOVE_LOCALE
> > +     rm -rf $(TARGET_DIR)/share/locale
> > +endef
> > +COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_REMOVE_LOCALE
>
> Not needed, the top-level Makefile takes care of this.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

Thomas,
     I'll take care of this, and resubmit the patch set. Did you see any
other issues that need to be taken care of?

Martin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100929/651dea18/attachment.html>
