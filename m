From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Dec 2012 07:59:00 -0300
Subject: [Buildroot] [PATCH 1/2] dialog: needs mmu
Message-ID: <1356692341-26066-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/b673ef6d6315dc5df77e000199a63f90904829d5

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dialog/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/dialog/Config.in b/package/dialog/Config.in
index 9d3462e..db5197f 100644
--- a/package/dialog/Config.in
+++ b/package/dialog/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DIALOG
 	bool "dialog"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # fork()
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
-- 
1.7.8.6
