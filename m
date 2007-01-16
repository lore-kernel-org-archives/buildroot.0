From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 17 Jan 2007 00:38:00 +0100
Subject: [Buildroot] Loop in Config.in Dependencies caused by
	CAIRO/LIBGTK2/XORG
Message-ID: <45AD61D8.4070706@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Setting BR2_PACKAGE_LIBGTK2 will select BR2_PACKAGE_CAIRO
Setting BR2_PACKAGE_CAIRO will select BR2_PACKAGE_XORG
but BR2_PACKAGE_LIBGTK2 depends on BR2_PACKAGE_XORG
This will cause a loop in the dependencies.

We can make BR2_PACKAGE_CAIRO depend on BR2_PACKAGE_XORG,
or we can make BR2_PACKAGE_LIBGTK2 select BR2_PACKAGE_XORG.

Both fixes will break the loop (I tried)

What is the best way (Personally I think the latter)?

Best Regards
Ulf Samuelsson
