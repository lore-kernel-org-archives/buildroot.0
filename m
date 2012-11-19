From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Nov 2012 23:46:01 +0100
Subject: [Buildroot] Xtensa in the autobuilders, first build failures
In-Reply-To: <50AAA88E.3090603@zankel.net>
References: <20121118232518.091b6154@skate>
	<50AAA88E.3090603@zankel.net>
Message-ID: <20121119234601.6274d4a6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Zankel,

On Mon, 19 Nov 2012 13:45:50 -0800, Chris Zankel wrote:

> However, I noticed that it was not the most recent version where I
> incorporated suggestions from Arnout, so will provide a small patch on
> top of it.

Ah, sorry, my bad. Don't hesitate to send a follow-up patch that fixes
the remaining problems.

> >  * Failure to build gdbserver for the target, and gdb for the target as
> >    well, both for the same reason: PTRACE_GETXTREGS and
> >    PTRACE_SETXTREGS are not defined by the kernel headers apparently.
> >    I'm not sure if they are just missing from the kernel headers, of
> >    the ptrace support is missing in the kernel. See:
> >
> >    http://autobuild.buildroot.org/results/1d2f307b2aa59bebca3bcb9ea854839f4b1d14fb/build-end.log
> >    http://autobuild.buildroot.org/results/ec58e302030b8f72b19e9bada16dabb076c60261/build-end.log
> Yes, I do have a patch for gdb. There are actually two ways to fix it,
> either in uClibc or gdb. I'm also working with Tensilica to get those
> changes upstream, so I have to avoid providing additional patches.

Great!

> >    It would be nice if you could have a look at this.
> >
> >  * Xtensa apparently does not have libffi support. However, it is quite
> >    a bit of work to get libffi support, so maybe we should just mark
> >    libffi as not available on Xtensa (which is quite annoying because
> >    libffi is a dependency for a huge number of packages, but we have
> >    the same problem with other architectures as well). See:
> >
> >    http://autobuild.buildroot.org/results/e097c27d38e49d4bf4e07f95c52e995709c08aa8/build-end.log
> Thanks, I will look into it.

Adding support for one architecture in libffi is not very simple, so if
you don't need it for your own projects, I don't think you'll have the
energy to work on this. 

> > Besides those issues, I'm just reminding you that we are still very
> > interested in having a Qemu Xtensa configuration to be able to run the
> > Xtensa systems we generate with Buildroot.
> I'm juggling between kernel, uClibc, and buildroot, so, please allow me
> some more time.

Sure, no problem!

> Regarding patches, should I send them to you and cc buildroot, or only
> to the mailing list? What's the best path to get them looked at and
> integrated into the tree?

Just send them to the list. You can Cc: me as well if you want, but I'm
basically reading everything that goes on the Buildroot list, so I
should catch them even if you don't Cc: me.

Thanks again!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
