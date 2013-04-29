From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 28 Apr 2013 19:44:24 -0700
Subject: [Buildroot] [PATCH] tcpreplay: needs MMU
In-Reply-To: <y>
References: <y>
Message-ID: <1367203464-17103-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/e95f23f79ba139681fb1e51375719329afe7e22c

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/tcpreplay/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tcpreplay/Config.in b/package/tcpreplay/Config.in
index 6d3a3bf..7337070 100644
--- a/package/tcpreplay/Config.in
+++ b/package/tcpreplay/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TCPREPLAY
 	bool "tcpreplay"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBPCAP
 	help
 	  Tcpreplay is a tool for replaying network traffic from files saved
-- 
1.7.10.4
