From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Aug 2012 21:44:20 +0200
Subject: [Buildroot] [git commit] sudo: needs MMU support
Message-ID: <20120802194713.8F72696FF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba24df488e5783a6ccb715cff60f3c1f2b32acc4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.org/results/46bcd9601233ca14d6747d9219669e4f52f147e6/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sudo/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
