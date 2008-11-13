From: Nick.Thompson at infineon.com <Nick.Thompson@infineon.com>
Date: Thu, 13 Nov 2008 11:09:00 +0100
Subject: [Buildroot] bluez
References: <c88e466f0811060612r70f1d4f7nec4376aca9414dbe@mail.gmail.com><20081106174340.208dc156@surf>
	<49142122.7020405@free.fr>
	<8CF9D79FB605004381900048F6005988032DDE4169@mucse405.eu.infineon.com>
	<49ED01FC03EE524BB7BB258E8F93BFF32B2E75@bfl-exchange-1.BFL.local> 
Message-ID: <8CF9D79FB605004381900048F6005988032DFBEB90@mucse405.eu.infineon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have attached a patch to the bug system at http://busybox.net/bugs/view.php?id=6134 to add bluez-libs and bluez-utils version 3.36 to buildroot.

Please make sure you use the latest patch as the first had an error in it which causes a build failure on release 0.9.29 uClibc platforms (the patch is not required in the latest 0.9.30-RC3 snapshots.)

When you configure dbus, you don't need dbus-glib for bluez - you might want it for other reasons of course. Here's some stuff from my .config which might help:

Nick-> grep DBUS .config
BR2_PACKAGE_DBUS=y
BR2_DBUS_EXPAT=y
# BR2_DBUS_LIBXML2 is not set
# BR2_PACKAGE_DBUS_GLIB is not set
Nick-> grep BLUEZ .config
BR2_PACKAGE_BLUEZ_LIBS=y
BR2_PACKAGE_BLUEZ_UTILS=y

Nick.

> -----Original Message-----
> From: Thompson Nick (IFGB COM PS CE PLSA CA)
>
> I'm preparing a patch for the bug system. The port is being tested by
> Michel Benoit. He is having a few problems building, that I want to see
> resolved before I submit the patch though.
>
> This will be for BlueZ 3.36 however.
>
> Nick.
