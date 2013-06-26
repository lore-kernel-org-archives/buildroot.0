From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Jun 2013 21:46:58 +0200
Subject: [Buildroot] [RFC v2 1/1] ti-gfx: add new package
In-Reply-To: <20130626125252.12035fd0@bourban>
References: <1372177754-13431-1-git-send-email-spenser@gillilanding.com>
 <20130625223125.7b8e3721@skate> <20130626125252.12035fd0@bourban>
Message-ID: <20130626214658.0eb7992f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Wed, 26 Jun 2013 12:52:52 -0500, Spenser Gilliland wrote:

> > Nice, thanks for your work on this. Having support for OpenGL on
> > OMAP3, OMAP4 and AM335x is definitely one of the most important part
> > of the GSoC.
> 
> I completely agree.  I'm working very diligently on this.

Great!

> > > Additional Info:
> > >    I've been using the 3.9.6-x3 tag of the kernel at 
> > >    https://github.com/RobertCNelson/stable-kernel by use of the
> > >    LINUX_OVERRIDE_SRCDIR option.
> > 
> > Are there some reports of the ti-gfx stuff working on such recent
> > kernels? Have you looked at the Yocto meta-ti layer at
> > http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/ ? If I look there,
> > they apparently don't have anything more recent than 3.0 or 3.1.
> 
> Yes, the RobertCNelson kernel has builds up to 3.9.6.   I am using this
> with fairly good success.  I've been using the meta-ti layer
> extensively to understand the process of installing the SGX drivers.
> Many things refer to a 3.8 kernel from ti.  However, this kernel was
> unbootable on the Beagle-XM. This may be a more apporiate option for
> the Beagle Black though.   

Ok.

> > Also, are you still trying on the Beagle-XM, or have you switched to
> > the BeagleBone Black.
> 
> The Beagle-XM is the current target.  From the start, I was trying to
> read the revision number on the SGX core using devmem2.  However for
> some unknown reason,  devmem2 is not working properly on the
> Beagle-XM.  When I finally tried the devmem from busybox, the revision
> was correctly read.  Thus, I'm thinking that there is a bug in devmem2
> which is causing the problem.  See patch here
> https://github.com/openembedded/meta-oe/blob/master/meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch

Argh, strange. The patch seems like devmem2 may not be working properly
on platforms that don't support unaligned accesses.



> > Also, I'm surprised you're not passing $(TARGET_CONFIGURE_OPTS) to
> > ensure the right compiler is used, etc.
> 
> This information is included in LINUX_MAKE_FLAGS.

Ah, correct, ok!


> > I guess this could maybe be refactored, but we can see that later once
> > the whole thing works.
> 
> Yes, it's kinda ugly.  I'm still working out the issues.  Once I know
> exactly what must be installed, I can start to clean this up.  

Yes sure, that's also why I haven't looked in more detail on what else
to propose.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
