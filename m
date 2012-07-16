From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Jul 2012 15:10:06 +0200
Subject: [Buildroot] [PATCH 2/4] Add support for appended device tree
 blobs for arm
In-Reply-To: <1341309676-18681-3-git-send-email-maxime.ripard@free-electrons.com>
References: <1341309676-18681-1-git-send-email-maxime.ripard@free-electrons.com>
 <1341309676-18681-3-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <20120716151006.5b93bd4e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue,  3 Jul 2012 12:01:14 +0200,
Maxime Ripard <maxime.ripard@free-electrons.com> a ?crit :

> +config BR2_LINUX_KERNEL_APPENDED_DTB
> +	bool "Append the Device Tree binary to the kernel"
> +	depends on BR2_arm || BR2_armeb
> +	help
> +	  After building the device tree blob, append it to the
> +	  kernel image. If necessary generates a uImage from that
> +	  new kernel image afterward.

Just got another idea here. Since cuImage and simpleImage on PowerPC
and Microblaze bundle their DTB, can't we define the Appended DTB
feature as an additional kernel image type?

I.e, on ARM, you would typically have:

	zImage
	zImage + appended DTB
	uImage
	uImage + appended DTB

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
