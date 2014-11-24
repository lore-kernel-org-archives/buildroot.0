From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Nov 2014 21:07:22 +0100
Subject: [Buildroot] Need help getting started with X11
In-Reply-To: <CAEzGmjByqb2QB4+-QDOcJYDo6zvD+UpkG9kaNmBzBHKMFaGDJg@mail.gmail.com>
References: <CAEzGmjByqb2QB4+-QDOcJYDo6zvD+UpkG9kaNmBzBHKMFaGDJg@mail.gmail.com>
Message-ID: <20141124210722.49239966@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lennart Ramberg,

On Mon, 24 Nov 2014 13:41:38 +0100, Lennart Ramberg wrote:

> Or, if anyone would be so kind, I'm stuck at the below defconfig.
> The system works in the sense that I can ssh into it, but now I want
> graphics on the console display.
> I have not yet anything in the overlays that starts or otherwise relates to
> xorg.
> My target chipset is Intel 852GM.
> For one thing, what is supposed to create an xorg.conf?

These days, if you enable udev a xorg.conf is often not needed.

> And I suppose X should be started somehow in supervisor.d like I start sshd
> there.
> 
> BR2_x86_i686=y
> BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> # BR2_TARGET_GENERIC_GETTY is not set
> BR2_ROOTFS_OVERLAY="board/eta/board1/rootfs-overlay/"
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_DEFCONFIG="i386"
> BR2_LINUX_KERNEL_INSTALL_TARGET=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_XSERVER_XORG_SERVER=y

Make sure to also enable the Intel graphics driver, i.e.
BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL. Note that you need to switch the
"modular X.org server" variant to achieve that.

And then, start the X server by simply running "X".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
