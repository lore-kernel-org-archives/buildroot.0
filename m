From: Lee, Tommy <Tommy_Lee@alliedtelesis.com>
Date: Mon, 24 Aug 2015 16:38:37 -0700
Subject: [Buildroot] Starting network...
Message-ID: <944894A3EB1D044A9003B2F944389BB20474AD978F@svr-wa-exch1.atg.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150824/6db120be/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.aug21fri15
Type: application/octet-stream
Size: 54042 bytes
Desc: config.aug21fri15
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150824/6db120be/attachment.obj>
