From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 3 Jun 2021 08:44:57 -0300
Subject: [Buildroot] EUDEV takes a very long time to load the Wifi
 firmware
In-Reply-To: <87sg1zzcz2.fsf@dell.be.48ers.dk>
References: <CAOMZO5CcUAt1kBQ4W-nu6U4KP40UbSwa4ohFBq42dDNresANHw@mail.gmail.com>
 <87sg1zzcz2.fsf@dell.be.48ers.dk>
Message-ID: <CAOMZO5Bv9A3CJq05PB8QPMus2s2atVbuSxCJGUyjXGBUP0x4Wg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, Jun 3, 2021 at 3:20 AM Peter Korsgaard <peter@korsgaard.com> wrote:

> Is there anything of interest in the logs? The eudev init script runs
> udevadm settle, does that take a long time or perhaps even times out?

Unfortunately, no logs are shown. I only get the kernel-related
firmware loading messages:

[  192.544227] ath10k_sdio mmc1:0001:1: qca9377 hw1.1 sdio target
0x05020001 chip_id 0x00000000 sub 0000:0000
[  192.554451] ath10k_sdio mmc1:0001:1: kconfig debug 0 debugfs 0
tracing 0 dfs 0 testmode 0
[  192.566465] ath10k_sdio mmc1:0001:1: firmware ver
WLAN.TF.1.1.1-00061-QCATFSWPZ-1 api 5 features ignore-otp crc32
7746e551
[  192.765756] ath10k_sdio mmc1:0001:1: failed to fetch board data for
bus=sdio,vendor=0271,device=0701,subsystem-vendor=0000,subsystem-device=0000
from ath10k/QCA9377/hw1.0/board-2.bin
[  192.784424] ath10k_sdio mmc1:0001:1: board_file api 1 bmi_id N/A
crc32 544289f7
[  194.081698] ath10k_sdio mmc1:0001:1: htt-ver 3.32 wmi-op 4 htt-op 3
cal otp max-sta 32 raw 0 hwcrypto 1
[  194.160101] mmc1: queuing unknown CIS tuple 0x01 (3 bytes)
[  194.177321] mmc1: queuing unknown CIS tuple 0x1a (5 bytes)
[  194.187873] mmc1: queuing unknown CIS tuple 0x1b (8 bytes)
[  194.194279] mmc1: queuing unknown CIS tuple 0x14 (0 bytes)

after more than 3 minutes as shown by the timestamp.

With mdev these same messages appear after 9 seconds.

Thanks
