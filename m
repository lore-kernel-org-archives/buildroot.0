From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Jan 2021 14:00:26 +0100
Subject: [Buildroot] [PATCH] configs/orangepi_r1_defconfig: bump kernel
 to 5.10.10, u-boot to 2020.10
In-Reply-To: <20210124224504.GM2325@scaer> (Yann E. MORIN's message of "Sun,
 24 Jan 2021 23:45:04 +0100")
References: <20210124214226.29305-1-peter@korsgaard.com>
 <20210124224504.GM2325@scaer>
Message-ID: <87bldd6uj9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2021-01-24 22:42 +0100, Peter Korsgaard spake thusly:
 >> The probing order of the two mmc controllers (sdcard and sdio wifi) has
 >> changed in kernel 5.10 since commit 21b2cec61c04bd1 (mmc: Set
 >> PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4), so change to
 >> root=PARTUUID=.. instead of hardcoding /dev/mmcblkXp2.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> board/orangepi/orangepi-r1/boot.cmd     | 2 +-
 >> board/orangepi/orangepi-r1/genimage.cfg | 2 ++
 >> configs/orangepi_r1_defconfig           | 7 ++++---
 >> 3 files changed, 7 insertions(+), 4 deletions(-)
 >> 
 >> diff --git a/board/orangepi/orangepi-r1/boot.cmd b/board/orangepi/orangepi-r1/boot.cmd
 >> index e927b01e82..2e3a4bb679 100644
 >> --- a/board/orangepi/orangepi-r1/boot.cmd
 >> +++ b/board/orangepi/orangepi-r1/boot.cmd
 >> @@ -1,6 +1,6 @@
 >> setenv fdt_high ffffffff
 >> 
 >> -setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
 >> +setenv bootargs console=ttyS0,115200 earlyprintk root=PARTUUID=deadbeef-02 rootwait

 > I found deadbeef to be too depressive... I switched it to a better
 > suited magic: feedc0de (after all, the rootfs will feed code to run).

Fine my me. Thinking about it a bit more, a nicer solution would be to
move to GPT partitions and use root=PARTLABEL=rootfs instead of this
somewhat obscure disk signature. I'll send a patch.

-- 
Bye, Peter Korsgaard
