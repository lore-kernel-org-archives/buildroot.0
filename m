Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA427CCD18E
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 17:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DB434079C;
	Fri, 10 Oct 2025 17:42:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uStJsIrn-fuU; Fri, 10 Oct 2025 17:42:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B34C1407AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B34C1407AB;
	Fri, 10 Oct 2025 17:42:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F226119
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EBEB6064A
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pr1_OA4tA4xZ for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 17:42:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67B2260649
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67B2260649
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:42:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E386B87037; Fri, 10 Oct 2025 17:42:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Oct 2025 19:22:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6384d4143061fad7a3664aabdbb13161ff7465ea
X-Git-Newrev: 3951339cd94dd49bbcb5627d475c17c39a513512
X-Patchwork-Hint: ignore
Message-Id: <20251010174246.E386B87037@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8821cu: fix build failure with
 Linux 6.17
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3951339cd94dd49bbcb5627d475c17c39a513512
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Bump to version 2025-10-09
* Drop upstreamed local patch

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../rtl8821cu/0001-Fix-build-for-kernel-6.16.patch | 34 ----------------------
 package/rtl8821cu/rtl8821cu.hash                   |  2 +-
 package/rtl8821cu/rtl8821cu.mk                     |  2 +-
 3 files changed, 2 insertions(+), 36 deletions(-)

diff --git a/package/rtl8821cu/0001-Fix-build-for-kernel-6.16.patch b/package/rtl8821cu/0001-Fix-build-for-kernel-6.16.patch
deleted file mode 100644
index 311d4fcd4c..0000000000
--- a/package/rtl8821cu/0001-Fix-build-for-kernel-6.16.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 13f85e370c265b782a801cd22f86cea6f6cda876 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Mon, 8 Sep 2025 21:04:30 +0200
-Subject: [PATCH] Fix build for kernel 6.16
-
-With commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=41cb08555c4164996d67c78b3bf1c658075b75f1
-from_timer() has been renamed to timer_container_of() so let's rename
-according to linux version >= 6.16.
-
-Upstream: https://github.com/morrownr/8821cu-20210916/pull/187
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- include/osdep_service_linux.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/include/osdep_service_linux.h b/include/osdep_service_linux.h
-index ed1e19b..c25f6a2 100644
---- a/include/osdep_service_linux.h
-+++ b/include/osdep_service_linux.h
-@@ -210,6 +210,10 @@ typedef void	*thread_context;
- typedef void timer_hdl_return;
- typedef void *timer_hdl_context;
- 
-+#if (LINUX_VERSION_CODE > KERNEL_VERSION(6, 16, 0))
-+#define from_timer     timer_container_of
-+#endif
-+
- #if (LINUX_VERSION_CODE > KERNEL_VERSION(2, 5, 41))
- 	typedef struct work_struct _workitem;
- #else
--- 
-2.43.0
-
diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
index e7418b4cd0..b9869303de 100644
--- a/package/rtl8821cu/rtl8821cu.hash
+++ b/package/rtl8821cu/rtl8821cu.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6b4bf57959d14ad1a2637a0385876c6fb319d6e4951986bbba18de3c0e65bb86  rtl8821cu-d74134a1c68f59f2b80cdd6c6afb8c1a8a687cbf.tar.gz
+sha256  3e7fc5b598b81006fb07a5a3534aa4288cb387ed531c71f3734e55e6cae729b0  rtl8821cu-3d1fcf4bc838542ceb03b0b4e9e40600720cf6ae.tar.gz
 sha256  22cdb0a9cf492dbf05c5b27381a5c0e73ae0d4622427b522b0ba92b7495e5fb0  LICENSE
diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index ac53b65fda..e1ef396110 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821CU_VERSION = d74134a1c68f59f2b80cdd6c6afb8c1a8a687cbf
+RTL8821CU_VERSION = 3d1fcf4bc838542ceb03b0b4e9e40600720cf6ae
 RTL8821CU_SITE = $(call github,morrownr,8821cu-20210916,$(RTL8821CU_VERSION))
 RTL8821CU_LICENSE = GPL-2.0
 RTL8821CU_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
