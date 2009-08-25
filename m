From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Tue, 25 Aug 2009 13:48:21 -0400
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901C551E6@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA43C@mi8nycmail19.Mi8.com><20090819214237.534c433f@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA476@mi8nycmail19.Mi8.com><20090819233037.1d8e5a5d@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA4AD@mi8nycmail19.Mi8.com><20090820143514.7c5e56a2@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA58B@mi8nycmail19.Mi8.com><BD79186B4FD85F4B8E60E381CAEE190901BEA5DB@mi8nycmail19.Mi8.com><BD79186B4FD85F4B8E60E381CAEE190901BEA675@mi8nycmail19.Mi8.com><20090821114447.188fc839@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA738@mi8nycmail19.Mi8.com><20090822011906.2dd045fc@surf><BD79186B4FD85F4B8E60E381CAEE19091E7909@mi8nycmail19.Mi8.com><20090822105505.27ace9b6@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA86D@mi8nycmail19.Mi8.com><20090823081702.445b1b5a@surf><BD79186B4FD85F4B8E60E381CAEE190901C550E7@mi8nycmail19.Mi8.com><BD79186B4FD85F4B8E60E381CAEE190901C55101@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C551E6@mi8nycmail19.Mi8.com>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901C552DE@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

I found this FAQ on the CodeSourcery website.

Installing CodeSourcery Run-time Libraries
http://www.codesourcery.com/sgpp/lite/arm/portal/kbentry48

Would this simplify copying the external toolchain libraries
to the target rootfs?

What was the original problem with using the external toolchain
from it's installed location?  Why do the files need to be
copied to $(STAGING_DIR) and the flag "--sysroot $(STAGING_DIR)"
added to the TARGET_*FLAGS.

If the external toolchain is used from the install location I
think the -march= option will correctly setup the library paths
and allow the multilib toolchain to work correctly.  I believe
this is how the kernel build works.

Regards,
Hartley
