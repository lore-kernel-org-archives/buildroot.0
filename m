From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 1 Aug 2009 23:29:02 +0200
Subject: [Buildroot] [git commit] haserl: bump 0.9.x version
Message-ID: <20090801213022.13789777DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ec386cbcdf437eff59432431289a6cf045c35910
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

buffer overflow fix is now upstream

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/haserl/Config.in                           |    2 +-
 .../haserl-0.9.25-array-vars-fix.patch             |   19 -------------------
 2 files changed, 1 insertions(+), 20 deletions(-)
 delete mode 100644 package/haserl/haserl-0.9.25/haserl-0.9.25-array-vars-fix.patch

diff --git a/package/haserl/Config.in b/package/haserl/Config.in
index 0a58478..21ab63c 100644
--- a/package/haserl/Config.in
+++ b/package/haserl/Config.in
@@ -30,4 +30,4 @@ endchoice
 config BR2_PACKAGE_HASERL_VERSION
 	string
 	default "0.8.0"		if BR2_PACKAGE_HASERL_VERSION_0_8_X
-	default "0.9.25"	if BR2_PACKAGE_HASERL_VERSION_0_9_X
+	default "0.9.26"	if BR2_PACKAGE_HASERL_VERSION_0_9_X
diff --git a/package/haserl/haserl-0.9.25/haserl-0.9.25-array-vars-fix.patch b/package/haserl/haserl-0.9.25/haserl-0.9.25-array-vars-fix.patch
deleted file mode 100644
index e6c959a..0000000
--- a/package/haserl/haserl-0.9.25/haserl-0.9.25-array-vars-fix.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-haserl: array vars fix
-
-Fix buffer overflow error. Len is the length of the name= part of the
-name=value string, not the value part.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
-Index: haserl-0.9.25/src/haserl.c
-===================================================================
---- haserl-0.9.25.orig/src/haserl.c	2009-07-20 15:05:26.000000000 +0200
-+++ haserl-0.9.25/src/haserl.c	2009-07-20 15:06:05.000000000 +0200
-@@ -269,7 +269,7 @@
- 	      /* if an array, create a new string with this
- 	       * value added to the end of the old value(s) 
- 	       */
--	      temp = xmalloc (strlen (cur->buf) + len + 1);
-+	      temp = xmalloc (strlen (cur->buf) + strlen(entry) - len + 1);
- 	      memmove (temp, cur->buf, strlen (cur->buf) + 1);
- 	      strcat (temp, "\n");
- 	      strcat (temp, str + keylen + 3);
-- 
1.6.3.3
