From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Jul 2020 23:03:54 +0200
Subject: [Buildroot] [git commit] configs/snps_archs38_hsdk: re-enable USB
 support
Message-ID: <20200725210040.899888850E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=824902771259ce1b904ba6affdae0d334c7d879f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With this patch we enable CONFIG_USB for HSDK, which is not explicitly
selected by UDL since the commit 5d50bd440bc2 ("drm/udl: Make udl
driver depend on CONFIG_USB"). Commit 4c13ca86dcf8 ("ARC:
[plat-hsdk]: fix USB regression") is not yet backported to Linux
kernel 5.6.x, so we enable this option in fragment file for HSDK.

Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: arc-buildroot at synopsys.com
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/synopsys/hsdk/linux.fragment | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/synopsys/hsdk/linux.fragment b/board/synopsys/hsdk/linux.fragment
index 45d6c69af5..aaca08e015 100644
--- a/board/synopsys/hsdk/linux.fragment
+++ b/board/synopsys/hsdk/linux.fragment
@@ -1,2 +1,3 @@
 CONFIG_INITRAMFS_SOURCE=""
 CONFIG_ARC_UBOOT_SUPPORT=y
+CONFIG_USB=y
