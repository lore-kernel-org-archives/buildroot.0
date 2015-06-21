From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 21 Jun 2015 21:23:27 +0200
Subject: [Buildroot] CMake and VERBOSE variable
In-Reply-To: <0d88f0bd848eeb62c868dc2d5dffe496@openmailbox.org>
References: <9943347198fceae1227501e1d00f818a@openmailbox.org>
 <5578B394.1010503@mind.be> <a5c10080f12174d721c5f1ebad30b3f1@openmailbox.org>
 <5579E9EF.4070402@mind.be> <0d88f0bd848eeb62c868dc2d5dffe496@openmailbox.org>
Message-ID: <55870F2F.4080700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/18/15 10:29, C?dric Marie wrote:
> Hi,
> 
> Le 2015-06-11 22:05, Arnout Vandecappelle a ?crit :
>>  A quick review of a few typical packages (linux, busybox, uClibc, u-boot,
>> autotools-baed) only turns up uClibc that has a not-very-well documented use of
>> VERBOSE. So perhaps we should just revert Bernhard's patch and completely remove
>> VERBOSE.
>>
>>  Peter?
>>
>>  In fact, the export of quiet Q KBUILD_VERBOSE comes directly from the kernel
>> (another commit from Bernhard, log "adjust infrastructure for new kconfig"). But
>> of course, in the kernel the build system has complete control over what will be
>> called with this stuff in the environment. For us that's a lot more complicated.
>> So I think we should get rid of all these exports, and leave it up to individual
>> packages to do that. Only V is something that is really generally used I think.
> 
> 
> Indeed, all these settings are done the same way in the root Makefile of the
> kernel.
> Since KBUILD_VERBOSE doesn't seem to be used anywhere else in Buildroot (not
> even in support/kconfig), I also tend to think that this could be removed.
> 
> What should we do next?
> I'm not familiar enough with all these verbose settings, and also with the
> kernel, to be able to check that we're not breaking anything when removing them.
> Should I first send a patch that moves the export in the right place that you
> have suggested?
> Or wait for a cleaning of all these exports?


 I propose to do it in two patches:

- a first patch that removes the export of VERBOSE, with the commit log
explaining how it breaks cmake projects;

- a second patch that removes the export of all the rest, with the commit log
explaining that there is no reason to export it and that it was just inherited
from Kbuild.

 Can you do that?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
