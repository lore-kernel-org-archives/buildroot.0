From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 14:53:39 +0200
Subject: [Buildroot] [PATCH 1/2] uboot and arm trusted firmware build
 added to juno board
In-Reply-To: <20160427124632.GO28464@e106497-lin.cambridge.arm.com>
References: <eeb5c500573a8584bfbfe6d33bf160c725683a18.1461688139.git.jpinto@synopsys.com>
 <20160426221915.2651d4b2@free-electrons.com>
 <20160427102302.GM28464@e106497-lin.cambridge.arm.com>
 <20160427133149.330a7ea0@free-electrons.com>
 <5720A627.6000109@synopsys.com>
 <20160427120454.GN28464@e106497-lin.cambridge.arm.com>
 <20160427143915.4c66a19d@free-electrons.com>
 <20160427124632.GO28464@e106497-lin.cambridge.arm.com>
Message-ID: <20160427145339.36ff162b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Apr 2016 13:46:33 +0100, Liviu.Dudau at arm.com wrote:

> > So when you're saying this, are you saying that the binary blob is not
> > even available publicly for download?
> 
> It is available for download from Linaro downloads page, look for Juno firmware.
> However it is bundled inside a fip.bin and that is wrapped in a tarball.

That is still OK, we can always have a Buildroot package that
downloads that tarball, extracts it, takes the fip.bin, uses the
fip_create tool to extract the SCP firmware, install it somewhere, and
then have the atfirmware package pick it up to create the final fip.bin.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
