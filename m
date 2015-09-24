From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Sep 2015 09:26:18 +0200
Subject: [Buildroot] Building system for the Marvell's ARMADA A385 borad
 to resolve the VLAN trunk issue
In-Reply-To: <944894A3EB1D044A9003B2F944389BB20474C34BEE@svr-wa-exch1.atg.lc>
References: <944894A3EB1D044A9003B2F944389BB20474C34B0F@svr-wa-exch1.atg.lc>
 <5600612C.5060300@mind.be>
 <20150923170613.75f5e7e4@free-electrons.com>
 <944894A3EB1D044A9003B2F944389BB20474C34BEE@svr-wa-exch1.atg.lc>
Message-ID: <20150924092618.2af71055@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Sep 2015 10:58:15 -0700, Lee, Tommy wrote:

> Please view my in-line replies.

It would be nicer if you actually used an e-mail client that was
quoting properly the text you're replying to in the plain text version
of the e-mail (and avoid sending an HTML version).

> I received from my project management the Marvell's A385 package in
> July. Then I started the work on the board in the package -
> DB-88F6820-GP. What I have achieved is the success of building and
> booting the Linux-4.0.4 system on the DB-88F6820-GP board. The system
> is built with mvebu_v7_defconfig and armada-385-db-ap.dts.

This is not the correct Device Tree file. Use armada-388-gp.dts for the
DB-88F6820-GP. Using an incorrect Device Tree file might work
partially, but some devices may not work (especially network
interfaces, which are very often not configured in the same way between
different boards).

> My current problem, as I mentioned in my preceding email, is that the
> eth0 and eth1 interfaces cannot be enabled, but eth2 at the boot time.

Two things:

 * Remember what I already told you: the network interfaces are
   "inverted". eth0 is the second network interface, and eth1 is the
   first network interface.

 * Use "setenv fdt_skip_update yes" in U-Boot before booting, to tell
   the Marvell U-Boot to not do any magic fixup in the Device Tree
   before starting the kernel.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
