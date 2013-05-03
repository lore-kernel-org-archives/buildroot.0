From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 May 2013 10:55:31 +0200
Subject: [Buildroot] [PATCH v2 1/3] barebox: add custom version option
In-Reply-To: <CAHkwnC9xHJAHNauNewEGRof4u6YUsLyCsjm5PQgPhCKPwM53rg@mail.gmail.com>
References: <1366184503-16875-1-git-send-email-fabio.porcedda@gmail.com>
 <1366184503-16875-2-git-send-email-fabio.porcedda@gmail.com>
 <20130501231009.787484f5@skate>
 <CAHkwnC9xHJAHNauNewEGRof4u6YUsLyCsjm5PQgPhCKPwM53rg@mail.gmail.com>
Message-ID: <20130503105531.1b38a88e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Fri, 3 May 2013 08:49:04 +0200, Fabio Porcedda wrote:

> > On Wed, 17 Apr 2013 09:41:41 +0200, Fabio Porcedda wrote:
> >
> >> -config BR2_TARGET_BAREBOX_2013_01
> >> -     bool "2013.01.0"
> >> -
> >> -config BR2_TARGET_BAREBOX_2013_02
> >> -     bool "2013.02.0"
> >> -
> >> -config BR2_TARGET_BAREBOX_2013_03
> >> -     bool "2013.03.0"
> >> -
> >> -config BR2_TARGET_BAREBOX_2013_04
> >> +config BR2_TARGET_BAREBOX_LATEST_VERSION
> >>       bool "2013.04.0"
> >>
> >> +config BR2_TARGET_BAREBOX_CUSTOM_VERSION
> >> +     bool "Custom version"
> >> +     help
> >> +       This option allows to use a specific official versions
> >> +
> >
> > We need to have something that is consistent between U-Boot, Barebox
> > and the kernel. Currently U-Boot has a version selection, the Linux
> > kernel allows to chose the latest version (but with an option named
> > after the version itself, so the name of the option changes when the
> > version changes) or a custom version, and now for Barebox you're
> > proposing yet another solution: select the latest version (with an
> > option name that never changes) or a custom version.
> 
> I think it's easier to have a option name that doesn't change.
> If there isn't a specific reason to have a option name that changes
> then I will send a patch to change the linux kernel option name.
> 
> BR2_LINUX_KERNEL_3_9 -> BR2_LINUX_KERNEL_LATEST_VERSION

I don't really have a strong opinion about this thing, probably Peter
and Arnout have more ideas than I do on this.

The only thing I care about is to not make modifications specifically
on Barebox that are inconsistent with what is done on U-Boot, the
kernel, or other version-selectable components. For example, U-Boot
still allows to chose between several recent versions, which would make
it inconsistent with the patches you're proposing, and that's the thing
I don't like.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
