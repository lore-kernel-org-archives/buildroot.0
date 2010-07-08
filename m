From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jul 2010 09:31:45 +0200
Subject: [Buildroot] [PATCH] linux: rebuild after reconfiguring kernel
In-Reply-To: <0D753D10438DA54287A00B02708426976373A92CA9@AUSP01VMBX24.collaborationhost.net>
References: <201007061130.52946.hartleys@visionengravers.com>
	<20100707140932.63e1eb19@surf>
	<0D753D10438DA54287A00B02708426976373A92CA9@AUSP01VMBX24.collaborationhost.net>
Message-ID: <20100708093145.4bc1d0b9@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 7 Jul 2010 15:11:50 -0500
H Hartley Sweeten <hartleys@visionengravers.com> wrote:

> > Unless I'm missing something, this change is going to create a
> > linux26-menuconfig file or a linux26-xconfig file, which is not
> > correct, and is not going to retrigger the build step of the kernel.
> 
> Argh... Your correct.  The .stamp_configured file is the one that needs touched.

Right.

> > Which exact issue are you facing ? Can you provide an example ?
> 
> Your correct, when the .config file is changed the kernel does rebuild.
> 
> The strange thing is, yesterday it didn't work and I haven't changed anything.
> I would do:
> 
> $ make linux26-menuconfig
> 
> Change something in the config, then:
> 
> $ make
> 
> Or
> 
> $ make linux26
> 
> And the kernel would not rebuild.  But if I did:
> 
> $ touch output/build/linux-2.6.34/.stamp_configured
> $ make
> 
> It would.
> 
> Oh well, it's working now...

Strange. If you manage to reproduce something like this, don't hesitate
to tell us.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
