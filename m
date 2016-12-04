From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 4 Dec 2016 21:33:10 +0100
Subject: [Buildroot] [PATCH] build/advanced: add option to check for use
	of cdefs.h
In-Reply-To: <20161204135202.109c6480@free-electrons.com>
References: <1480849177-16847-1-git-send-email-yann.morin.1998@free.fr>
 <20161204135202.109c6480@free-electrons.com>
Message-ID: <8bab492f-08f7-45aa-5dad-8460a3252ffc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-12-16 13:52, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun,  4 Dec 2016 11:59:37 +0100, Yann E. MORIN wrote:
>> We want to catch programs that directly include sys/cdefs.h so that
>> we can fix them not to. So, we want to instrument sys/cdefs.h to emit
>> a warning when it is included.
> 
> Thanks for working on this. However, I am still not convinced that we
> want to merge such an additional complexity (one new Config.in choice
> with three sub-options, two additional Config.in options), a cdefs.h
> wrapper for glibc/uclibc, etc.
> 
> Do we really care about upstream packages using sys/cdefs.h? Is it
> really the most important battle to fight against upstream projects
> using sys/cdefs.h?
> 
> If we start having instrumentation in Buildroot to detect such very
> specific "standard violation", then where do we stop? There's plenty of
> upstream projects doing bogus things all over the place.
> 
> I believe the paranoid checks for bogus -I/-L flags are fine because
> they really potentially break cross-compilation. But this cdefs.h
> mis-use doesn't break anything, now that we have the cdefs.h
> replacement for musl.
> 
> Peter, Arnout, what do you think?

 I agree with Thomas. It's not our responsibility to fix packages, just to
cross-compile them.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
