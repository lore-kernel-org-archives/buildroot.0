From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 02 Sep 2017 13:13:42 -0000
Subject: [Buildroot] [git commit] imx6q-sabresd: Add a qt5 defconfig variant
Message-ID: <20170902130615.0792181DA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8480e3b2ab50593b6b8a787430ccb33a0a5a1a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introduce imx6q-sabresd_qt5_defconfig that supports the opensource
Etnaviv graphical stack.

This defconfig provides a way to quickly test some graphical applications,
such as kmscube, qt5, glmark2.

Currently kernel mainline exhibits issues when running cpufreq as ondemand
governor on mx6, so add a linux fragment that disables such option for the
time being.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
[Arnout:
 - Add Fabio to DEVELOPERS
 - Rename linux config fragment to linux_qt5.fragment
 - Add comment to linux_qt5.fragment why it is needed
 - Add explicit CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y to it
 - Reorder defconfig entries to they match imx6q-sabresd_defconfig
 - Remove strace and host-uboot-tools, neither seems to be needed
 - Drop BR2_PACKAGE_QT5BASE_LICENSE_APPROVED, it no longer exists
 - Replace BR2_TARGET_ROOTFS_EXT2_BLOCKS with BR2_TARGET_ROOTFS_EXT2_SIZE
 - Regenerate .gitlab-ci.yml]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml                                     |  1 +
 DEVELOPERS                                         |  1 +
 board/freescale/imx6q-sabresd/linux_qt5.fragment   |  4 ++
 board/freescale/imx6q-sabresd/readme.txt           | 23 +++++++
 .../imx6q-sabresd/rootfs_overlay/root/sabresd.json | 15 +++++
 configs/imx6q-sabresd_qt5_defconfig                | 76 ++++++++++++++++++++++
 6 files changed, 120 insertions(+)

Patch is too large, so refusing to show it
