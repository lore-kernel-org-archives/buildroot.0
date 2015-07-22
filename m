From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 17:33:26 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <1437578801.3396.21.camel@synopsys.com>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com>
 <1437577561.3396.13.camel@synopsys.com>
 <20150722171451.344d7398@free-electrons.com>
 <1437578801.3396.21.camel@synopsys.com>
Message-ID: <20150722173326.00a1f959@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Wed, 22 Jul 2015 15:26:41 +0000, Alexey Brodkin wrote:

> > > This is a known thing in arc-2015.06 release.
> > > So please consider prebuilt toolchain update.
> > 
> > I don't understand this one: arc-2015.06 is the latest release used in
> > Buildroot. Why would rebuilding the toolchain solve this?
> 
> From git log I see that my patch that bumped arc tools from arc-2015.06-rc1 to arc-2015.06
> was applied on top of master on July 15th:
> http://git.buildroot.net/buildroot/commit/?id=1f0e184e402442331bd4cbe379721e109650f7a1
> 
> But BR prebuilt tools for ARC used in this build (BR2_TOOLCHAIN_EXTERNAL_URL="
> http://autobuild.buildroot.org/toolchains/tarballs/br-arcle-hs38-full-2015.05-496-g85945aa.tar.bz2") are dated July 7th.
> 
> And I know for sure that we completely disabled "cfi row mismatch" warning here:
> https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/2f87d9183367392accf601d09ab067b3eed96cf0
> 
> Makes sense?

Yes, but you said "this is a known thing in arc-2015.06 release", which
to me would mean the issue still exists in arc-2015.06.

But it's actually an issue in arc-2015.06-rc1, that was fixed in
arc-2015.06.

This is what confused me.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
