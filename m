Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C83C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 19:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EBBA40AF3;
	Wed,  6 Jul 2022 19:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EBBA40AF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id roglA-UWa_D0; Wed,  6 Jul 2022 19:52:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 570E2405D7;
	Wed,  6 Jul 2022 19:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 570E2405D7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C15621C1135
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 19:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A67A4013A
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 19:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A67A4013A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BXG0rteguAtF for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 19:51:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE60B40120
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 19:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE60B40120
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 28E5482821; Wed,  6 Jul 2022 19:38:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Jul 2022 21:47:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62d5699d00eb8dfbcbd911053cc18d9914ff478f
X-Git-Newrev: 167a15b764c03a86c93afee3fdef763296ebc1b3
X-Patchwork-Hint: ignore
Message-Id: <20220706193851.28E5482821@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netopeer2: bump version to 2.1.23
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

commit: https://git.buildroot.net/buildroot/commit/?id=167a15b764c03a86c93afee3fdef763296ebc1b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch to fix issue building with buildroot. The patch is already
accepted upstream.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...BUGFIX-use-DESTDIR-when-executing-scripts.patch | 47 ++++++++++++++++++++++
 package/netopeer2/netopeer2.hash                   |  2 +-
 package/netopeer2/netopeer2.mk                     |  2 +-
 3 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/package/netopeer2/0001-build-BUGFIX-use-DESTDIR-when-executing-scripts.patch b/package/netopeer2/0001-build-BUGFIX-use-DESTDIR-when-executing-scripts.patch
new file mode 100644
index 0000000000..99febb56ad
--- /dev/null
+++ b/package/netopeer2/0001-build-BUGFIX-use-DESTDIR-when-executing-scripts.patch
@@ -0,0 +1,47 @@
+From 696b6be8a623f4466def2a161baa26094e5592a4 Mon Sep 17 00:00:00 2001
+From: Michal Vasko <mvasko@cesnet.cz>
+Date: Wed, 18 May 2022 09:14:35 +0200
+Subject: [PATCH] build BUGFIX use DESTDIR when executing scripts
+
+Fixes #1217
+
+[Upstream accepted 696b6be8a623f4466def2a161baa26094e5592a4]
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ CMakeLists.txt | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index efe922d..60e3150 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -351,7 +351,7 @@ if(INSTALL_MODULES)
+         set(ENV{NP2_MODULE_GROUP} \"${MODULES_GROUP}\")
+         set(ENV{SYSREPOCTL_EXECUTABLE} \"${SYSREPOCTL_EXECUTABLE}\")
+         set(ENV{SYSREPOCFG_EXECUTABLE} \"${SYSREPOCFG_EXECUTABLE}\")
+-        execute_process(COMMAND \"${SCRIPT_DIR}/setup.sh\" RESULT_VARIABLE SETUP_RES)
++        execute_process(COMMAND \"\$ENV{DESTDIR}${SCRIPT_DIR}/setup.sh\" RESULT_VARIABLE SETUP_RES)
+         if(NOT SETUP_RES EQUAL \"0\")
+             message(FATAL_ERROR \" scripts/setup.sh failed: \${SETUP_RES}\")
+         endif()
+@@ -364,7 +364,7 @@ if(GENERATE_HOSTKEY)
+         message(STATUS \"Generating a new RSA host key \\\"genkey\\\" if not already added...\")
+         set(ENV{SYSREPOCTL_EXECUTABLE} \"${SYSREPOCTL_EXECUTABLE}\")
+         set(ENV{SYSREPOCFG_EXECUTABLE} \"${SYSREPOCFG_EXECUTABLE}\")
+-        execute_process(COMMAND ${SCRIPT_DIR}/merge_hostkey.sh RESULT_VARIABLE MERGE_HOSTKEY_RES)
++        execute_process(COMMAND \"\$ENV{DESTDIR}${SCRIPT_DIR}/merge_hostkey.sh\" RESULT_VARIABLE MERGE_HOSTKEY_RES)
+         if(NOT MERGE_HOSTKEY_RES EQUAL \"0\")
+             message(FATAL_ERROR \" scripts/merge_hostkey.sh failed: \${MERGE_HOSTKEY_RES}\")
+         endif()
+@@ -375,7 +375,7 @@ if(MERGE_LISTEN_CONFIG)
+         message(STATUS \"Merging default server listen configuration if there is none...\")
+         set(ENV{SYSREPOCTL_EXECUTABLE} \"${SYSREPOCTL_EXECUTABLE}\")
+         set(ENV{SYSREPOCFG_EXECUTABLE} \"${SYSREPOCFG_EXECUTABLE}\")
+-        execute_process(COMMAND ${SCRIPT_DIR}/merge_config.sh RESULT_VARIABLE MERGE_CONFIG_RES)
++        execute_process(COMMAND \"\$ENV{DESTDIR}${SCRIPT_DIR}/merge_config.sh\" RESULT_VARIABLE MERGE_CONFIG_RES)
+         if(NOT MERGE_CONFIG_RES EQUAL \"0\")
+             message(FATAL_ERROR \" scripts/merge_config.sh failed: \${MERGE_CONFIG_RES}\")
+         endif()
+-- 
+2.30.2
+
diff --git a/package/netopeer2/netopeer2.hash b/package/netopeer2/netopeer2.hash
index 0145a9cc78..b352bbb239 100644
--- a/package/netopeer2/netopeer2.hash
+++ b/package/netopeer2/netopeer2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1e4b46f2e4889f5a8203f36f9faed6dff82093dd783bb6e3c4f14b73b7e16871  netopeer2-2.1.16.tar.gz
+sha256  89f7572d188e7b04be4b10656d7161d65fb557bac222d8c4596a97eaf833b691  netopeer2-2.1.23.tar.gz
 sha256  b46f161fbdcf127d3ef22602e15958c3092fe3294f71a2dc8cdf8f6689cba95b  LICENSE
diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index fe6e0caf55..d9a20d9969 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETOPEER2_VERSION = 2.1.16
+NETOPEER2_VERSION = 2.1.23
 NETOPEER2_SITE = $(call github,CESNET,Netopeer2,v$(NETOPEER2_VERSION))
 NETOPEER2_DL_SUBDIR = netopeer2
 NETOPEER2_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
