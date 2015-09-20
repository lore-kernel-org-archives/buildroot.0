From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Sun, 20 Sep 2015 17:41:08 +0300
Subject: [Buildroot] [PATCH 1/1] lxc needs file for lxc-busybox template at
	runtime
Message-ID: <1442760068-18642-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>

The /usr/share/lxc/templates/lxc-busybox container template uses the
'file' command provided by package 'file'. None of the other templates
currently in /usr/share/lxc/templates use the 'file' command.

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
---
 package/lxc/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index ffd9b4a..d20783c 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LXC
 	bool "lxc"
 	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_FILE # runtime, only for template lxc-busybox
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	# build system forcefully builds a shared library
-- 
1.7.9.5
