From: Romain Naour <romain.naour@gmail.com>
Date: Fri,  5 Aug 2016 00:10:26 +0200
Subject: [Buildroot] [PATCH] package/libuio: select gettext when
	BR2_NEEDS_GETTEXT_IF_LOCALE is set
Message-ID: <1470348626-15329-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gettext is added to libuio dependency when BR2_NEEDS_GETTEXT_IF_LOCALE
is set without selecting it at Kconfig level.

Fixes:
http://autobuild.buildroot.net/results/321/321688e16596086d1dad6f489d35edbb7fe7a955

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/libuio/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libuio/Config.in b/package/libuio/Config.in
index 97be1e3..a96df54 100644
--- a/package/libuio/Config.in
+++ b/package/libuio/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBUIO
 	bool "libuio"
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  libuio is a light-weight C programming library to handle UIO
 	  (Userspace I/O) device discovery and binding task.
-- 
2.5.5
