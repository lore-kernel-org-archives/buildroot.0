From: Milton Soares Filho <milton.soares.filho@gmail.com>
Date: Tue, 12 Jul 2011 01:04:39 -0400
Subject: [Buildroot] [PATCH] sysvinit: package name typo
Message-ID: <CAPNngRMZf5Ltph9Q9iUzs0jrzerCKWjyZFN0GOFhvhBArvHjTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fails when Make decides to process sysvinit targets before busybox.

Signed-off-by: Milton Soares Filho <milton.soares.filho@gmail.com>
---
 package/sysvinit/sysvinit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 97576b8..adcc1ad 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -10,7 +10,7 @@ SYSVINIT_SITE    =
$(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sysvinit

 # Override Busybox implementations if Busybox is enabled.
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-SYSKLOGD_DEPENDENCIES = busybox
+SYSVINIT_DEPENDENCIES = busybox
 endif

 define SYSVINIT_DEBIAN_PATCHES
-- 
1.7.1
