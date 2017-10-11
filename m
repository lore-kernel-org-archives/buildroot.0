From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 11 Oct 2017 20:51:47 +0000
Subject: [Buildroot] [PATCH] extern-toolchain: Bump ARC tools to
 arc-2017.09-rc1
In-Reply-To: <275d998b-73cf-ebd0-2047-a48704eeda36@mind.be>
References: <20171011091703.32495-1-didin@synopsys.com>
 <275d998b-73cf-ebd0-2047-a48704eeda36@mind.be>
Message-ID: <1507755106.3839.19.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Wed, 2017-10-11 at 22:14 +0200, Arnout Vandecappelle wrote:
> 
> On 11-10-17 11:17, Evgeniy Didin wrote:
> > 
> > This commit bumps ARC prebuild toolchain to arc-2017.09-rc1
> > 
> > There might be subtle differences between uClibc configuration
> > compared to Buildroot's one. Native RPC now is disabled?
> > because uClinc-ng has removed it.
> 
> ?These two sentences are unrelated, right? I mean, Buildroot's uClibc hasn't had
> RPC since April... So better make that two paragraphs.

Probably so.

> ?Could you describe the subtle differences?

Well we may do a full side-by-side comparison of uClibc's defconfigs
but that barely makes a lot of sense. I mean we used to use some configuration
which was formed as it was in years and not all choices I may justify and explain.

Still we're slowly drifting to Buildroot's uClibc defconfig with pretty much every
our release but not yet there... and Buildroot's defconfig changes with time but
we cannot change ours in the middle of development cycle.

Again we may do that comparison and identify all [meaningful] differences
but not sure what it gives.

> > 
> > 
> > Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> > Cc: Alexey Brodkin <abrodkin@synopsys.com>
> > Cc: arc-buildroot at synopsys.com
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > 
> > ---
> > ?.../toolchain-external/toolchain-external-synopsys-arc/Config.in??| 8 ++++----
> > ?.../toolchain-external-synopsys-arc.hash??????????????????????????| 8 ++++----
> > ?.../toolchain-external-synopsys-arc.mk????????????????????????????| 4 ++--
> > ?3 files changed, 10 insertions(+), 10 deletions(-)
> > 
> > diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-
> > arc/Config.in
> > index f438ea765d..cdf36d08e6 100644
> > --- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
> > +++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
> > @@ -1,18 +1,18 @@
> > ?config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
> > -	bool "Synopsys ARC 2016.09 toolchain"
> > +	bool "Synopsys ARC 2017.09-rc1 toolchain"
> 
> ?Do we really want the -rc1 toolchain? Shouldn't we wait for the release? It
> can't be because you want additional testing in the autobuilders, since this
> toolchain doesn't appear in support/config-fragments/autobuild.

Well we used to have ARC prebuilt toolchain in autobuilder if I'm not mistaken.
But due to some significant deviations from Buildroot defaults like missing IPv6
back in the day it got nuked. Maybe Thomas can remember it better... for some
reason I cannot find any signs of ARC prebuilt tools in
https://git.busybox.net/buildroot-test/?so I might be wrong here.

But indeed we wanted to get some more testing for that pre-built toolchain
and catch a couple of issues before cutting rc2 and final release.

And essentially once and if that patch gets accepted the plan was to
submit a config-fragment for it.

> > 
> > ?	depends on BR2_arc
> > ?	depends on BR2_HOSTARCH = "x86_64"
> > ?	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
> > ?	select BR2_INSTALL_LIBSTDCPP
> > -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> > +	#select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> 
> ?You shouldn't comment this line, just remove it.

Good catch - we'll fix that.

-Alexey
