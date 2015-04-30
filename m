From: Floris Bos <bos@je-eigen-domein.nl>
Date: Thu, 30 Apr 2015 16:48:47 +0200
Subject: [Buildroot] [PATCH 1/2] raspberrypi2: switch Linux kernel to
 rpi-3.18.y
In-Reply-To: <1430314604-28680-1-git-send-email-fhunleth@troodon-software.com>
References: <1430314604-28680-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <554240CF.20605@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/29/2015 03:36 PM, Frank Hunleth wrote:
> This changes the kernel used on the Raspberry Pi 2 from the 3.19 branch
> back to the 3.18 branch. This provides a couple of advantages:
>
>    1. mmc0 works again. Floris Bos found out that this was due to using
>       the precompiled DTB files from rpi-firmware. These DTBs were built
>       using 3.18.
>    2. The rpi-3.18.y branch is not regularly rebased like rpi-3.19.y
>       according to popcornmix. See
>       https://github.com/raspberrypi/linux/issues/915.
>
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

Can confirm buildroot's raspberrypi2_defconfig now works on a Pi 2 
including mmc0, so patch works as intended.

Reviewed-by: Floris Bos <bos@je-eigen-domein.nl>


Did notice the rpi-firmware package itself could use some more work.
Besides the binary device tree files always being installed thing, the 
sample config.txt in package/rpi-firmware/config.txt also contains 
values that are not that suitable for the Pi 2.
E.g. the Pi 2 normally runs at 900 Mhz but is being downclocked to 700 
by "arm_freq=700" there.
Might be better not to have any low level settings like that there, just 
"kernel=zImage"

Yours sincerely,

Floris Bos
