From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Oct 2017 23:19:16 +0200
Subject: [Buildroot] [PATCH] mpd: enable package for external ARC
 toolchain
In-Reply-To: <528747de-6a5f-a011-4ec8-ac9141ce9bf2@mind.be>
References: <20171011121617.15179-1-didin@synopsys.com>
 <528747de-6a5f-a011-4ec8-ac9141ce9bf2@mind.be>
Message-ID: <20171011231916.1e88100d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Oct 2017 22:14:38 +0200, Arnout Vandecappelle wrote:
>  Hi Evgeny,
> 
> On 11-10-17 14:16, Evgeniy Didin wrote:
> > Now using prebuilt arc-2017.09-rc1 toolchain it is possible to
> > build mpd package. The GCC patch solving the problem with pthread
> > support check now is the part of ARC toolchain.
> > 
> > Note this patch has a prerequisite that updates ARC prebuilt toolchain,
> > http://patchwork.ozlabs.org/patch/824311/  

The ARC prebuilt toolchain is not tested by our autobuilders. The two
ARC configurations that we have are:

support/config-fragments/autobuild/br-arc-full-internal.config
support/config-fragments/autobuild/br-arcle-hs38.config

The first is a Buildroot internal toolchain, the second is an external
toolchain, built with Buildroot.

So we are not testing the Synopsys-provided pre-built toolchain, and
therefore the build failures that were detected in mpd and vlc were not
caused by Synopsys pre-built toolchain.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
