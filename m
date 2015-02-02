From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 09:29:04 +0100
Subject: [Buildroot] [git commit] board/beaglebone: fix kernel load command
	in u-boot environment file
Message-ID: <20150202082910.A2542801CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d2eaa5b3d80cbc3a9b751f519236b655e97ea33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

the loaduimage command was renamed to loadimage when the default kernel
image changed from uImage to zImage in u-boot commit e3cf9692053a, which
made it into the v2013.10 u-boot release that the beaglebone_defconfig
currently builds.

Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/beaglebone/uEnv.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/board/beaglebone/uEnv.txt b/board/beaglebone/uEnv.txt
index d638432..e09fff5 100644
--- a/board/beaglebone/uEnv.txt
+++ b/board/beaglebone/uEnv.txt
@@ -1,3 +1,3 @@
 bootpart=0:1
 bootdir=
-uenvcmd=run loaduimage;run loadramdisk;run findfdt;run loadfdt;run ramboot
+uenvcmd=run loadimage;run loadramdisk;run findfdt;run loadfdt;run ramboot
