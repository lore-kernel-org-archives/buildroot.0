From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 11 Oct 2017 21:30:21 +0000
Subject: [Buildroot] [PATCH] mpd: enable package for external ARC
 toolchain
In-Reply-To: <20171011231916.1e88100d@windsurf.lan>
References: <20171011121617.15179-1-didin@synopsys.com>
 <528747de-6a5f-a011-4ec8-ac9141ce9bf2@mind.be>
 <20171011231916.1e88100d@windsurf.lan>
Message-ID: <1507757420.3839.24.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2017-10-11 at 23:19 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 11 Oct 2017 22:14:38 +0200, Arnout Vandecappelle wrote:
> > 
> > ?Hi Evgeny,
> > 
> > On 11-10-17 14:16, Evgeniy Didin wrote:
> > > 
> > > Now using prebuilt arc-2017.09-rc1 toolchain it is possible to
> > > build mpd package. The GCC patch solving the problem with pthread
> > > support check now is the part of ARC toolchain.
> > > 
> > > Note this patch has a prerequisite that updates ARC prebuilt toolchain,
> > > https://urldefense.proofpoint.com/v2/url?u=http-3A__patchwork.ozlabs.org_patch_824311_&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eV
> > > iXO7breS55ytWkhpk5R81I&m=g9SyhkcD7kkLjdVnxy_0PIxm6vf8vG9VuhheaCLHUOM&s=iTUcPjYUEl_yRBzAeiF08HNRskfS5hohJtPn80zE064&e=??
> 
> The ARC prebuilt toolchain is not tested by our autobuilders. The two
> ARC configurations that we have are:
> 
> support/config-fragments/autobuild/br-arc-full-internal.config
> support/config-fragments/autobuild/br-arcle-hs38.config
> 
> The first is a Buildroot internal toolchain, the second is an external
> toolchain, built with Buildroot.
> 
> So we are not testing the Synopsys-provided pre-built toolchain, and
> therefore the build failures that were detected in mpd and vlc were not
> caused by Synopsys pre-built toolchain.

Indeed, so then that note about prerequisite makes no sense.
Evgeniy will resend this patch with fixed commit message shortly.

-Alexey
