From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Nov 2012 09:45:26 +0100
Subject: [Buildroot] howto incorporate buildroot into an autobuild
In-Reply-To: <1352767649.18724.34.camel@genx>
References: <1352767649.18724.34.camel@genx>
Message-ID: <20121113094526.6392ab30@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello John,

On Mon, 12 Nov 2012 16:47:29 -0800, John Stile wrote:
> I am using buildroot for an embedded Arm project.
> 
> I was wondering how people using buildroot implement continuous
> integration builds?
> 
> Do you start from a clean checkout, build the whole tool chain (which
> takes a long time), and then build the project specific stuff?
> 
> I worry about not starting from a clean checkout, since some options may
> change, and the tools won't be rebuilt.
> 
> But I also worry people will complain how long the build takes.
> 
> Is there a good strategy to balance these concerns?

If you do continuous integration builds, do you really care that much
about the build time? Even if the build takes an hour, it is still very
reasonable for an continuous integration build system.

Tips to reduce the build time:

 * Get a fast machine. Many people complaining about build time are
   building inside a virtual machine on a slow laptop. This simply
   cannot work. Get a 4 or 8 cores machine, with 16+ GB of RAM, and
   some good I/Os.

 * Use an external toolchain.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
