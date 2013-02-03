From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Feb 2013 20:52:22 +0100
Subject: [Buildroot] [PATCH] heirloom-mailx: needs fork()
Message-ID: <1359921142-28296-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

heirloom-mailx uses fork(), so we can't use it as is on !mmu
platforms.

Fixes:

http://autobuild.buildroot.org/results/c5a8e3a4cbc1e1de985fe3c724b711027865abe7/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/heirloom-mailx/Config.in |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/heirloom-mailx/Config.in b/package/heirloom-mailx/Config.in
index 9a871d4..ca83dc3 100644
--- a/package/heirloom-mailx/Config.in
+++ b/package/heirloom-mailx/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_HEIRLOOM_MAILX
 	bool "heirloom-mailx"
+	# uses fork()
+	depends on BR2_USE_MMU
 	help
 	  Heirloom mailx (previously known as nail) is a mail user
 	  agent for Unix systems.
-- 
1.7.9.5
