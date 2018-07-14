From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Jul 2018 22:03:06 +0200
Subject: [Buildroot] [git commit] board/minnowboard: add CONFIG_IGB in Linux
 kernel config
Message-ID: <20180714195905.53D5D88284@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02b7fbf8fc4321d5d7aab4bdc85f759060e016d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 2017 MinnowBoard Turbot skews no longer use the Realtek 8169
Ethernet chip.  The Turbot D0 uses The Intel I211, the Turbot Dual
Ethernet has an I210 (quad-core) or I211 (dual-core).

Add CONFIG_IGB to the Linux config but keep the Realtek 8169 support
to avoid breaking older boards

Tested on Turbot D0, lspci -k shows the igb driver is used:
03:00.0 Class 0200: 8086:1539 igb

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/minnowboard/linux.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/minnowboard/linux.config b/board/minnowboard/linux.config
index 03ffc5e371..27077dbcda 100644
--- a/board/minnowboard/linux.config
+++ b/board/minnowboard/linux.config
@@ -21,6 +21,7 @@ CONFIG_SATA_AHCI=y
 CONFIG_ATA_PIIX=y
 CONFIG_NETDEVICES=y
 CONFIG_R8169=y
+CONFIG_IGB=y
 CONFIG_INPUT_EVDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
