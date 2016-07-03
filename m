From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 13:17:35 +0200
Subject: [Buildroot] [git commit] iprutils: uses fork(), needs MMU
Message-ID: <20160703111758.9923F805EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9b004e846398e92d23d9a8a5ab1ce772ad6671c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/6ee89f9a4e05c89375a96ac7085747afc301b896/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iprutils/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iprutils/Config.in b/package/iprutils/Config.in
index 1bc58e8..42f372c 100644
--- a/package/iprutils/Config.in
+++ b/package/iprutils/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_IPRUTILS
 	select BR2_PACKAGE_NCURSES_TARGET_MENU
 	select BR2_PACKAGE_LIBSYSFS
 	select BR2_PACKAGE_PCIUTILS
+	depends on BR2_USE_MMU # fork()
 	depends on !BR2_bfin # pciutils
 	help
 	  System utilities for IBM Power RAID devices
