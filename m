From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jan 2012 21:50:10 +0100
Subject: [Buildroot] [PATCH] Add ttyO devices to the mdev configuration
 and the static device table.
In-Reply-To: <1325438796-3287-1-git-send-email-fhunleth@troodon-software.com>
References: <1325438796-3287-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20120101215010.3911add4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Frank,

Le Sun,  1 Jan 2012 12:26:36 -0500,
Frank Hunleth <fhunleth@troodon-software.com> a ?crit :

> +/dev/ttyO	c	666	0	0	253	0	0	1	4

Unfortunately, this does not work. The omap-serial driver does not
define its major number, its gets allocated by alloc_chrdev_region()
dynamically at runtime. Therefore, depending on the drivers that are
compiled into the kernel and their initialization order, the major
number of the omap-serial devices might be 253 or 252 or 251, etc.

Basically, with the omap-serial driver, there is no other choice than
using devtmpfs (optionally with mdev or udev).

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
