From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Apr 2013 21:12:20 +0200
Subject: [Buildroot] Buildroot on Toradex Colibri PXA300
In-Reply-To: <4E1AF0DD-1622-4CD1-9C61-6A8C7BE71151@gmail.com>
References: <4E1AF0DD-1622-4CD1-9C61-6A8C7BE71151@gmail.com>
Message-ID: <20130410211220.38fef23a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marcus Tangermann,

On Wed, 10 Apr 2013 20:09:34 +0200, Marcus Tangermann wrote:

> I try to build a system for a Colibri Board with the Iris carrier
> board from Toradex. Its a Marvell PXA300 with 64MB RAM and NAND
> flash. I've configured a generic ARM for the toolchain and selected
> the colibri_pxa300_defconfig for the kernel which is already part of
> the Vanilla kernel. When booting the kernel stops after uboot
> unpacked the kernel.
> 
> Has someone used this board before or has any hint?

Enable CONFIG_DEBUG_LL, CONFIG_EARLYPRINTK and pass 'earlyprintk' on
your kernel command line. That should enable some more low-level
debugging messages.

I have personally never used PXA300 platforms, so I don't really know
at this point, but if we get more messages, it may provide some more
hints.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
