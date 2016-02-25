From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 23:14:51 +0100
Subject: [Buildroot] [git commit] package/util-linux: disable libsmartcols
	in no-MMU platforms
Message-ID: <20160225221457.9E969818C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c28619aaf7eaea96920530d7394e2c6130b9169
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by Thomas Petazzoni [1], the libsmartcols library can't
be used on no-MMU platform since fork() is used.

[1] http://lists.busybox.net/pipermail/buildroot/2016-February/153414.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
