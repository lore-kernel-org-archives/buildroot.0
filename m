From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 19 Oct 2018 14:37:22 +0200
Subject: [Buildroot] Legacy patches for Binutils?
In-Reply-To: <4881796E12491D4BB15146FE0209CE6468177130@DE02WEMBXB.internal.synopsys.com>
References: <4881796E12491D4BB15146FE0209CE6468177130@DE02WEMBXB.internal.synopsys.com>
Message-ID: <20181019143722.32f0109b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Oct 2018 12:24:26 +0000, Alexey Brodkin wrote:

> This might be quite a na?ve and silly question but I'd like to understand
> if some patches for Binutils are still really needed.
> 
> 1. https://git.buildroot.org/buildroot/tree/package/binutils/2.31.1/0002-ld-makefile.patch
> This one I may track down to at least 2.15.94.0.2.2 here:
> https://git.buildroot.org/buildroot/commit/toolchain/binutils/?id=c1f119b500b487dac34a730609e6a0f1c30f8bfd
> Also from that patch I may conclude it came from Debian still no rationale why it was
> created, what it fixe or improves...
> 
> But in OpenEmbedded they got rid of it long ago on switch to 2.26, see
> https://github.com/openembedded/openembedded-core/commit/3c7fe424f850af70989ad682dd9c5be70cd02ca5
> 
> 2. Same here: https://git.buildroot.org/buildroot/tree/package/binutils/2.31.1/0003-check-ldrunpath-length.patch
> 
> 3. This one is pretty much the same: https://git.buildroot.org/buildroot/tree/package/binutils/2.31.1/0004-add-sysroot-fix-from-bug-3049.patch
> And bug mentioned in this patch was "fixed" a long ago, see https://sourceware.org/bugzilla/show_bug.cgi?id=10340
> 
> Any thoughts?

I don't have anything specific thought, but I share the general feeling
that the stack of patches we have on binutils should be
analyzed/revisited, as I'm also sure that a number of those patches are
no longer needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
