From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 4 May 2017 15:34:55 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-05-02
In-Reply-To: <87r305au17.fsf@dell.be.48ers.dk>
References: <20170503062809.135BB207F9@mail.free-electrons.com>
 <CAOMZO5B9sPeE+_YH4nWykogzB_dq7XUpz0AraMXjgazZjA_DxA@mail.gmail.com>
 <CAOMZO5BbPjn9b6i1uDr01ikFsSHWy9xkzfpk7F7GhssQyCuuJw@mail.gmail.com>
 <20170504093049.27618dbf@free-electrons.com>
 <035B547B-A554-4715-A235-95E6A1E14EE9@uclibc-ng.org>
 <20170504095750.7cb38619@free-electrons.com>
 <87r305au17.fsf@dell.be.48ers.dk>
Message-ID: <1493912093.7376.14.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Peter, Waldemar, all,

On Thu, 2017-05-04 at 10:46 +0200, Peter Korsgaard wrote:
> > 
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > "Thomas" == Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:
> 
> ?> Hello,
> ?> On Thu, 4 May 2017 09:48:57 +0200, Waldemar Brodkorb wrote:
> 
> ?>> I wouldn't say it was wrong.
> ?>> We have all internal toolchains fixed and we get a good idea about the quality of the latest release.
> ?>>?
> ?>> May be it will motivate Synopsis to release a new tarball, as other important ARC Bugfixes are included
> ?>> in this release.?
> 
> ?> Well the problem is that in the mean time, we have autobuilder failures
> ?> caused by this. We are about to release -rc1, so we will try to reduce
> ?> the number of autobuilder failures, and this will get in the way. Which
> ?> is why we need to find a solution here.
> 
> ?> Options:
> 
> ?>??(1) Synopsys quickly publishes a new pre-built toolchain with uClibc
> ?>??????1.0.24 + wordexp

Unfortunately in the beginning of the current toolchain development cycle
we decided to stay on uClibc-ng 1.0.17 + backported ARC-related patches
due to different reasons and given we're now on rc2 stage there's no chance
to switch to any other version unfortunately. I hope next dev cycle we'll use just
latest upstream uClibc-ng release.

In other words (1) won't happen in coming days.
> 
> ?>??(2) We disable the Synopsys toolchain from our autobuilders

We're talking only about __prebuilt__ ARC toolchain right?
Because Buildroot-built tools use latest uClibc-ng with correct config.

Ideally I'd prefer to update affected packages so they are disabled for
ARC prebuilt tools with some easily greppable comment like:
----------------->8-----------------
?xxx yyy zzz # arc_prebuilt lacks wordexp
----------------->8-----------------
that will help us to track missing parts we need to work on in the future.
Otherwise we may just disable autobuilder for ARC prebuilt tools because:

1) There's no such thing as prebuilt engineering builds i.e. autobuilder
? ?only will test either RCs or final releases of ARC prebuilt tools which
? ?IMHO makes not much sense as that's a bit too late, rgiht?

2) We know there're differences in ARC prebuilt tools from what gets built in
? ?Buildroot still having ARC prebuilt tools is a nice opportunity to
? ?simplify life for some people who prefers to not build toolchain
? ?themselves and for basic stuff it usually works quite fine.

-Alexey
