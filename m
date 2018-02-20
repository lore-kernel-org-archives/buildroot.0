From: Scott Ellis <scott@jumpnowtek.com>
Date: Tue, 20 Feb 2018 08:09:06 -0500 (EST)
Subject: [Buildroot] buildroot-2017.11.1 and cape manager for Beaglebone
 Black.
Message-ID: <1519132146.05324245@apps.rackspace.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


You don't need cape manager for the built-in CAN controllers of the BBB
or to use any CAN capes with external CAN controllers that the BBB
communicates with over SPI.
 
It's just a matter of adding some sections to your dts. You can do it with
an include to your main dts.
 
Here are some links for dts includes to the 4.4 mainline kernel to enable
the built-in CAN controllers. Just a little pin muxing. This assumes you
have the kernel modules enabled, which you probably do.
 
The cape manager stuff was never supported by mainline linux or even TI
linux kernels only the Beaglebone specific kernels. And it's not even
supported by the Beagleboard folks anymore.They have moved to a u-boot
approach.
 
Cape manager is a technological dead-end.
 
 
 
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180220/48c986f4/attachment.html>
