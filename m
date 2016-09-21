From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Wed, 21 Sep 2016 22:43:11 +0530
Subject: [Buildroot] [PATCH] trinity: needs MMU support
Message-ID: <1474477991-17171-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/2fc/2fca707deb6fda2da83ab817f8e594f76415d997/

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/trinity/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/trinity/Config.in b/package/trinity/Config.in
index 5c4c7c8..2495e5d 100644
--- a/package/trinity/Config.in
+++ b/package/trinity/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TRINITY
 	bool "trinity"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
 		BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 || \
 		BR2_powerpc64le || BR2_sparc || BR2_x86_64
-- 
2.6.2
