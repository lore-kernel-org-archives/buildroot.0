From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 19:23:43 +0200
Subject: [Buildroot] [PATCH v2] raspberrypi3: fix serial console (load
 pi3-miniuart-bt overlay)
In-Reply-To: <1462220744-6368-1-git-send-email-ps.report@gmx.net>
References: <1462220744-6368-1-git-send-email-ps.report@gmx.net>
Message-ID: <20160918192343.1cb566fe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 May 2016 22:25:44 +0200, Peter Seiderer wrote:
> - enable BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS in raspberrypi3_defconfig
> - add copy of rpi-firmware/overlays directory to boot partition in genimage-raspberrypi3.cfg
> - enhance post-image.sh script to add 'dtoverlay=pi3-miniuart-bt' on request
> - add BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay" in raspberrypi3_defconfig
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 --> v2:
>   - use pi3-miniuart-bt instead of pi3-disable-bt
>   - fix post-image.sh to add overlay lines only once
>   - add overlay description (and alternative solution) to readme.txt
> ---
>  board/raspberrypi/genimage-raspberrypi3.cfg |  1 +
>  board/raspberrypi/post-image.sh             | 13 +++++++++++++
>  board/raspberrypi/readme.txt                |  8 +++++++-
>  configs/raspberrypi3_defconfig              |  3 ++-
>  4 files changed, 23 insertions(+), 2 deletions(-)

What I understood from the discussions on your new patch "raspberrypi3:
fix serial console (add enable_uart=1", this older proposal is actually
what is preferred. It is a bit more complicated than just passing
enable_uart=1, but it allows to have the UART *and* run the CPU as its
normal frequency.

So, I've applied this patch, and marked the newer one (enable_uart=1)
as rejected.

It would be good if you could rebuild the raspberrypi3_defconfig, and
check that it works for you. While you're at it, it would be useful if
you could look at the bug report
https://bugs.busybox.net/show_bug.cgi?id=9196 and see if you can
reproduce the issue and/or help solve the problem.

Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
