From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Jan 2009 12:28:17 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <1231326832.32308.320.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Wed\, 07 Jan 2009 12\:13\:52 +0100")
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<1231243376.32308.52.camel@elrond.atmel.com>
	<87vdsssiwo.fsf@macbook.be.48ers.dk>
	<200901070409.42558.markus.heidelberg@web.de>
	<1231326832.32308.320.camel@elrond.atmel.com>
Message-ID: <87prizl5im.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> but I had to disable SAMBA and STRACE and change to uCLibc-0.9.30
 Ulf> since 0.9.29 does not compile for anything I tried.

Ok, why would you use 0.9.29 now 0.9.30 is out? Anyway, I'll do a
0.9.29 test compile in a moment.

 Ulf> I giess a new version of STRACE has probably been introduced
 Ulf> and this broke the socat.XXX.patch.avr32 patches.

socat or strace?

It's probably caused by:

commit e3e68318e13e22e22c9619b24fc6dae1d8ac9e0a
Author: jacmet <jacmet@69ca8d6d-28ef-0310-b511-8ec308f3f277>
Date:   Mon Oct 20 09:04:49 2008 +0000

    strace: bump version
    
    Fixes build with 2.6.27 kernel headers

 Ulf> HCE has a new AVR32 patchset in the Atmel fork, which 
 Ulf> I hope to introduce soon.

Ok, but does it make sense when even HcE recommends people to use the
Atmel fork instead?

 >> I haven't yet asked why this merge happens so rarely. Maybe lack of
 >> time? OK, I'm already getting avr32-buildroot specific, but I think
 >> updating the "devel" branch would be nice, even without testing
 >> anything.  Currently the three branches "devel", "master" and
 >> "atmel-2.3" are the same, pointing to the latest release.

 Ulf> Lack of time is the answer.
 Ulf> The way it works is that HCE is doing the Atmel Branch
 Ulf> and I am working on the main svn (even if HCE is providing
 Ulf> patches from time to time).

With main svn you mean this tree? Maybe it would make more sense to
keep the Atmel stuff in your own fork?

 >> > It's not the size in bytes as such, it's the special casing and
 >> > (effectively) black box patches. Even when you test your changes on
 >> > multiple archs there's a fairly big change that you break stuff for
 >> > avr32/at91, or that you guys break it for the other archs. The same
 >> > with moving packages to new versions or removing old versions, you
 >> > cannot expect other people to forward port those arch specific
 >> > patches.

 Ulf> That is why other systems like OpenEmbedded allow having more
 Ulf> than one version of a package.
 Ulf> A system that only allows a single version is really not useful.

Sorry, I disagree. Most packages only have a single version and that
works fine. Almost everything under packages builds just fine on any
sane architecture. Look at huge distributions like Debian with 18K+
packages all building from the same sources on all archs.

 Ulf> A good system will allow buildroot to move to a 
 Ulf> newer version for some architectures, while not
 Ulf> breaking the build for other architectures.

I disagree. This is exactly what we SHOULDN'T do. We need to keep
close to upstream and only provide the latest stable version (except
for special situations) and work with upstream to fix problems if any.

Anything else is just too much work with too little improvements going
upstream.

-- 
Bye, Peter Korsgaard
