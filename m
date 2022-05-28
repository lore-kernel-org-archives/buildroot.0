Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C6FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 19:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 425DA83E56;
	Sat, 28 May 2022 19:28:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DhNqRePgFBb3; Sat, 28 May 2022 19:28:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3809983E4B;
	Sat, 28 May 2022 19:28:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DAA71BF867
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03E15610CF
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rrOD36QKFcKP for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 19:27:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EEEA60A83
 for <buildroot@buildroot.org>; Sat, 28 May 2022 19:27:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1604285E26; Sat, 28 May 2022 19:16:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 21:06:11 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c98c804b1333a4fbc799e09e8156d39ea5f5b699
X-Git-Newrev: bf4b7f7455c21b0dc8f76452e257ccbe8f281f72
X-Patchwork-Hint: ignore
Message-Id: <20220528191613.1604285E26@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rtl8189fs: bump
 revision
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bf4b7f7455c21b0dc8f76452e257ccbe8f281f72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Bump package revision to pull various fixes for v5.1 - v5.17 kernels.
Patch that disables verbose debug is no more compatible with updated
driver since build flags in Makefile has been changed. Drop it.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 25956b29e4d63f599b9baf7298f69538ba2f22fa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-include-disable-debug-messages.patch      | 28 ----------------------
 package/rtl8189fs/rtl8189fs.hash                   |  2 +-
 package/rtl8189fs/rtl8189fs.mk                     |  2 +-
 3 files changed, 2 insertions(+), 30 deletions(-)

diff --git a/package/rtl8189fs/0001-include-disable-debug-messages.patch b/package/rtl8189fs/0001-include-disable-debug-messages.patch
deleted file mode 100644
index 532982b1d3..0000000000
--- a/package/rtl8189fs/0001-include-disable-debug-messages.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 5d3a44ff1aeb8ace6e08df3cad16102aaac1ef09 Mon Sep 17 00:00:00 2001
-From: Sergey Matyukevich <geomatsi@gmail.com>
-Date: Sun, 13 Jun 2021 15:51:51 +0300
-Subject: [PATCH] include: disable debug messages
-
-Disable debug messages to make rtl8189fs driver less noisy.
-
-Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
----
- include/autoconf.h | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/include/autoconf.h b/include/autoconf.h
-index 44efe42..b5df57b 100644
---- a/include/autoconf.h
-+++ b/include/autoconf.h
-@@ -224,8 +224,6 @@
- /*
-  * Debug Related Config
-  */
--#define CONFIG_DEBUG /* DBG_871X, etc... */
--
- #ifdef CONFIG_DEBUG
- #define DBG	1	// for ODM & BTCOEX debug
- //#define CONFIG_DEBUG_RTL871X /* RT_TRACE, RT_PRINT_DATA, _func_enter_, _func_exit_ */
--- 
-2.32.0
-
diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index f9772f2a89..d5d18a8ba8 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  fd74248b8cc62e54a954502228be221ace6051832a972b8b3005cc05e9c87761  rtl8189fs-73f826f0fa74b2fc1ad67eaf92bf9787947ae673.tar.gz
+sha256  41eee18d8a4289c2eac07af3224c62214a9b694a717bf497cd34a95b955f3d49  rtl8189fs-94a61cbf46ce87b7c9b8aa53123aeb142133a3c9.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 0cca0b751d..6031a3072c 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = 73f826f0fa74b2fc1ad67eaf92bf9787947ae673
+RTL8189FS_VERSION = 94a61cbf46ce87b7c9b8aa53123aeb142133a3c9
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
