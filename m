From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 17 May 2016 16:11:42 -0500
Subject: [Buildroot] [PATCH 1/4] fmc: add powerpc e6500 support
In-Reply-To: <20160517211405.6e6584ef@free-electrons.com>
References: <1463511883-27657-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20160517211405.6e6584ef@free-electrons.com>
Message-ID: <CANQCQpZ9br=NmCO4tns9SiThfBs-BkeTEMvXOs9Wi+DTDa17AQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, May 17, 2016 at 2:14 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Tue, 17 May 2016 14:04:40 -0500, Matt Weber wrote:
>
> > +ifeq ($(BR2_powerpc64), y)
>
> Remove the sparc before "y".
>
> > +     EXTRA_FLAGS = "M64BIT=1"
>
> EXTRA_FLAGS is not a proper variable name. Remember that the variable
> namespace is global in Buildroot, to *all* variables should be prefixed
> by the name of the package they are related to.
>
> However, in this case, why not just appending to FMC_MAKE_OPTS ?
>
> Also, your double quotes are not needed.
>
> > +else
> > +     EXTRA_FLAGS = ""
>
> Not needed.
>
> >  define FMC_BUILD_CMDS
> >       # The linking step has dependency issues so using MAKE1
> > -     $(TARGET_MAKE_ENV) $(MAKE1) $(FMC_MAKE_OPTS) -C $(@D)/source
> > +     $(TARGET_MAKE_ENV) $(MAKE1) $(FMC_MAKE_OPTS) $(call
> qstrip,$(EXTRA_FLAGS)) -C $(@D)/source
>
> Change not needed if you append to FMC_MAKE_OPTS.
>
> So, the only change needed to the .mk file is:
>
> ifeq ($(BR2_powerpc64),y)
> FMC_MAKE_OPTS += M64BIT=1
> endif
>
> Can you rework this?
>

Will do.

-Matt
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160517/76afcd82/attachment.html>
