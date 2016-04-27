From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 14:39:15 +0200
Subject: [Buildroot] [PATCH 1/2] uboot and arm trusted firmware build
 added to juno board
In-Reply-To: <20160427120454.GN28464@e106497-lin.cambridge.arm.com>
References: <eeb5c500573a8584bfbfe6d33bf160c725683a18.1461688139.git.jpinto@synopsys.com>
 <20160426221915.2651d4b2@free-electrons.com>
 <20160427102302.GM28464@e106497-lin.cambridge.arm.com>
 <20160427133149.330a7ea0@free-electrons.com>
 <5720A627.6000109@synopsys.com>
 <20160427120454.GN28464@e106497-lin.cambridge.arm.com>
Message-ID: <20160427143915.4c66a19d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Apr 2016 13:04:54 +0100, Liviu.Dudau at arm.com wrote:

> > The SCP firmware is a critical piece for the Juno, but the problem is that it
> > can't be built from any repository I think.
> > @Liviu: Could you please confirm this info?
> 
> That's right, SCP firmware is not available in source form to 3rd parties for now.

Even though that's unfortunate, that's completely OK from a Buildroot
point of view: we already have lots of packages for closed-source
binary blobs (OpenGL implementations, firmwares, etc.).

> > If the SCP firmware exists as a binary only, then we have to include it in
> > /board/arm/juno folder for building the ATF out-of-the-box.
> 
> Thomas, the way ARM Trusted Firmware works (documented in docs/firmware-design.md in
> the ATF repo) requires that a runtime firmware binary for SCP (embedded within fip.bin)
> is loaded at boot time.

OK.

> One option is to copy the original fip.bin from the board, extract
> the bl2.bin from it using fip_create tool (bad name, sorry) and then
> embed it back in the newly created fip.bin. Mind you, fip_create
> actually supports updating an existing fip.bin, it doesn't have to
> create the file from scratch.

That's an option, but it doesn't give a Buildroot output that works
"out of the box" on the target, which is not unacceptable (it can be
explained in the readme.txt that comes with Buildroot for this board)
but a bit sad.

So when you're saying this, are you saying that the binary blob is not
even available publicly for download?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
