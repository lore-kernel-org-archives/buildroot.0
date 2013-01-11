From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 11 Jan 2013 07:48:48 +0000
Subject: [Buildroot] [PATCH] empty: needs MMU
Message-ID: <1357890528-3005-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The empty package uses the fork() system call, and so requires MMU.

Fixed autobuilder failures such as the following.

  http://autobuild.buildroot.net/results/4ad23e07b1bfe7bfd622aed8d54fa243b72eed59/build-end.log

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/empty/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/empty/Config.in b/package/empty/Config.in
index 67b09fc..7fd0877 100644
--- a/package/empty/Config.in
+++ b/package/empty/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_EMPTY
 	bool "empty"
+	depends on BR2_USE_MMU # uses fork()
 	help
 	  Run processes and applications under pseudo-terminal (PTY) sessions.
 
-- 
1.7.10.4
