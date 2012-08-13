From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Aug 2012 19:27:39 +0200
Subject: [Buildroot] [PATCH 2/5] linux: support unpacked kernel source
 tree
In-Reply-To: <CAJxxZ0NUYRsv3qsNY_pPPPSKsxHEt7-zQ2RkCUnwn+pmYu25Sg@mail.gmail.com>
References: <1344330577-25159-1-git-send-email-sonic.adi@gmail.com>
 <1344330577-25159-2-git-send-email-sonic.adi@gmail.com>
 <20120811200654.35b80b74@skate>
 <CAJxxZ0NUYRsv3qsNY_pPPPSKsxHEt7-zQ2RkCUnwn+pmYu25Sg@mail.gmail.com>
Message-ID: <20120813192739.0789b1e4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon, 13 Aug 2012 18:12:07 +0800,
Sonic Zhang <sonic.adi@gmail.com> a ?crit :

> > At the moment, what we have to offer is the local.mk mechanism: you can
> > create a local.mk in which you write:
> 
> Should I put this local.mk into buildroot/linux/ ?

By default, Buildroot reads local.mk from the top source directory, but
this is configurable through the BR2_PACKAGE_OVERRIDE_FILE
configuration option.

> > LINUX_OVERRIDE_SRCDIR = /path/to/linux/sources
> >
> > and then Buildroot will use the sources of Linux from this directory
> > instead of doing the normal download/extract/patch strategy.
> 
> The kernel configuration options in linux/Config.in don't allow me to
> choose a local source. What should I do after seting local.mk up?

Nothing, it will be picked automatically, because linux/ is handled by
the common package infrastructure, which takes care of the
<foo>_OVERRIDE_SRCDIR option you can set in local.mk.

I admit this isn't completely nice to use, but this is so far the best
solution we have found to implement this at the package infrastructure
level. If you have better suggestions, we are definitely open to
changing/improving this mechanism.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
