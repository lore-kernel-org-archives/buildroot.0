From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Aug 2013 20:25:05 +0200
Subject: [Buildroot] SELinux Buildroot Additions
In-Reply-To: <OF340CA870.4409C997-ON86257BD4.005E13D7-86257BD4.0061A29C@rockwellcollins.com>
References: <OFC105562B.76AF62E8-ON86257BD4.005985FE-86257BD4.0059C2DD@rockwellcollins.com>
 <20130827190459.1eb3e4d9@skate>
 <OF340CA870.4409C997-ON86257BD4.005E13D7-86257BD4.0061A29C@rockwellcollins.com>
Message-ID: <20130827202505.22f5ee46@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Clayton,

On Tue, 27 Aug 2013 12:46:25 -0500, clshotwe at rockwellcollins.com wrote:

> We have a multiple platforms that we will be validating this on 
> including ARM, x86, and PPC. I should be able to start pushing out
> patches for the packages within the week.

Nice!

> As for the defconfig issue, being able to pull down a reference config 
> and some skeleton changes to implement a specific feature would be very 
> nice to have. It may be possible to do QEMU targets for each architecture 
> but I will have to look into that further. 

I agree that having "demo" configurations would be useful. It's just
that it's not the purpose of the defconfigs we have today.

> The single SELinux flag will be more problematic.  There are a lot of 
> package dependencies that will be hard to configure without making the 
> menuconfig very confusing. Also, there is a huge issue with using Busybox 
> and the base SELinux Refpolicy put out by Tresys that cause applications 
> to not run in the correct SELinux context.

For other readers, the SELinux Refpolicy is apparently what is
available at http://oss.tresys.com/projects/refpolicy.

Can you expand on what is the huge issue between Busybox and the
SELinux Refpolicy? The fact that the Refpolicy doesn't include a policy
for Busybox? If so, isn't it possible to contribute a policy that would
be suitable for usage with Busybox? A quick Google search returns
http://code.google.com/p/sebusybox/.

Anyway, using Busybox on the target system is not necessarily mandatory
when using Buildroot, you can also chose to use the coreutils instead,
even though it's true that Busybox is our primary target for the base
of the system.

> For now, the documentation route, in the Buildroot manual, may be the best 
> way to go. I'll just table this for now until I get the patches pushed 
> out.

Right, sounds good!

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
