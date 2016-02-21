From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 21 Feb 2016 19:14:11 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/util-linux: disable libsmartcols
	in no-MMU platforms
Message-ID: <1456078452-23865-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported by Thomas Petazzoni [1], the libsmartcols library can't
be used on no-MMU platform since fork() is used.

[1] http://lists.busybox.net/pipermail/buildroot/2016-February/153414.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 3f9a7db..60abd67 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -27,6 +27,7 @@ config BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 
 config BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	bool "libsmartcols"
+	depends on BR2_USE_MMU # fork
 	help
 	  Install libsmartcols.
 
-- 
2.5.0
