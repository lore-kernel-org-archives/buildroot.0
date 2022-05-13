Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F108C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24BDA83F8D;
	Fri, 13 May 2022 22:14:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ToHUDP7EtjKZ; Fri, 13 May 2022 22:14:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EB9783F84;
	Fri, 13 May 2022 22:14:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 147DA1BF868
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 293C3405E0
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xpcTgG2FbLVW for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:11:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59AE640930
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:11:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3257F85E29; Fri, 13 May 2022 22:00:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 23:54:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf629c4e32a95977c1297b57fd636867eec5a063
X-Git-Newrev: bb40efa6f443207fc98b195f6c89795c290aadc1
X-Patchwork-Hint: ignore
Message-Id: <20220513220045.3257F85E29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/open62541: bump to version 1.2.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb40efa6f443207fc98b195f6c89795c290aadc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch | 8 ++++----
 package/open62541/Config.in                                     | 2 +-
 package/open62541/open62541.hash                                | 2 +-
 package/open62541/open62541.mk                                  | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch b/package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch
index f912445b7f..9e6dda26e1 100644
--- a/package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch
+++ b/package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch
@@ -29,16 +29,16 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index bc839f27..963460d0 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -292,6 +292,8 @@ if(UA_FORCE_CPP)
+@@ -257,6 +257,8 @@ if(UA_FORCE_CPP)
      add_definitions(-D__STDC_CONSTANT_MACROS) # We need the UINT32_C define
  endif()
  
 +option(UA_FORCE_WERROR "Force compilation with -Werror" ON)
 +
  #General PubSub setup
- option(UA_ENABLE_PUBSUB "Enable the PubSub protocol" OFF)
- 
-@@ -589,7 +591,9 @@ if(NOT UA_FORCE_CPP AND (CMAKE_COMPILER_IS_GNUCC OR "x${CMAKE_C_COMPILER_ID}" ST
+ option(UA_ENABLE_PUBSUB "Enable publish/subscribe" OFF)
+ mark_as_advanced(UA_ENABLE_PUBSUB)
+@@ -526,7 +528,9 @@ if(NOT UA_FORCE_CPP AND (CMAKE_COMPILER_IS_GNUCC OR "x${CMAKE_C_COMPILER_ID}" ST
      check_add_cc_flag("-Wall")      # Warnings
      check_add_cc_flag("-Wextra")    # More warnings
      check_add_cc_flag("-Wpedantic") # Standard compliance
diff --git a/package/open62541/Config.in b/package/open62541/Config.in
index a835595e83..220fb3dfa6 100644
--- a/package/open62541/Config.in
+++ b/package/open62541/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_OPEN62541
 	help
 	  open62541 is an open source and free implementation of OPC UA.
 
-	  http://open62541.org
+	  https://open62541.org/
 
 if BR2_PACKAGE_OPEN62541
 
diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
index 5aa340ac18..3257bfe477 100644
--- a/package/open62541/open62541.hash
+++ b/package/open62541/open62541.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c59c85b519a18350f5014b6e7b7545ee144ceeb15094e75b0b7ecec7dce43dd0  open62541-v1.2.2-br1.tar.gz
+sha256  e2e1b8e6285c4fd6d8e07f37d61a8728376d525e169fadb3d61918fa6a7c271a  open62541-v1.2.4-br1.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 627c29e95b..87bd3449b7 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN62541_VERSION = v1.2.2
+OPEN62541_VERSION = v1.2.4
 OPEN62541_SITE_METHOD = git
 OPEN62541_SITE = https://github.com/open62541/open62541.git
 OPEN62541_GIT_SUBMODULES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
