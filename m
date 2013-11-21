From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Nov 2013 18:23:12 +0100
Subject: [Buildroot] [PATCH] mdadm: needs MMU
Message-ID: <1385054592-2952-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/52c/52cc56df2aa278d92141918de74833d7e4fd3d47/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mdadm/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mdadm/Config.in b/package/mdadm/Config.in
index c513348..e0d606b 100644
--- a/package/mdadm/Config.in
+++ b/package/mdadm/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MDADM
 	bool "mdadm"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Utility for managing Linux Software RAID arrays.
 
-- 
1.8.1.2
