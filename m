From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Thu, 06 Jan 2011 13:19:43 +0000
Subject: [Buildroot] Problem building avahi
In-Reply-To: <20110106135549.7f6ef437@surf>
References: <B3C53ADB207D471B8656E4BCBBDDD557@WSA.local>
	<20110105171027.1e64ffe6@surf>
	<D473AD103FC84CD18D1AF9AB6EAE9D2B@WSA.local>
	<20110106123238.1c227155@surf> <87ei8qgqju.fsf@macbook.be.48ers.dk>
	<20110106135549.7f6ef437@surf>
Message-ID: <1294319983.5892.18.camel@dubciaranr0.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ar D?ar, 2011-01-06 ag 13:55 +0100, scr?obh Thomas Petazzoni:

> On x86, it's fairly usual to have the kernel inside the root
> filesystem, and embedded x86 systems are quite common. So this feature
> could be seen as sufficiently useful to be integrated into BR.
> 
> Something like:
> 
> config BR2_LINUX_KERNEL_INSTALL_TO_ROOTFS
> 	bool "Install kernel image in rootfs"
> 	default y if BR2_i386 || BR2_x86_64
> 	help
> 	  Copy the generated kernel image to the /boot directory
> 	  in the root filesystem

This feature was present as BR2_LINUX_COPYTO_ROOTFS until the great
linux rework.
Commit fe1cba690a9afdd661abf0285b08ce95c6347de7 removed it.
