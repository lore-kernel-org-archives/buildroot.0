Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8484CC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32CCA831F8;
	Mon, 20 Feb 2023 23:16:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32CCA831F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WI8dLhlgYmju; Mon, 20 Feb 2023 23:16:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 412AF8322E;
	Mon, 20 Feb 2023 23:16:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 412AF8322E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C836B1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A519409D6
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A519409D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rHHFn7svshBM for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AA4241740
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AA4241740
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 47C1C86495; Mon, 20 Feb 2023 20:52:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 21:02:14 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 113e3a8fed6c89e947bea2f44672c47338d08c96
X-Git-Newrev: 06aa16e23490d03ef9098e61cdcf698af7317a96
X-Patchwork-Hint: ignore
Message-Id: <20230220205232.47C1C86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/netopeer2: bump
 version to 2.1.42
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=06aa16e23490d03ef9098e61cdcf698af7317a96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop patch that is in upstream.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...BUGFIX-use-DESTDIR-when-executing-scripts.patch | 47 ----------------------
 package/netopeer2/netopeer2.hash                   |  2 +-
 package/netopeer2/netopeer2.mk                     |  2 +-
 3 files changed, 2 insertions(+), 49 deletions(-)

diff --git a/package/netopeer2/0001-build-BUGFIX-use-DESTDIR-when-executing-scripts.patch b/package/netopeer2/0001-build-BUGFIX-use-DESTDIR-when-executing-scripts.patch
deleted file mode 100644
index 99febb56ad..0000000000
--- a/package/netopeer2/0001-build-BUGFIX-use-DESTDIR-when-executing-scripts.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 696b6be8a623f4466def2a161baa26094e5592a4 Mon Sep 17 00:00:00 2001
-From: Michal Vasko <mvasko@cesnet.cz>
-Date: Wed, 18 May 2022 09:14:35 +0200
-Subject: [PATCH] build BUGFIX use DESTDIR when executing scripts
-
-Fixes #1217
-
-[Upstream accepted 696b6be8a623f4466def2a161baa26094e5592a4]
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- CMakeLists.txt | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index efe922d..60e3150 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -351,7 +351,7 @@ if(INSTALL_MODULES)
-         set(ENV{NP2_MODULE_GROUP} \"${MODULES_GROUP}\")
-         set(ENV{SYSREPOCTL_EXECUTABLE} \"${SYSREPOCTL_EXECUTABLE}\")
-         set(ENV{SYSREPOCFG_EXECUTABLE} \"${SYSREPOCFG_EXECUTABLE}\")
--        execute_process(COMMAND \"${SCRIPT_DIR}/setup.sh\" RESULT_VARIABLE SETUP_RES)
-+        execute_process(COMMAND \"\$ENV{DESTDIR}${SCRIPT_DIR}/setup.sh\" RESULT_VARIABLE SETUP_RES)
-         if(NOT SETUP_RES EQUAL \"0\")
-             message(FATAL_ERROR \" scripts/setup.sh failed: \${SETUP_RES}\")
-         endif()
-@@ -364,7 +364,7 @@ if(GENERATE_HOSTKEY)
-         message(STATUS \"Generating a new RSA host key \\\"genkey\\\" if not already added...\")
-         set(ENV{SYSREPOCTL_EXECUTABLE} \"${SYSREPOCTL_EXECUTABLE}\")
-         set(ENV{SYSREPOCFG_EXECUTABLE} \"${SYSREPOCFG_EXECUTABLE}\")
--        execute_process(COMMAND ${SCRIPT_DIR}/merge_hostkey.sh RESULT_VARIABLE MERGE_HOSTKEY_RES)
-+        execute_process(COMMAND \"\$ENV{DESTDIR}${SCRIPT_DIR}/merge_hostkey.sh\" RESULT_VARIABLE MERGE_HOSTKEY_RES)
-         if(NOT MERGE_HOSTKEY_RES EQUAL \"0\")
-             message(FATAL_ERROR \" scripts/merge_hostkey.sh failed: \${MERGE_HOSTKEY_RES}\")
-         endif()
-@@ -375,7 +375,7 @@ if(MERGE_LISTEN_CONFIG)
-         message(STATUS \"Merging default server listen configuration if there is none...\")
-         set(ENV{SYSREPOCTL_EXECUTABLE} \"${SYSREPOCTL_EXECUTABLE}\")
-         set(ENV{SYSREPOCFG_EXECUTABLE} \"${SYSREPOCFG_EXECUTABLE}\")
--        execute_process(COMMAND ${SCRIPT_DIR}/merge_config.sh RESULT_VARIABLE MERGE_CONFIG_RES)
-+        execute_process(COMMAND \"\$ENV{DESTDIR}${SCRIPT_DIR}/merge_config.sh\" RESULT_VARIABLE MERGE_CONFIG_RES)
-         if(NOT MERGE_CONFIG_RES EQUAL \"0\")
-             message(FATAL_ERROR \" scripts/merge_config.sh failed: \${MERGE_CONFIG_RES}\")
-         endif()
--- 
-2.30.2
-
diff --git a/package/netopeer2/netopeer2.hash b/package/netopeer2/netopeer2.hash
index b352bbb239..cc71a2dab8 100644
--- a/package/netopeer2/netopeer2.hash
+++ b/package/netopeer2/netopeer2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  89f7572d188e7b04be4b10656d7161d65fb557bac222d8c4596a97eaf833b691  netopeer2-2.1.23.tar.gz
+sha256  b166fe3425bb55b5f330fb7f53158f613bffc07493925ac437193e4d2defb3e7  netopeer2-2.1.42.tar.gz
 sha256  b46f161fbdcf127d3ef22602e15958c3092fe3294f71a2dc8cdf8f6689cba95b  LICENSE
diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index d9a20d9969..7cb9202575 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETOPEER2_VERSION = 2.1.23
+NETOPEER2_VERSION = 2.1.42
 NETOPEER2_SITE = $(call github,CESNET,Netopeer2,v$(NETOPEER2_VERSION))
 NETOPEER2_DL_SUBDIR = netopeer2
 NETOPEER2_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
