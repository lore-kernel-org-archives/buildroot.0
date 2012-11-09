From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Nov 2012 14:18:15 +0100
Subject: [Buildroot] Autotest infrastructure (a bit of off-topic: git
	repo URL)
In-Reply-To: <87bof76kkn.fsf@dell.be.48ers.dk>
References: <509BC913.3080902@mind.be> <509BDBF2.1060700@digi.com>
 <509C224B.8000405@mind.be> <20121109114750.6a4dc53a@skate>
 <87bof76kkn.fsf@dell.be.48ers.dk>
Message-ID: <20121109141815.1630955a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Fri, 09 Nov 2012 13:13:12 +0100, Peter Korsgaard wrote:

> This is getting pretty offtopic, but from a quick look at it, it seems
> nice, but:
> 
> - hardcoded for nand (E.G. uses nandwrite)
> - non-atomic (E.G. uboot environment is handled per-part, so you can end
>   up with a halfway upgraded system if something goes wrong)
> - fairly inflexible (hardcoded upgrade procedure, hw id handling, cgi)

Agreed. I've written this stuff for only one project at the moment, so
it hasn't been made more generic than it was needed at the time.

> I've solved it in the past by wrapping firmware upgrades in .deb files,
> and used the depends on / conflicts stuff for hw id/version handling,
> and the pre/post scripts to define the upgrade handling in the upgrade
> itself. To ensure an atomic change between current and upgraded system I
> key off the choice of kernel/rootfs from a single u-boot variable
> (typically called boot=high|low) which is only changed at the very end.

I also did an .ipk wrapping of firmware upgrade images for some other
project, for the same reason (post-install script triggering the
upgrade).

> Maybe we should do some more firmware upgrade talks at an upcoming
> conference ;)

Eeh, why not :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
