From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  1 Aug 2012 23:50:44 +0200
Subject: [Buildroot] [PATCH] sudo: needs MMU support
Message-ID: <1343857844-4617-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/46bcd9601233ca14d6747d9219669e4f52f147e6/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sudo/Config.in |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sudo/Config.in b/package/sudo/Config.in
index fc0a175..cd7ab81 100644
--- a/package/sudo/Config.in
+++ b/package/sudo/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_SUDO
 	bool "sudo"
+	# uses fork()
+	depends on BR2_USE_MMU
 	help
 	  Sudo is a program designed to allow a sysadmin to give
 	  limited root privileges to users and log root activity.  The
-- 
1.7.9.5
