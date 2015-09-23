From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 23 Sep 2015 12:57:59 +0100
Subject: [Buildroot] [PATCH] rtptools: needs RPC support
Message-ID: <1443009479-8481-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rtptools needs a toolchain with RPC support, otherwise it will fail with
an error message like this one:

host2ip.c:13:38: fatal error: rpcsvc/ypclnt.h: No such file or directory
 #include <rpcsvc/ypclnt.h>   /* YP */

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/rtptools/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/rtptools/Config.in b/package/rtptools/Config.in
index 80bbb7a..a798960 100644
--- a/package/rtptools/Config.in
+++ b/package/rtptools/Config.in
@@ -1,5 +1,9 @@
+comment "rtptools needs a toolchain w/ RPC"
+	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+
 config BR2_PACKAGE_RTPTOOLS
 	bool "rtptools"
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  The rtptools distribution consists of a number of small
 	  applications that can be used for processing RTP data.
-- 
1.7.1
