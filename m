From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Jan 2012 11:02:45 +0100
Subject: [Buildroot] including python when compiling for microblaze
In-Reply-To: <2AB0B5A7-70EA-4CDB-8B28-A07F81E83394@informatik.uni-bremen.de>
References: <2AB0B5A7-70EA-4CDB-8B28-A07F81E83394@informatik.uni-bremen.de>
Message-ID: <20120112110245.73e2323b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Thu, 12 Jan 2012 09:47:13 +0100,
Johannes Teiwes <jteiwes@informatik.uni-bremen.de> a ?crit :

> I am currently trying to port the python package in buidroot to the
> microblaze platform. I have everything set up with a custom toolchain
> etc. and it works fine. The problem is the libffi library, which is
> required for building any script language (e.g. perl, python) for
> buildroot. The exact error message says
> 
> configure: error: "libffi has not been ported to
> microblaze-unknown-linux-gnu."
> 
> Has anyone started to port libffi to another platform or even found a
> specific workaround for microblaze? Is there any alternative to the
> libffi library or installing python via buildroot?

Apparently, libffi has no supported for microblaze, and it seems that
libffi is a mandatory dependency for building Python. It looks like you
have two options:

 *) Port libffi to Microblaze

 *) Use a more lightweight scripting language such as Lua. Python is
    quite heavy for MMU-less systems at 100-180 Mhz such as Microblaze
    systems. Lua is probably a much better fit for this kind of systems.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
