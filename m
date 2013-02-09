From: Gilles Talis <gilles.talis@gmail.com>
Date: Sat,  9 Feb 2013 14:27:14 -0800
Subject: [Buildroot] [PATCH 1/1] libtirpc: requires toolchain with threads
	support
In-Reply-To: <y>
References: <y>
Message-ID: <1360448834-21507-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/8ba720f47f74df94b8c70ac4befd47c47ce65f2f

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/libtirpc/Config.in |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
index 7e891b4..f2a6f83 100644
--- a/package/libtirpc/Config.in
+++ b/package/libtirpc/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_LIBTIRPC
 	bool "libtirpc"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Libtirpc is a port of Sun's Transport-Independent RPC
 	  library to Linux.
 
 	  http://sourceforge.net/projects/libtirpc/
+
+comment "libtirpc requires a toolchain with threads support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.7.10.4
