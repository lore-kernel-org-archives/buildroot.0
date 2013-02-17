From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Feb 2013 19:17:26 +0100
Subject: [Buildroot] Adding a ModemManager package
In-Reply-To: <512119BB.9000200@gmail.com>
References: <51210E6F.6000504@gmail.com> <20130217183148.2cc7dd92@skate>
 <512119BB.9000200@gmail.com>
Message-ID: <20130217191726.52f867ee@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Shawn J. Goff,

On Sun, 17 Feb 2013 12:56:11 -0500, Shawn J. Goff wrote:

> Sure, here's a patch. udev was disabling gudev; for now, I had to remove 

If you read the udev.mk, you see that gudev is disabled unless
BR2_PACKAGE_UDEV_ALL_EXTRAS is enabled. And your package selects it, so
it should "just" work.

> that part because the default configuration of ModemManager seems to 
> require it. I don't have a patch for the autogen-created files yet. I 
> run make, then go to the build directory and run "NOCONFIGURE=yes 
> ./autogen.sh", then go back and continue running make.

Use MODEM_MANAGER_AUTORECONF = YES instead.

I don't have the time to try and reproduce the problem right now, but
hopefully someone else will have a look.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
