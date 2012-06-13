From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Jun 2012 18:28:59 +0200
Subject: [Buildroot] [PATCH] xserver_xorg-server: backport hotplug
 support
In-Reply-To: <1339603696-2787-1-git-send-email-rbraun@sceen.net>
References: <1339603696-2787-1-git-send-email-rbraun@sceen.net>
Message-ID: <20120613182859.3217c88c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 13 Jun 2012 18:08:16 +0200,
Richard Braun <rbraun@sceen.net> a ?crit :

> The hotplug and configuration improvements in the X server 1.8 branch,
> namely the udev backend and the xorg.conf.d directory, were backported
> in the 1.7 Debian package. Grab the appropriate patches from the
> Debian xorg-server_1.7.7-14 sources, bump version to 1.7.7 for the
> latest fixes and clean patching, and adjust the makefile to enable
> the udev backend when using udev. This, combined with the evdev input
> driver, provides automatic support for USB mouse/keyboard
> hotplugging, and probably other device types.

Unless I'm wrong X11R7.7 has been released some time ago, and it
includes X server 1.12, at
http://www.x.org/releases/X11R7.7/src/xserver/. So why would we bother
backporting 1.8 material to a 1.7 version? Upgrading the complete X.org
stack to X11R7.7 seems like a much more appropriate solution. Or maybe
I'm missing something obvious?

Moreover in general, we don't like to carry patches that aim at adding
features. We carry patches to fix build problems, or sometimes
architecture-specific fixes, but large new features should not be added
to packages using patches, otherwise Buildroot will become an
unmaintainable crap of patches.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
