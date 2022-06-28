Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28111C43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 06:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F3544037C;
	Tue, 28 Jun 2022 06:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F3544037C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VdUOBlrQwCs1; Tue, 28 Jun 2022 06:04:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A82740227;
	Tue, 28 Jun 2022 06:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A82740227
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 20DD01BF293
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 06:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 093BD60B88
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 06:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 093BD60B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W7Vm3WOsymCI for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 06:04:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EDAD60B71
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 06:04:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EDAD60B71
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1C1C78775E; Tue, 28 Jun 2022 05:51:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 07:55:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c099842544248b10f4284a5d47084db8f476fcda
X-Git-Newrev: 428e9d74c48b9e16ea6a315413324f0a2aede7da
X-Patchwork-Hint: ignore
Message-Id: <20220628055156.1C1C78775E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libminiupnpc: bump to version 2.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=428e9d74c48b9e16ea6a315413324f0a2aede7da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of license file (update in year)

http://miniupnp.free.fr/files/changelog.php?file=miniupnpc-2.2.3.tar.gz

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...pc-CMakeLists-txt-fix-install-for-headers.patch | 43 ++++++++++++++++++++++
 package/libminiupnpc/libminiupnpc.hash             |  4 +-
 package/libminiupnpc/libminiupnpc.mk               |  6 +--
 3 files changed, 46 insertions(+), 7 deletions(-)

diff --git a/package/libminiupnpc/0001-miniupnpc-CMakeLists-txt-fix-install-for-headers.patch b/package/libminiupnpc/0001-miniupnpc-CMakeLists-txt-fix-install-for-headers.patch
new file mode 100644
index 0000000000..2e4c8a69e6
--- /dev/null
+++ b/package/libminiupnpc/0001-miniupnpc-CMakeLists-txt-fix-install-for-headers.patch
@@ -0,0 +1,43 @@
+From f82b0563a72e33800f5918ead68c41bcda1fd4c1 Mon Sep 17 00:00:00 2001
+From: heitbaum <rudi@heitbaum.com>
+Date: Fri, 1 Oct 2021 00:00:27 +1000
+Subject: [PATCH] miniupnpc/CMakeLists.txt: fix install for headers
+
+[Retrieved from:
+https://github.com/miniupnp/miniupnp/commit/f82b0563a72e33800f5918ead68c41bcda1fd4c1]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ miniupnpc/CMakeLists.txt | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0553eeb3..6b0904c0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -221,16 +221,16 @@ endif ()
+ 
+ if (NOT UPNPC_NO_INSTALL)
+   install (FILES
+-    miniupnpc.h
+-    miniwget.h
+-    upnpcommands.h
+-    igd_desc_parse.h
+-    upnpreplyparse.h
+-    upnperrors.h
+-    upnpdev.h
+-    miniupnpctypes.h
+-    portlistingparse.h
+-    miniupnpc_declspec.h
++    include/miniupnpc.h
++    include/miniwget.h
++    include/upnpcommands.h
++    include/igd_desc_parse.h
++    include/upnpreplyparse.h
++    include/upnperrors.h
++    include/upnpdev.h
++    include/miniupnpctypes.h
++    include/portlistingparse.h
++    include/miniupnpc_declspec.h
+     DESTINATION include/miniupnpc
+   )
+ 
diff --git a/package/libminiupnpc/libminiupnpc.hash b/package/libminiupnpc/libminiupnpc.hash
index 758ea29f59..4714dd6f48 100644
--- a/package/libminiupnpc/libminiupnpc.hash
+++ b/package/libminiupnpc/libminiupnpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  69f72fe355f911b807915f78dcfc0af772c0f22bc7ab1157e70f334e37db7d39  miniupnpc-2.1.20201016.tar.gz
-sha256  0b476c395af6dd21eeb54c40a21d22e1c11a751fbd2dd17a41ce26e370be88d5  LICENSE
+sha256  dce41b4a4f08521c53a0ab163ad2007d18b5e1aa173ea5803bd47a1be3159c24  miniupnpc-2.2.3.tar.gz
+sha256  90bb92bf524970569296022fea562c85a4ec4d99a16f3aef2144d13d7087b631  LICENSE
diff --git a/package/libminiupnpc/libminiupnpc.mk b/package/libminiupnpc/libminiupnpc.mk
index 52fe9849f2..f3661396ca 100644
--- a/package/libminiupnpc/libminiupnpc.mk
+++ b/package/libminiupnpc/libminiupnpc.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-LIBMINIUPNPC_VERSION_MAJOR = 2.1
-LIBMINIUPNPC_VERSION_MINOR = 20201016
-LIBMINIUPNPC_VERSION = $(LIBMINIUPNPC_VERSION_MAJOR).$(LIBMINIUPNPC_VERSION_MINOR)
+LIBMINIUPNPC_VERSION = 2.2.3
 LIBMINIUPNPC_SOURCE = miniupnpc-$(LIBMINIUPNPC_VERSION).tar.gz
 LIBMINIUPNPC_SITE = http://miniupnp.free.fr/files
 LIBMINIUPNPC_INSTALL_STAGING = YES
@@ -14,8 +12,6 @@ LIBMINIUPNPC_LICENSE = BSD-3-Clause
 LIBMINIUPNPC_LICENSE_FILES = LICENSE
 LIBMINIUPNPC_CPE_ID_VENDOR = miniupnp_project
 LIBMINIUPNPC_CPE_ID_PRODUCT = miniupnpc
-LIBMINIUPNPC_CPE_ID_VERSION = $(LIBMINIUPNPC_VERSION_MAJOR)
-LIBMINIUPNPC_CPE_ID_UPDATE = $(LIBMINIUPNPC_VERSION_MINOR)
 LIBMINIUPNPC_CONF_OPTS = -DUPNPC_BUILD_SAMPLE=OFF -DUPNPC_BUILD_TESTS=OFF
 
 ifeq ($(BR2_STATIC_LIBS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
