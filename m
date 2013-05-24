From: Gilles Talis <gilles.talis@gmail.com>
Date: Fri, 24 May 2013 16:43:01 -0700
Subject: [Buildroot] [PATCH 1/2] pptp-linux: needs MMU
Message-ID: <1369438982-1398-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/9b8/9b80537d0efb3fefab486abaecd128bd18e0efdb

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/pptp-linux/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/pptp-linux/Config.in b/package/pptp-linux/Config.in
index 165f79b..e03a906 100644
--- a/package/pptp-linux/Config.in
+++ b/package/pptp-linux/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PPTP_LINUX
 	bool "pptp-linux"
+	depends on BR2_USE_MMU # fork()
 	help
 	  An implementation of the Point-to-point protocol client.
 
-- 
1.7.4.1
