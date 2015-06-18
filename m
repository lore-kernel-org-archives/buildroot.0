From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Thu, 18 Jun 2015 10:29:21 +0200
Subject: [Buildroot] CMake and VERBOSE variable
In-Reply-To: <5579E9EF.4070402@mind.be>
References: <9943347198fceae1227501e1d00f818a@openmailbox.org>
 <5578B394.1010503@mind.be>
 <a5c10080f12174d721c5f1ebad30b3f1@openmailbox.org>
 <5579E9EF.4070402@mind.be>
Message-ID: <0d88f0bd848eeb62c868dc2d5dffe496@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 2015-06-11 22:05, Arnout Vandecappelle a ?crit?:
>  A quick review of a few typical packages (linux, busybox, uClibc, 
> u-boot,
> autotools-baed) only turns up uClibc that has a not-very-well 
> documented use of
> VERBOSE. So perhaps we should just revert Bernhard's patch and 
> completely remove
> VERBOSE.
> 
>  Peter?
> 
>  In fact, the export of quiet Q KBUILD_VERBOSE comes directly from the 
> kernel
> (another commit from Bernhard, log "adjust infrastructure for new 
> kconfig"). But
> of course, in the kernel the build system has complete control over 
> what will be
> called with this stuff in the environment. For us that's a lot more 
> complicated.
> So I think we should get rid of all these exports, and leave it up to 
> individual
> packages to do that. Only V is something that is really generally used 
> I think.


Indeed, all these settings are done the same way in the root Makefile of 
the kernel.
Since KBUILD_VERBOSE doesn't seem to be used anywhere else in Buildroot 
(not even in support/kconfig), I also tend to think that this could be 
removed.

What should we do next?
I'm not familiar enough with all these verbose settings, and also with 
the kernel, to be able to check that we're not breaking anything when 
removing them.
Should I first send a patch that moves the export in the right place 
that you have suggested?
Or wait for a cleaning of all these exports?

Regards,

-- 
C?dric
