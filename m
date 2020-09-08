From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Sep 2020 13:08:06 +0200
Subject: [Buildroot] [PATCH 5/5] Add support for Kendryte K210 based
 RISC-V boards
In-Reply-To: <CY4PR04MB3751D91DFA061C4587F51EAFE7290@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200908051624.425573-1-damien.lemoal@wdc.com>
 <20200908051624.425573-6-damien.lemoal@wdc.com>
 <20200908091728.6351079d@windsurf.hq.k.grp>
 <CY4PR04MB3751463068ACC779C758B3CDE7290@CY4PR04MB3751.namprd04.prod.outlook.com>
 <20200908110714.6979f5c8@windsurf.hq.k.grp>
 <CY4PR04MB3751D91DFA061C4587F51EAFE7290@CY4PR04MB3751.namprd04.prod.outlook.com>
Message-ID: <20200908130806.0aa9df67@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 8 Sep 2020 10:47:35 +0000
Damien Le Moal <Damien.LeMoal@wdc.com> wrote:

> I checked the differences. Mostly, they come from me removing all the file
> related tools since there is no SD card on the board, so no real file system
> beside in-RAM rootfs.
> 
> Given the memory savings this k210 busybox config gives, I would like to keep it
> as is for now, until I get to add the SD card support in the kernel, at which
> point switching back to the default minimal busybox config will make perfect
> sense. What do you think ?
> 
> Apart from this, I removed the uclibc config (not needed) and use the default.
> The init script is fixed and the overall, everything is much simpler. If you do
> not have any objection, I will post V2 of the series.

Sounds good to me, I'm fine with a custom Busybox config file for the
time being. Perhaps justify that in the commit log so we have a trace
somewhere of why we accepted a custom Busybox config file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
