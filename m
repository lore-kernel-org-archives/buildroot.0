From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 25 Aug 2009 21:01:53 +0200
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901C552DE@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA738@mi8nycmail19.Mi8.com>
	<20090822011906.2dd045fc@surf>
	<BD79186B4FD85F4B8E60E381CAEE19091E7909@mi8nycmail19.Mi8.com>
	<20090822105505.27ace9b6@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA86D@mi8nycmail19.Mi8.com>
	<20090823081702.445b1b5a@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901C550E7@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C55101@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C551E6@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C552DE@mi8nycmail19.Mi8.com>
Message-ID: <20090825190153.GA29206@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 25, 2009 at 01:48:21PM -0400, H Hartley Sweeten wrote:
>Thomas,
>
>I found this FAQ on the CodeSourcery website.
>
>Installing CodeSourcery Run-time Libraries
>http://www.codesourcery.com/sgpp/lite/arm/portal/kbentry48
>
>Would this simplify copying the external toolchain libraries
>to the target rootfs?
>
>What was the original problem with using the external toolchain
>from it's installed location?  Why do the files need to be
>copied to $(STAGING_DIR) and the flag "--sysroot $(STAGING_DIR)"
>added to the TARGET_*FLAGS.
>
>If the external toolchain is used from the install location I
>think the -march= option will correctly setup the library paths
>and allow the multilib toolchain to work correctly.  I believe
>this is how the kernel build works.

except that the kernel won't link against those helper-libs as opposed
to userspace which will need some of those libs on the rootfs.
