From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Thu, 13 May 2010 17:20:01 -0500
Subject: [Buildroot] [PATCH] Config.in: fix warning
Message-ID: <0D753D10438DA54287A00B0270842697636EFDBCA6@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The latest change to BR2_VERSION left the trailing " off the
default value.  This produces the following warning:

$ make menuconfig
Config.in:11:warning: multi-line strings not supported

Add the " to fix the warning.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/Config.in b/Config.in
index c0151bd..6639399 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2010.05-rc2
+	default "2010.05-rc2"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
