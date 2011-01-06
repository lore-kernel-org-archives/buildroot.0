From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jan 2011 13:55:49 +0100
Subject: [Buildroot] Problem building avahi
In-Reply-To: <87ei8qgqju.fsf@macbook.be.48ers.dk>
References: <B3C53ADB207D471B8656E4BCBBDDD557@WSA.local>
	<20110105171027.1e64ffe6@surf>
	<D473AD103FC84CD18D1AF9AB6EAE9D2B@WSA.local>
	<20110106123238.1c227155@surf> <87ei8qgqju.fsf@macbook.be.48ers.dk>
Message-ID: <20110106135549.7f6ef437@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 06 Jan 2011 13:33:25 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas> Ok, good. At least this has exhibited an interesting bug of
>  Thomas> Buildroot that we'll have to fix.
> 
> Yeah.

Something like "grep -v" the lines that have already been changed to
start with $(STAGING_DIR)/usr ?

> For such a special situation, I would prefer to we tell users to do it
> with BR2_ROOTFS_POST_BUILD_SCRIPT instead.

On x86, it's fairly usual to have the kernel inside the root
filesystem, and embedded x86 systems are quite common. So this feature
could be seen as sufficiently useful to be integrated into BR.

Something like:

config BR2_LINUX_KERNEL_INSTALL_TO_ROOTFS
	bool "Install kernel image in rootfs"
	default y if BR2_i386 || BR2_x86_64
	help
	  Copy the generated kernel image to the /boot directory
	  in the root filesystem

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
