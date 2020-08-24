From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Aug 2020 19:16:25 +0200
Subject: [Buildroot] [git commit] legacy: drop options that are now forcibly
 enabled
Message-ID: <20200824171413.4E25183C07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7292cbe80b92a01c9b66b6b9a2edbd194bd46edf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As Thomas said:

> In this sort of situation, we generally don't add any legacy
> handling.  Indeed, since the feature is now mandatory... the
> default behavior will always be OK.

> People who could be annoyed are people who had this feature
> disabled... which is now always enabled. But the legacy handling
> will anyway not help those people.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 957cbb8b3c..05127ab9c6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,30 +146,6 @@ endif
 
 comment "Legacy options removed in 2020.08"
 
-config BR2_PACKAGE_PHP_EXT_HASH
-	bool "php hash extension is mandatory"
-	select BR2_LEGACY
-	help
-	  Since php 7.4.0, hash extension can't be disabled.
-
-config BR2_PACKAGE_EFL_GIF
-	bool "efl evas gif loader is mandatory"
-	select BR2_LEGACY
-	help
-	  Since efl 1.23.x, the evas gif loader can't be disabled.
-
-config BR2_PACKAGE_EFL_PNG
-	bool "efl evas png loader is mandatory"
-	select BR2_LEGACY
-	help
-	  Since efl 1.23.x, the evas png loader can't be disabled.
-
-config BR2_PACKAGE_EFL_ELPUT
-	bool "efl elput is enabled by efl drm option"
-	select BR2_LEGACY
-	help
-	  Since efl 1.23.x, the drm option enable the elput library.
-
 config BR2_KERNEL_HEADERS_5_6
 	bool "kernel headers version 5.6.x are no longer supported"
 	select BR2_LEGACY
