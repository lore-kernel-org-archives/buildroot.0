From: Ulf Samuelsson <ulf@atmel.com>
Date: Sun, 22 Jul 2007 09:08:50 +0200
Subject: [Buildroot] [RFC] Support for "distributions" in buildroot
References: <1184934649.6382.10.camel@elrond.sweden.atmel.com><20070720140438.GB29640@real.realitydiluted.com><044b01c7cb1e$8db0a550$dcc4af0a@atmel.com>
	<20070721184252.GA2523@zelow.no>
Message-ID: <002501c7cc4a$65c56530$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Subject: Re: [Buildroot] [RFC] Support for "distributions" in buildroot


> On Sat, Jul 21, 2007 at 12:34:36AM +0200, Ulf Samuelsson wrote:
>> 
>> Your suggestions means that either the end customer will get
>> a buildroot frozen at a certain time, or that the maintenance
>> effort to keep buildroot up to date has to be duplicated.
> 
> I believe in frozen snapshots instead of specifying source versions.
> 

"frozen snapshots" is still an alternative, even if the patch is applied.

I see buildroot as a promising tool to allow newbies to get running
with embedded linux, and the goal of most of my efforts are to
reduce the obstacles for the user.

The typical first requirement is to be able to build a first image
which simply works. For this the snapshot is OK.

When the newbie wants to start developing a product
then ideally it is good to use the latest version of packages,
but if that fails, then having a distribution where at least the
packages have been known to cooperate is a good thing.

> The rest of buildroot are also in so much flux that only being able to
> specify source package versions is just a small part to the solution.
> 


Rome wasn't built in a day...

> Patches are added, build system changed and so on.
> 

The patch system of today, is obviously not good at handling
several versions of the same package.
Instead of  just applying "*.patch", I much prefer that the makefile fragment
use a file with a list of patches which should be applied to the tarball.

Each supported package version then only needs its list of files ("series"?).
If a new version with new patches is added, then that needs a separate "series" file.
Adding a new patch for a new version will then not cause a problem, 
since the "series" file for the old version is not updated.
Patches can be shared between different versions, something which is not
possible if we use the current method "<package>-$(version)-<name>.patch".

It would also be good if there were a structured way to have some patches
downloaded from internet, instead of the ad-hoc methods used today.

If you want to upgrade your snapshot, then you can easily
rebuild the snapshot using the latest svn , but with original versions.
It will be much much easier to pinpoint the reasons for any flaws
instead of having to start from scratch using all new packages.


The question I posed before:

-  What happens if one architecture needs version 'A', and another architecture needs version 'B'?

still remains to be answered.


------------------
Really, Isn't is completely illogical that it is possible for users
to override some package versions (i.e. Linux) but not override the rootfs packages?

If the "latest" package is selected as default, then then the behaviour *after* 
the patch is the same as the behaviour *before* the patch, so I fail
to see why there should be *any* objections to the patch.

It is using constructs which are already in use in other parts of buildroot
so I think that is not really valid to claim that it has high complexity.

Just because some people like to do it in a certain way, does not mean
that everyone will want to do it in the same way, so why block other people?

Best Regards
Ulf Samuelsson
