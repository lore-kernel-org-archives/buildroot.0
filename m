From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Aug 2014 19:16:11 +0200
Subject: [Buildroot] [git commit] package/tar: Depends on MMU
Message-ID: <20140815171725.ECC309D42B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=916b21a7fbf266f452b8dc4116133cc57fdad269
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
misc.o: In function `_xfork':
misc.c:(.text+0x614): undefined reference to `_fork'
../lib/libtar.a(rtapelib.o): In function `_rmt_open__':
rtapelib.c:(.text+0x6d2): undefined reference to `_fork'

To reproduce use this defconfig
http://autobuild.buildroot.net/results/8d5/8d5ad404fab7ec2a501972ba9c08b0109e420b80/defconfig

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tar/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/tar/Config.in b/package/tar/Config.in
index 06a5825..74b0219 100644
--- a/package/tar/Config.in
+++ b/package/tar/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TAR
 	bool "tar"
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # fork()
 	help
 	  A program that saves many files together into a single tape or disk
 	  archive, and can restore individual files from the archive.
