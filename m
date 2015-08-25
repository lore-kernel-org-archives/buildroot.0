From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 19:54:52 +0200
Subject: [Buildroot] Starting network...
In-Reply-To: <944894A3EB1D044A9003B2F944389BB20474AD978E@svr-wa-exch1.atg.lc>
References: <944894A3EB1D044A9003B2F944389BB20474AD978E@svr-wa-exch1.atg.lc>
Message-ID: <20150825195452.2d7be97c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tommy,

On Mon, 24 Aug 2015 16:36:22 -0700, Lee, Tommy wrote:
> Hi Buildroot mailing list,
> 
> My host is Ubuntu-14.04 LTS. My Buildroot release is 2015.05. I have made the former meet the latter's requirements. My target is Marvell ARMADA A385 (ARM-Cortex-A9) DB-88F6820-GP. Last week I succeeded in the building of the zImage file of my Linux system which has a rootfilesystem integrated, and a armada-385-db-ap.dtb file, The DB-88F6820-GP on-board U-Boot-1.73 commands are able to the boot up the system. The U-Boot bootargs string is:
> 
> "setenv bootargs console=ttyS0,115200 root=/dev/ram0 rw rootdelay=2"
> But, I discovered, this system cannot enable the eth0 device at the boot time. The "Starting network..." messages are:
> 
> Starting network...
> [    1.618607] mvneta f1030000.ethernet eth0: could not find the PHY
> [    1.624732] mvneta f1030000.ethernet eth0: cannot probe MDIO busip: SIOCSIFFLAGS: No such device

This is a kernel/hardware issue, that has nothing to do with Buildroot.

However, beware that if you run the mainline (official) Linux kernel on
Armada 38x, the first network interface (from a HW point of view) is
seen as eth1 in Linux, and the second network interface (from a HW
point of view) is seen as eth0 in Linux. This is due to the ordering of
the nodes in the Device Tree, which are ordered by register address.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
