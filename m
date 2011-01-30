From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Jan 2011 15:20:21 +0100
Subject: [Buildroot] rootfs.ubifs not able to mount by kernel
In-Reply-To: <4D453DDE.7000007@googlemail.com>
References: <20110130014541.ed0f21fc085cea67a12906c6b8e6fb44.9d3b1440ba.wbe@email10.secureserver.net>
	<4D453DDE.7000007@googlemail.com>
Message-ID: <20110130152021.4073fd79@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marcus,

On Sun, 30 Jan 2011 11:30:54 +0100
Marcus Osdoba <marcus.osdoba@googlemail.com> wrote:

> Writing a ubiFS on NAND (with RAW u-boot command) and mounting 
> afterwards is not possible. The produced ubiFS must be ubinized to a UBI 
> image.

Correct. But Nataraj did create the UBI volume with U-Boot, and has
written the UBIFS image inside this UBI volume.

> I must admit, that I did not exactly understand the diffrence between 
> ubifs and ubi, but as explained on the mtd-utils page, the ubifs is the 
> FS layer to the kernel in a traditional sense (like ext2FS) and ubi is a 
> technical layer between RAW NAND and FS.
> http://www.linux-mtd.infradead.org/doc/ubi.html
> http://www.linux-mtd.infradead.org/doc/ubifs.html

UBI is a bit like a LVM (Logical Volume Manager) for MTD devices. On
top of physical erase blocks, it creates volumes composed of virtual
erase blocks. This level of indirection allows UBI to handle bad block
replacement, wear leveling and other low-level flash issues.

Note that since recently, Buildroot is capable of generating a
ubinize'd UBI filesystem image, thanks to the work done by Julien
Boibessot from Armadeus. This is available in Buildroot git, and will
be part of the next Buildroot release.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
