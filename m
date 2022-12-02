Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F72C4332F
	for <buildroot@archiver.kernel.org>; Fri,  2 Dec 2022 18:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 231E660E09;
	Fri,  2 Dec 2022 18:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 231E660E09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tvTJ6l6tLL6f; Fri,  2 Dec 2022 18:42:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51A8E60C03;
	Fri,  2 Dec 2022 18:42:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51A8E60C03
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C6A31BF348
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 18:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64FED81491
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 18:42:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64FED81491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fg5o6-Y03hTs for <buildroot@lists.busybox.net>;
 Fri,  2 Dec 2022 18:42:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89E82813CF
 for <buildroot@buildroot.org>; Fri,  2 Dec 2022 18:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89E82813CF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 769F984D66; Fri,  2 Dec 2022 18:42:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 2 Dec 2022 19:41:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ad6bc2f587a31c7e1475103a59c93f6a398e8ae
X-Git-Newrev: 0c6d4d7be81ac9ea0ed031e5f0796ef2d2a28770
X-Patchwork-Hint: ignore
Message-Id: <20221202184244.769F984D66@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8723ds: bump to 2022-12-01
 version to fix build issue
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c6d4d7be81ac9ea0ed031e5f0796ef2d2a28770
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop local patch that has been upstreamed.

Fixes:
http://autobuild.buildroot.net/results/fa2/fa2482674d789e7674dc0d83c5f54393beed4d70/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ve-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch | 39 ----------------------
 package/rtl8723ds/rtl8723ds.hash                   |  2 +-
 package/rtl8723ds/rtl8723ds.mk                     |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/package/rtl8723ds/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch b/package/rtl8723ds/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
deleted file mode 100644
index 4495817358..0000000000
--- a/package/rtl8723ds/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 769a1943cb409f89f3c91208294a89b09bf47b86 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 16 Nov 2022 16:08:21 +0100
-Subject: [PATCH] Makefile: move 'EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)' at the
- end of EXTRA_FLAGS assignment
-
-At the moment USER_EXTRA_CFLAGS can't override local Makfile EXTRA_CFLAGS
-since it's assigned at the beginning of the Makefile. For example it's not
-possible to undefine the hardcoded CONFIG_LITTLE_ENDIAN and this doesn't
-allow to build these modules for big endian architectures. So let's move
-the assignment of USER_EXTRA_CFLAGS to EXTRA_CFLAGS after the last
-EXTRA_CFLAGS assignment.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- Makefile | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index aa57f85..3d91574 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,4 +1,3 @@
--EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
- EXTRA_CFLAGS += -O1
- #EXTRA_CFLAGS += -O3
- #EXTRA_CFLAGS += -Wall
-@@ -1738,6 +1737,8 @@ ifneq ($(USER_MODULE_NAME),)
- MODULE_NAME := $(USER_MODULE_NAME)
- endif
- 
-+EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
-+
- ifneq ($(KERNELRELEASE),)
- 
- rtk_core :=	core/rtw_cmd.o \
--- 
-2.34.1
-
diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
index cbc77e14c1..d5abf9913c 100644
--- a/package/rtl8723ds/rtl8723ds.hash
+++ b/package/rtl8723ds/rtl8723ds.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  691040a85d838f8d8d7da0f2ed460f1ea5f6734c40dc73770ba7e260b6cda9cc  rtl8723ds-5ab2d3f3858dc4c833013c47a79faa05b10198f6.tar.gz
+sha256  97f3ebc5d977ba35d10c9c06e6817e4a00458727b651b56fc00c207c05a61995  rtl8723ds-a638cc8639015b8b9390af3350fab0366b6c87e7.tar.gz
diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index 0d96e6b03a..7e27fa75ea 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723DS_VERSION = 5ab2d3f3858dc4c833013c47a79faa05b10198f6
+RTL8723DS_VERSION = a638cc8639015b8b9390af3350fab0366b6c87e7
 RTL8723DS_SITE = $(call github,lwfinger,rtl8723ds,$(RTL8723DS_VERSION))
 RTL8723DS_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
