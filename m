Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E184C6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36D026FB09;
	Sun, 11 Sep 2022 09:12:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36D026FB09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KdlDmD7EhrNH; Sun, 11 Sep 2022 09:12:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 795896106F;
	Sun, 11 Sep 2022 09:12:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 795896106F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CBEB1BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B915681301
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B915681301
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sE9P0S14QpvV for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC3BA81970
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC3BA81970
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C7D7C83624; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 Sep 2022 09:37:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36d00aee880a1276ec3bf3f47ee24b81f555e5dc
X-Git-Newrev: 1ea9c7d7816d5c49e60e5900609cc20d74b65309
X-Patchwork-Hint: ignore
Message-Id: <20220911084828.C7D7C83624@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/yaml-cpp: bump to version 0.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ea9c7d7816d5c49e60e5900609cc20d74b65309
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Handling YAML_BUILD_SHARED_LIBS is not needed since
https://github.com/jbeder/yaml-cpp/commit/52a1378e48e15d42a0b755af7146394c6eff998c

https://github.com/jbeder/yaml-cpp/releases/tag/yaml-cpp-0.7.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/yaml-cpp/yaml-cpp.hash | 2 +-
 package/yaml-cpp/yaml-cpp.mk   | 8 +-------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/yaml-cpp/yaml-cpp.hash b/package/yaml-cpp/yaml-cpp.hash
index 2f7a6fc639..9ad9041439 100644
--- a/package/yaml-cpp/yaml-cpp.hash
+++ b/package/yaml-cpp/yaml-cpp.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  77ea1b90b3718aa0c324207cb29418f5bced2354c2e483a9523d98c3460af1ed  yaml-cpp-0.6.3.tar.gz
+sha256  43e6a9fcb146ad871515f0d0873947e5d497a1c9c60c58cb102a97b47208b7c3  yaml-cpp-0.7.0.tar.gz
 sha256  aa6fcc27be034e41e21dd832f9175bfe694a48491d9e14ff0fa278e19ad14f1b  LICENSE
diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
index 895072ec45..d65298ffb9 100644
--- a/package/yaml-cpp/yaml-cpp.mk
+++ b/package/yaml-cpp/yaml-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YAML_CPP_VERSION = 0.6.3
+YAML_CPP_VERSION = 0.7.0
 YAML_CPP_SITE = $(call github,jbeder,yaml-cpp,yaml-cpp-$(YAML_CPP_VERSION))
 YAML_CPP_INSTALL_STAGING = YES
 YAML_CPP_LICENSE = MIT
@@ -16,10 +16,4 @@ YAML_CPP_CONF_OPTS += \
 	-DYAML_CPP_BUILD_TESTS=OFF \
 	-DYAML_CPP_BUILD_TOOLS=OFF
 
-ifeq ($(BR2_STATIC_LIBS),y)
-YAML_CPP_CONF_OPTS += -DYAML_BUILD_SHARED_LIBS=OFF
-else
-YAML_CPP_CONF_OPTS += -DYAML_BUILD_SHARED_LIBS=ON
-endif
-
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
