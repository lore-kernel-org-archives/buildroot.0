From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 Oct 2013 22:32:39 +0200
Subject: [Buildroot] [PATCH] beagleboneblack: add board
In-Reply-To: <CA+T6QPm4Er6ECV=YzDofWjMB61SxwgXbS35k3KkpYqHO+ZTFoA@mail.gmail.com>
 (Jason Kridner's message of "Fri, 27 Sep 2013 10:19:32 -0400")
References: <1380220826-17732-1-git-send-email-jkridner@beagleboard.org>
 <87bo3f5pz4.fsf@dell.be.48ers.dk>
 <OF4892FC0E.FA9FE3E3-ON86257BF2.006E10F1-86257BF2.006EC6A2@rockwellcollins.com>
 <CA+T6QPknCP3O2uM_S8va-MqY+jjzmojgmADw3wg4=4ePNmLw0A@mail.gmail.com>
 <1380262376.22318.10.camel@viko>
 <CA+T6QPm4Er6ECV=YzDofWjMB61SxwgXbS35k3KkpYqHO+ZTFoA@mail.gmail.com>
Message-ID: <87r4c2m6xk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jason" == Jason Kridner <jkridner@beagleboard.org> writes:

Hi,

 >> config BR2_LINUX_KERNEL_INTREE_DTS_NAME
 >> string "Device Tree Source file names"
 >> depends on BR2_LINUX_KERNEL_USE_INTREE_DTS
 >> help
 >> Name of the device tree source file, without
 >> the trailing .dts. You can provide a list of
 >> dts files to build, separated by spaces.
 >> "

 Jason> Adding multiple makes it not output any .dtb files to the
 Jason> output/images directory. It seems there is a single assignment in
 Jason> linux.mk. :(

No? It works here. I just tried taking our beaglebone_defconfig and
changing the DTS_NAME setting to:

BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-bone am335x-boneblack"

And I get:

ls -l output/images
total 7044
-rw-r--r-- 1 peko peko   10494 Oct  3 22:25 am335x-boneblack.dtb
-rw-r--r-- 1 peko peko   10537 Oct  3 22:25 am335x-bone.dtb
-rw-r--r-- 1 peko peko  100400 Oct  3 22:19 MLO
-rw-r--r-- 1 peko peko 5104640 Oct  3 22:25 rootfs.ext2
-rw-r--r-- 1 peko peko  377076 Oct  3 22:19 u-boot.img
-rw-r--r-- 1 peko peko 2831464 Oct  3 22:25 uImage

What did you do exactly?

-- 
Bye, Peter Korsgaard
