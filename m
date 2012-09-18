From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Sep 2012 20:06:22 +0200
Subject: [Buildroot] [PATCH] Add package raspberrypi-firmware.
In-Reply-To: <201209181947.32049.yann.morin.1998@free.fr>
References: <1347914057-20287-1-git-send-email-marek.belisko@open-nandra.com>
 <201209172350.27316.yann.morin.1998@free.fr>
 <20120918070934.2e3182bf@skate>
 <201209181947.32049.yann.morin.1998@free.fr>
Message-ID: <20120918200622.472bf779@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 18 Sep 2012 19:47:31 +0200, Yann E. MORIN wrote:

> So, basically, the initial interest for this package is to provide the
> bootloader files, hence I believe the package should go in the bootloader
> sub-menu.
> 
> Then we can add a VideoCoreIV package in one of the "packages on target"
> sub-menu ("libs -> hardware handling" sounds the most adequate AFAICS).

And so this package would "depends on" a bootloader?

Marek made it clear at the beginning: even though this
rasberrypi-firmware package contains a bootloader, he decided to put it
in package/ because it also contains userspace libraries. And Marek
wanted to avoid having two separate packages, because it would be that
you would download the same original tarball (or Git repository) twice,
have two packages to upgrade when bumping the version, etc.

Note that we however already have a relatively similar situation with
u-boot: we have boot/uboot for the bootloader and package/u-boot-tools
for the host and target utilities.

It is clearly a lack of separation between source package and binary
packages that is causing problem here. We should normally have one
source package: rasberrypi-firmware, that provides two binary packages:
rasberrypi-bootloader and rasberrypi-videocore-libs.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
