From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Sun, 20 Sep 2015 18:02:07 +0300
Subject: [Buildroot] [PATCH 1/1] lxc needs gzip scripts for lxc-checkconfig
	runtime
Message-ID: <1442761327-18830-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>

lxc executables such as lxc-checkconfig require scripts provided by
gzip such as zgrep.

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
---
 package/lxc/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index ffd9b4a..5377977 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LXC
 	bool "lxc"
 	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_GZIP # runtime, for lxc-checkconfig
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	# build system forcefully builds a shared library
-- 
1.7.9.5
