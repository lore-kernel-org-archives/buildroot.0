From: Lee, Tommy <Tommy_Lee@alliedtelesis.com>
Date: Tue, 25 Aug 2015 10:37:08 -0700
Subject: [Buildroot] Starting network... - update
Message-ID: <944894A3EB1D044A9003B2F944389BB20474AD97E7@svr-wa-exch1.atg.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot mailing list,

I did a dhcpcd experiment and discovered that my Buildroot-2015.5 Linux fails in its "dhcpcd eth0" and dhcpcd eth1" executions. The error messages are same as shown in my preceding email. However, the "dhcpcd eth2" is able to get a dynamic IP address from a DHCP server at work.

With this IP address I can continue my work. You probably know why my system cannot recognize eth0 which is specified as "BR2_SYSTEM_DHCP="eth0" in my .config.

Tommy
From: Lee, Tommy
Sent: Monday, August 24, 2015 4:39 PM
To: 'buildroot at busybox.net'
Subject: RE: Starting network...

Here is my .config.

From: Lee, Tommy
Sent: Monday, August 24, 2015 4:36 PM
To: 'buildroot at busybox.net'
Subject: Starting network...

Hi Buildroot mailing list,

My host is Ubuntu-14.04 LTS. My Buildroot release is 2015.05. I have made the former meet the latter's requirements. My target is Marvell ARMADA A385 (ARM-Cortex-A9) DB-88F6820-GP. Last week I succeeded in the building of the zImage file of my Linux system which has a rootfilesystem integrated, and a armada-385-db-ap.dtb file, The DB-88F6820-GP on-board U-Boot-1.73 commands are able to the boot up the system. The U-Boot bootargs string is:

"setenv bootargs console=ttyS0,115200 root=/dev/ram0 rw rootdelay=2"

But, I discovered, this system cannot enable the eth0 device at the boot time. The "Starting network..." messages are:

Starting network...
[    1.618607] mvneta f1030000.ethernet eth0: could not find the PHY
[    1.624732] mvneta f1030000.ethernet eth0: cannot probe MDIO busip: SIOCSIFFLAGS: No such device

Before I boot the system, the board's eth0 interface connects to a DHCP server. The attached is my .config. I am resolving this eth0-enabling issue. Your experience sharing is definitely welcome.

Tommy

________________________________
This e-mail message is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message. If you are the intended recipient, please be advised that the content of this message is subject to access, review and disclosure by the sender's e-mail System Administrator.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150825/552505e1/attachment.html>
