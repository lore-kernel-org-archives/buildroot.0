From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 2 Jun 2016 12:54:26 -0300
Subject: [Buildroot] Tossing coins on Beaglebone Black kernel version
Message-ID: <CAAEAJfAnjZzOo2hZG4h=-_2mpZmqb3BUf=fkNLc08zdR9ePVWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As mentioned on IRC, beaglebone_defconfig U-Boot build is currently broken.
I don't think the error matters much, given the selected U-Boot version
is really old.

I'm working on fixing it and get a cleaner beaglebone_defconfig. While at it,
I realized the kernel version points to some random commit in some random
TI kernel tree.

As per the commit log:
""
    beaglebone: update to TI 3.12 kernel

    Git repo version is taken from meta-ti.
    It's a 3.12.10 kernel with TI's own patches on top.

    The defconfig has been kept rather close to our old defconfig.
    The kernel has been boot-tested using an NFS-root.

    Apart from the kernel change, the linux headers has also been
    updated from 3.8.12 to 3.12.10.
""

This is highly annoying, as not using a branch or tag prevents a shallow
clone, and so we need to retrieve the entire repo, even to get the
headers for the toolchain.

We are currently using git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
while TI kernel release [1] notes are pointing at
git://git.ti.com/processor-sdk/processor-sdk-linux.git.

Now, I'm not all that sure which kernel we want to use by default and that's
why I'm asking here, to hear what the rest thinks.

FWIW, I commercially support a AM335x product and we've switched to
linux mainline,
long, long time ago, because the SDK was incredibly crappy at that time.

Mainline lacks some important features such as 3D support, and platform
suspend-to-RAM, but it's in my experience less buggy, so I'd vote to
switch to it.

Unless of course, someone knows better and can point at a proper git tag
to use.

[1] http://processors.wiki.ti.com/index.php/Processor_SDK_Linux_Kernel_Release_Notes
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
