From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Dec 2017 21:00:39 -0000
Subject: [Buildroot] [git commit] armbian-firmware: new package
Message-ID: <20171201205313.87AD48256D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c247a98a5d1c899d8a68d37c8742172d7914585
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package enables access to firmware blobs from Armbian firmware
repository: https://github.com/armbian/firmware

That repository contains multiple firmware blobs grouped by vendor.
For the sake of convenience each group can be independently selected
using Kconfig options. This commit enables the following options:
- firmware blobs for XR819 SDIO WiFi chip
- firmware blobs for AP6212 WiFi/BT combo

Armbian firmware repository does not include any specific licenses.
Most part of those firmware blobs belongs to various Android/Linux
SDK packages provided by board vendors. As a result, this package
makes use of the following conservative approach for all the
selected firmware binaries:
  FIRMWARE_LICENSE = PROPRIETARY
  FIRMWARE_REDISTRIBUTE = NO

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/armbian-firmware/Config.in             | 21 ++++++++++
 package/armbian-firmware/armbian-firmware.hash |  2 +
 package/armbian-firmware/armbian-firmware.mk   | 53 ++++++++++++++++++++++++++
 5 files changed, 78 insertions(+)

Patch is too large, so refusing to show it
