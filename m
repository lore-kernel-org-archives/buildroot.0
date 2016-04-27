From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 13:31:49 +0200
Subject: [Buildroot] [PATCH 1/2] uboot and arm trusted firmware build
 added to juno board
In-Reply-To: <20160427102302.GM28464@e106497-lin.cambridge.arm.com>
References: <eeb5c500573a8584bfbfe6d33bf160c725683a18.1461688139.git.jpinto@synopsys.com>
 <20160426221915.2651d4b2@free-electrons.com>
 <20160427102302.GM28464@e106497-lin.cambridge.arm.com>
Message-ID: <20160427133149.330a7ea0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Apr 2016 11:23:02 +0100, Liviu.Dudau at arm.com wrote:

> > On Tue, 26 Apr 2016 17:35:55 +0100, Joao Pinto wrote:
> > 
> > > +    +-- u-boot.bin
> > > +    +-- bl1.bin
> > > +    +-- bl2.bin
> > > +    +-- bl2u.bin
> > > +    +-- bl31.bin
> > > +    +-- fip.bin
> > 
> > Looking at your atfirmware package, I see bl1.bin and fip.bin being
> > copied to output/images, but not bl2.bin, bl2u.bin and bl31.bin. Why
> > are you mentioning them here?
> 
> Those get embedded into the fip.bin. For Juno you need only bl1.bin and
> fip.bin to be transfered to the board.

Right, and they are indeed not copied to $(BINARIES_DIR) by the
atfirmware package. So they shouldn't be mentioned in the readme.txt.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
