From: Vanya Sergeev <vsergeev@gmail.com>
Date: Sun,  1 Feb 2015 23:08:01 -0800
Subject: [Buildroot] [PATCH 1/1] board/beaglebone: fix kernel load command
	in u-boot environment file
Message-ID: <1422860881-5188-1-git-send-email-vsergeev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the loaduimage command was renamed to loadimage when the default kernel
image changed from uImage to zImage in u-boot commit e3cf9692053a, which
made it into the v2013.10 u-boot release that the beaglebone_defconfig
currently builds.

Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
---
 board/beaglebone/uEnv.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/beaglebone/uEnv.txt b/board/beaglebone/uEnv.txt
index d638432..e09fff5 100644
--- a/board/beaglebone/uEnv.txt
+++ b/board/beaglebone/uEnv.txt
@@ -1,3 +1,3 @@
 bootpart=0:1
 bootdir=
-uenvcmd=run loaduimage;run loadramdisk;run findfdt;run loadfdt;run ramboot
+uenvcmd=run loadimage;run loadramdisk;run findfdt;run loadfdt;run ramboot
-- 
2.2.2
