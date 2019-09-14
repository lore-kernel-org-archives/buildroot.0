From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 14 Sep 2019 12:08:09 +0000
Subject: [Buildroot] [Bug 12186] Raspberry Pi Zero-W build fails on newer
 kernel versions
In-Reply-To: <bug-12186-163@https.bugs.busybox.net/>
References: <bug-12186-163@https.bugs.busybox.net/>
Message-ID: <bug-12186-163-2Sn0lTrgNZ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12186

--- Comment #5 from Peter Korsgaard <jacmet@uclibc.org> ---
(In reply to Grzegorz Blach from comment #4)
Ahh, but that is because the kernel version got bumped last week:

commit 42d22f3bdba41da8e6b6ace2c78af2b3e34d7491
Author: Gergely Imreh <imrehg@gmail.com>
Date:   Tue Aug 27 15:14:28 2019 +0100

    {configs/raspberrypi,package/rpi-firmware}: bump kernel/firmware to
20190819 version

    It's the latest original version. The defconfig and
    package/rpi-firmware changes are done in a single patch, as they are
    going together.

    Signed-off-by: Gergely Imreh <imrehg@gmail.com>
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Which was applied on the 7th.
I have sent a patch to fix this - And while at it, also change the rpi0
defconfig to use the new dedicated dts file:

https://patchwork.ozlabs.org/patch/1162330/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
