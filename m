From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2020 09:00:40 +0200
Subject: [Buildroot] [PATCH] configs/qemu_arm_versatile_defconfig:
 increase SD card image size to 64MiB
In-Reply-To: <20201002160036.1530041-1-romain.naour@gmail.com> (Romain Naour's
 message of "Fri, 2 Oct 2020 18:00:36 +0200")
References: <20201002160036.1530041-1-romain.naour@gmail.com>
Message-ID: <87zh53x087.fsf@dell.be.48ers.dk>
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

 > Fixes:
 > https://gitlab.com/kubu93/buildroot/-/jobs/766482935

 > [1] https://git.qemu.org/?p=qemu.git;a=commitdiff;h=a9bcedd15a5834ca9ae6c3a97933e85ac7edbd36

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
