From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 27 Jul 2011 21:13:37 +0200
Subject: [Buildroot] [PATCH 3/3]  usbmount fixes
In-Reply-To: <4E29900B.6040502@visionsystems.de> (Yegor Yefremov's message of
 "Fri, 22 Jul 2011 16:58:19 +0200")
References: <4E298D06.4050107@visionsystems.de>
 <4E298E70.50200@visionsystems.de> <4E298ED8.5000901@visionsystems.de>
 <4E29900B.6040502@visionsystems.de>
Message-ID: <874o27tu3i.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

 Yegor> - create mounting points
 Yegor> - fix dependencies
 Yegor> - fix udev rules
 Yegor> - fix fs type detection

 Yegor> +++ b/package/usbmount/usbmount-rules-fix.patch
 Yegor> @@ -0,0 +1,19 @@
 Yegor> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 Yegor> +---
 Yegor> + usbmount.rules |    4 ++--
 Yegor> + 1 file changed, 2 insertions(+), 2 deletions(-)
 Yegor> +
 Yegor> +Index: b/usbmount.rules
 Yegor> +===================================================================
 Yegor> +--- a/usbmount.rules
 Yegor> ++++ b/usbmount.rules
 Yegor> +@@ -1,7 +1,7 @@
 Yegor> + # Rules for USBmount -*- conf -*-
 Yegor> +
 Yegor> + KERNEL=="sd*", DRIVERS=="sbp2",		ACTION=="add",	RUN+="/usr/share/usbmount/usbmount add"
 Yegor> +-KERNEL=="sd*", SUBSYSTEMS=="usb",	ACTION=="add",	RUN+="/usr/share/usbmount/usbmount add"
 Yegor> +-KERNEL=="ub*", SUBSYSTEMS=="usb",	ACTION=="add",	RUN+="/usr/share/usbmount/usbmount add"
 Yegor> ++KERNEL=="sd*", SUBSYSTEM=="block",	ACTION=="add",	RUN+="/usr/share/usbmount/usbmount add"
 Yegor> ++KERNEL=="ub*", SUBSYSTEM=="block",	ACTION=="add",	RUN+="/usr/share/usbmount/usbmount add"

Why? Is this udev and/or kernel version dependent? Have you submitted it
upstream?

-- 
Bye, Peter Korsgaard
