From: Florent Valette <florent.valette@gmail.com>
Date: Sun, 17 May 2015 10:52:04 +0200
Subject: [Buildroot] [PATCH 1/1] hwloc: fix condition to display comment
	message in menuconfig
Message-ID: <1431852724-7692-1-git-send-email-florent.valette@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The comment message shows up if the toolchain has threads instead
of not having threads.

Signed-off-by: Florent Valette <florent.valette@gmail.com>
---
 package/hwloc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hwloc/Config.in b/package/hwloc/Config.in
index 51aef4a..1fb2302 100644
--- a/package/hwloc/Config.in
+++ b/package/hwloc/Config.in
@@ -12,4 +12,4 @@ config BR2_PACKAGE_HWLOC
 	  http://www.open-mpi.org/projects/hwloc/
 
 comment "hwloc needs a toolchain w/ threads"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.9.1
