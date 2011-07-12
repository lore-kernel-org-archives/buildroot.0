From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 12 Jul 2011 09:11:39 +0200
Subject: [Buildroot] [git commit] sysvinit: package name typo
Message-ID: <20110712071225.72C908A4D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ffe62f915dcbf62a840b40167f391127f0702aac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fails when Make decides to process sysvinit targets before busybox.

Signed-off-by: Milton Soares Filho <milton.soares.filho@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sysvinit/sysvinit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 97576b8..adcc1ad 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -10,7 +10,7 @@ SYSVINIT_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sysvinit
 
 # Override Busybox implementations if Busybox is enabled.
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-SYSKLOGD_DEPENDENCIES = busybox
+SYSVINIT_DEPENDENCIES = busybox
 endif
 
 define SYSVINIT_DEBIAN_PATCHES
-- 
1.7.3.4
