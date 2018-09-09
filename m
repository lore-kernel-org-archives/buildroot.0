From: David Lechner <david@lechnology.com>
Date: Sat,  8 Sep 2018 20:39:50 -0500
Subject: [Buildroot] [PATCH] Config.in.legacy: fix typo in config option
Message-ID: <20180909013950.14184-1-david@lechnology.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The commit message of a2d44ec6bf12 ("linux-headers: drop old unsupported
4.{10,11,12,13,15} versions") says, "select an older kernel headers
(4.9)". However a couple lines are selecting 4.19.

Change BR2_KERNEL_HEADERS_4_19 to BR2_KERNEL_HEADERS_4_9 as intended.

Signed-off-by: David Lechner <david@lechnology.com>
---
 Config.in.legacy | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index aae8d28e13..cbdac59631 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -167,7 +167,7 @@ config BR2_KERNEL_HEADERS_4_11
 
 config BR2_KERNEL_HEADERS_4_12
 	bool "kernel headers version 4.12.x are no longer supported"
-	select BR2_KERNEL_HEADERS_4_19
+	select BR2_KERNEL_HEADERS_4_9
 	select BR2_LEGACY
 	help
 	  Version 4.12.x of the Linux kernel headers are no longer
@@ -177,7 +177,7 @@ config BR2_KERNEL_HEADERS_4_12
 
 config BR2_KERNEL_HEADERS_4_13
 	bool "kernel headers version 4.13.x are no longer supported"
-	select BR2_KERNEL_HEADERS_4_19
+	select BR2_KERNEL_HEADERS_4_9
 	select BR2_LEGACY
 	help
 	  Version 4.13.x of the Linux kernel headers are no longer
-- 
2.17.1
