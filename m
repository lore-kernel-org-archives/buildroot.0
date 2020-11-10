From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2020 21:16:14 +0100
Subject: [Buildroot] [PATCH 2/2] configs/qemu_arm_vexpress_defconfig:
 increase SD card image size to 64MiB
In-Reply-To: <20201108152736.2956555-2-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 8 Nov 2020 16:27:36 +0100")
References: <20201108152736.2956555-1-romain.naour@gmail.com>
 <20201108152736.2956555-2-romain.naour@gmail.com>
Message-ID: <87sg9hnf1t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Since Qemu 5.1, this defconfig doesn't boot due to the to small SD card image size (60MB).
 > qemu-system-arm: sd_init failed: Invalid SD card size: 60 MiB
 > SD card size has to be a power of 2, e.g. 64 MiB.
 > You can resize disk images with 'qemu-img resize <imagefile> <new-size>'
 > (note that this will lose data if you make the image smaller than it currently is).
 > qemu-system-arm: sd_init failed

 > From [1]:
 > "While the possibility to use small SD card images has been seen as
 > a feature, it became a bug with CVE-2020-13253, where the guest is
 > able to do OOB read/write accesses past the image size end."

 > The qemu_arm_vexpress_tz_defconfig doesn't trigger such issue since
 > it doesn't use the same filesystem support (i.e doesn't use
 > -drive file=output/images/rootfs.ext2,if=sd,format=raw).

 > Fixes:
 > https://gitlab.com/kubu93/buildroot/-/jobs/766482935

 > [1] https://git.qemu.org/?p=qemu.git;a=commitdiff;h=a9bcedd15a5834ca9ae6c3a97933e85ac7edbd36

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
