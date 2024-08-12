Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D223C52D7C
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 16:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD3EB812D5;
	Mon, 12 Aug 2024 16:01:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FwMFjL7jDt1E; Mon, 12 Aug 2024 16:01:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03ADA812CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03ADA812CE;
	Mon, 12 Aug 2024 16:01:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 439DD1BF5E9
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 16:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30FFA401B0
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 16:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RS16dxxnDbJq for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 16:01:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EACF40184
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EACF40184
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 16:01:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74C7085278; Mon, 12 Aug 2024 16:01:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 17:59:12 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 39af748ca422ab508c6cf6ae33a041c191888419
X-Git-Newrev: 300d507c2efd3201ddb6c9d8116711a85288003e
X-Patchwork-Hint: ignore
Message-Id: <20240812160144.74C7085278@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/android-tools:
 add patches to fix build with GCC 14.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8525400422469447927=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8525400422469447927==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=300d507c2efd3201ddb6c9d8116711a85288003e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

This commit adds 3 patches that fix various implicit declarations
error that arise with GCC 14.x.

Fixes host-android-tools build issues:

 http://autobuild.buildroot.net/results/1fd0d0a9547d4ad2a24916eb79230d49a825e694
 http://autobuild.buildroot.net/results/9e3bb951d7db1c8a8725b5570c54f6dec0e8b344
 http://autobuild.buildroot.net/results/8c9345fcad6e935c13b16c318bbb27282de10ac1
 http://autobuild.buildroot.net/results/4e8a2ce69bfb8a86da2711cb32a99ad51b0bdf5f
 http://autobuild.buildroot.net/results/ca6310cfcb0a9787eb5cec3c33aab903f4964cab
 http://autobuild.buildroot.net/results/a77509d4df8281d666d870faeb008f9196d3bbc3
 http://autobuild.buildroot.net/results/74cdcbcbe8bab244b1c368260162e3cef133376f
 http://autobuild.buildroot.net/results/225b2722b030b1ea1706db8dd54d62da81d8725b

As well as android-tools build issues:

 http://autobuild.buildroot.net/results/abfaf53328d0b29c778f75e105cc7043f2ad44fe
 http://autobuild.buildroot.net/results/d2467a2ac4a915d850cc8bc2341d9803346604a9
 http://autobuild.buildroot.net/results/a4cf59ce479b7db7f0a3269c0462ce1ccc9f600e
 http://autobuild.buildroot.net/results/667a49bff45b226dec4349d54f977c8bd6abadd5
 http://autobuild.buildroot.net/results/92cf3eea0e0d7531220cd9850993e269a3a4744d

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d201f2f5cd0d1e0389430cda78adead37977a6cd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ot-fastboot.c-reorder-functions-to-avoid-.patch | 54 ++++++++++++++++++++++
 ...rse-sparse_read.c-add-missing-output_file.patch | 37 +++++++++++++++
 ..._utils-make_ext4fs_main.c-disable-Android.patch | 54 ++++++++++++++++++++++
 .../0014-core-adbd-adb.c-open-code-capset.patch    | 52 +++++++++++++++++++++
 ...bd-adb.c-include-correct-header-for-prctl.patch | 34 ++++++++++++++
 5 files changed, 231 insertions(+)

diff --git a/package/android-tools/0011-core-fastboot-fastboot.c-reorder-functions-to-avoid-.patch b/package/android-tools/0011-core-fastboot-fastboot.c-reorder-functions-to-avoid-.patch
new file mode 100644
index 0000000000..b5592e6992
--- /dev/null
+++ b/package/android-tools/0011-core-fastboot-fastboot.c-reorder-functions-to-avoid-.patch
@@ -0,0 +1,54 @@
+From 9724d78fda4eb023f83d2fd30e665b436d7a7f97 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 14 Jul 2024 11:41:10 +0200
+Subject: [PATCH] core/fastboot/fastboot.c: reorder functions to avoid implicit
+ definition
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The match_fastboot() function uses match_fastboot_with_serial() but is
+implemented before it, causing an implicit definition. Re-order the
+functions to avoid this.
+
+Fixes:
+
+core/fastboot/fastboot.c:191:12: error: implicit declaration of function ‘match_fastboot_with_serial’ [-Wimplicit-function-declaration]
+
+Upstream: N/A, we're too far from upstream
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ core/fastboot/fastboot.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/core/fastboot/fastboot.c b/core/fastboot/fastboot.c
+index 3de6d7d..9b2c86f 100644
+--- a/core/fastboot/fastboot.c
++++ b/core/fastboot/fastboot.c
+@@ -186,11 +186,6 @@ oops:
+ }
+ #endif
+ 
+-int match_fastboot(usb_ifc_info *info)
+-{
+-    return match_fastboot_with_serial(info, serial);
+-}
+-
+ int match_fastboot_with_serial(usb_ifc_info *info, const char *local_serial)
+ {
+     if(!(vendor_id && (info->dev_vendor == vendor_id)) &&
+@@ -217,6 +212,11 @@ int match_fastboot_with_serial(usb_ifc_info *info, const char *local_serial)
+     return 0;
+ }
+ 
++int match_fastboot(usb_ifc_info *info)
++{
++    return match_fastboot_with_serial(info, serial);
++}
++
+ int list_devices_callback(usb_ifc_info *info)
+ {
+     if (match_fastboot_with_serial(info, NULL) == 0) {
+-- 
+2.45.2
+
diff --git a/package/android-tools/0012-core-libsparse-sparse_read.c-add-missing-output_file.patch b/package/android-tools/0012-core-libsparse-sparse_read.c-add-missing-output_file.patch
new file mode 100644
index 0000000000..9a6a77eceb
--- /dev/null
+++ b/package/android-tools/0012-core-libsparse-sparse_read.c-add-missing-output_file.patch
@@ -0,0 +1,37 @@
+From 2812c2005cfa4bfc5741651c8310e36f28c0327e Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 14 Jul 2024 11:41:56 +0200
+Subject: [PATCH] core/libsparse/sparse_read.c: add missing output_file.h
+ include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+sparse_read.c uses read_all() without including the header file
+containing its prototype, causing:
+
+core/libsparse/sparse_read.c:122:31: error: implicit declaration of function ‘read_all’ [-Wimplicit-function-declaration]
+
+Fix this by including output_file.h.
+
+Upstream: N/A, we're too far from upstream
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ core/libsparse/sparse_read.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/core/libsparse/sparse_read.c b/core/libsparse/sparse_read.c
+index 704bcfa..0a8f838 100644
+--- a/core/libsparse/sparse_read.c
++++ b/core/libsparse/sparse_read.c
+@@ -32,6 +32,7 @@
+ #include "sparse_crc32.h"
+ #include "sparse_file.h"
+ #include "sparse_format.h"
++#include "output_file.h"
+ 
+ #if defined(__APPLE__) && defined(__MACH__)
+ #define lseek64 lseek
+-- 
+2.45.2
+
diff --git a/package/android-tools/0013-extras-ext4_utils-make_ext4fs_main.c-disable-Android.patch b/package/android-tools/0013-extras-ext4_utils-make_ext4fs_main.c-disable-Android.patch
new file mode 100644
index 0000000000..c11e88bf07
--- /dev/null
+++ b/package/android-tools/0013-extras-ext4_utils-make_ext4fs_main.c-disable-Android.patch
@@ -0,0 +1,54 @@
+From 83f9bed233b86dd2bbf603611b13b673caeccb69 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 14 Jul 2024 11:46:51 +0200
+Subject: [PATCH] extras/ext4_utils/make_ext4fs_main.c: disable
+ Android-specific code
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Since we are not building with the Android code, we do not have the
+implementation of the selinux_android_file_context_handle(). However,
+its only call site is when 'mountpoint' is set, and 'mountpoint'
+cannot be non-NULL in non-Android cases due to how the -a option is
+parsed:
+
+		case 'a':
+ #ifdef ANDROID
+			fs_config_func = fs_config;
+			mountpoint = optarg;
+ #else
+			fprintf(stderr, "can't set android permissions - built without android support\n");
+			usage(argv[0]);
+			exit(EXIT_FAILURE);
+ #endif
+
+So also compile out the code calling
+selinux_android_file_context_handle() when ANDROID is not set.
+
+Fixes:
+
+make_ext4fs_main.c:155:25: error: implicit declaration of function ‘selinux_android_file_context_handle’ [-Wimplicit-function-declaration]
+
+Upstream: N/A, we're too far from upstream
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ extras/ext4_utils/make_ext4fs_main.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/extras/ext4_utils/make_ext4fs_main.c b/extras/ext4_utils/make_ext4fs_main.c
+index 17d3735..cb58011 100644
+--- a/extras/ext4_utils/make_ext4fs_main.c
++++ b/extras/ext4_utils/make_ext4fs_main.c
+@@ -149,7 +149,7 @@ int main(int argc, char **argv)
+ 		}
+ 	}
+ 
+-#if !defined(HOST)
++#if !defined(HOST) && defined(ANDROID)
+ 	// Use only if -S option not requested
+ 	if (!sehnd && mountpoint) {
+ 		sehnd = selinux_android_file_context_handle();
+-- 
+2.45.2
+
diff --git a/package/android-tools/0014-core-adbd-adb.c-open-code-capset.patch b/package/android-tools/0014-core-adbd-adb.c-open-code-capset.patch
new file mode 100644
index 0000000000..1496b8bca4
--- /dev/null
+++ b/package/android-tools/0014-core-adbd-adb.c-open-code-capset.patch
@@ -0,0 +1,52 @@
+From 2b5060146b0890f7f1a63ef891af1358b8cdf9bc Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 14 Jul 2024 12:57:22 +0200
+Subject: [PATCH] core/adbd/adb.c: open code capset()
+
+capset() is apparently implemented by C libraries (at least glibc and
+musl), but not exposed through a header as an official public API.
+
+In addition capset(2) says:
+
+  Note: glibc provides no wrappers for these system calls,
+  necessitating the use of syscall(2)
+
+The lack of a header with a prototype for capset() was not causing any
+problem so far, but GCC 14.x has become stricter on implicit
+declarations, causing the build to fail with:
+
+core/adbd/adb.c:1296:9: error: implicit declaration of function 'capset' [-Wimplicit-function-declaration]
+
+So fix that by open-coding it using syscall() as suggested by the man
+page.
+
+Upstream: N/A, we're too far from upstream
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ core/adbd/adb.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/core/adbd/adb.c b/core/adbd/adb.c
+index 7fe6445..98b1de1 100644
+--- a/core/adbd/adb.c
++++ b/core/adbd/adb.c
+@@ -41,6 +41,7 @@
+ #if !ADB_HOST
+ #include "android_filesystem_config.h"
+ #include <linux/capability.h>
++#include <sys/syscall.h>
+ #include <linux/prctl.h>
+ #include <sys/mount.h>
+ #else
+@@ -1293,7 +1294,7 @@ int adb_main(int is_daemon, int server_port)
+         header.pid = 0;
+         cap[CAP_TO_INDEX(CAP_SYS_BOOT)].effective |= CAP_TO_MASK(CAP_SYS_BOOT);
+         cap[CAP_TO_INDEX(CAP_SYS_BOOT)].permitted |= CAP_TO_MASK(CAP_SYS_BOOT);
+-        capset(&header, cap);
++        syscall(SYS_capset, &header, cap);
+ 
+         D("Local port disabled\n");
+     } else {
+-- 
+2.45.2
+
diff --git a/package/android-tools/0015-core-adbd-adb.c-include-correct-header-for-prctl.patch b/package/android-tools/0015-core-adbd-adb.c-include-correct-header-for-prctl.patch
new file mode 100644
index 0000000000..cfbefecb26
--- /dev/null
+++ b/package/android-tools/0015-core-adbd-adb.c-include-correct-header-for-prctl.patch
@@ -0,0 +1,34 @@
+From c14070011e070d8674cf3578708cbae433090a47 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 14 Jul 2024 13:00:02 +0200
+Subject: [PATCH] core/adbd/adb.c: include correct header for prctl()
+
+As documented by prctl(2), the correct header to include for prctl()
+is <sys/prctl.h>, not <linux/prctl.h>.
+
+Fixes:
+
+core/adbd/adb.c:1256:13: error: implicit declaration of function 'prctl' [-Wimplicit-function-declaration]
+
+Upstream: N/A, we're too far from upstream
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ core/adbd/adb.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/core/adbd/adb.c b/core/adbd/adb.c
+index 98b1de1..10f420b 100644
+--- a/core/adbd/adb.c
++++ b/core/adbd/adb.c
+@@ -42,7 +42,7 @@
+ #include "android_filesystem_config.h"
+ #include <linux/capability.h>
+ #include <sys/syscall.h>
+-#include <linux/prctl.h>
++#include <sys/prctl.h>
+ #include <sys/mount.h>
+ #else
+ #include "usb_vendors.h"
+-- 
+2.45.2
+

--===============8525400422469447927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8525400422469447927==--
