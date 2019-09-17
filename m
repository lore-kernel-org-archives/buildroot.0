From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 17 Sep 2019 08:32:41 +0000
Subject: [Buildroot] [Bug 12196] duma package
In-Reply-To: <bug-12196-163@https.bugs.busybox.net/>
References: <bug-12196-163@https.bugs.busybox.net/>
Message-ID: <bug-12196-163-qmdRnxtvkd@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12196

--- Comment #2 from Aleksey <ioctl@ya.ru> ---
Its a specific debug tool, that works on low level, so, I think, author of the
duma has a reason to use -O0 in original GNUmakefile.

However, we can try to understand this reason.
Unfortunately I was unable to get core dump in buildroot environment. How can I
do it?

As for the CPU, its a Marvell SOC. I have the following options in the
configuration:

BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_ABI="aapcs-linux"
BR2_GCC_TARGET_CPU="marvell-pj4"
BR2_GCC_TARGET_FPU="vfpv3-d16"
BR2_GCC_TARGET_FLOAT_ABI="softfp"
BR2_GCC_TARGET_MODE="arm"

-- 
You are receiving this mail because:
You are on the CC list for the bug.
