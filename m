Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA82C4345F
	for <buildroot@archiver.kernel.org>; Fri,  3 May 2024 07:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AA5440199;
	Fri,  3 May 2024 07:13:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yuu4HF-7YhSl; Fri,  3 May 2024 07:13:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B874E40048
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B874E40048;
	Fri,  3 May 2024 07:13:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F1DA1BF995
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 07:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B3D1612BD
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 07:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VAI04PqJBN5n for <buildroot@lists.busybox.net>;
 Fri,  3 May 2024 07:13:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5534A6079F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5534A6079F
 for <buildroot@buildroot.org>; Fri,  3 May 2024 07:13:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41E238652D; Fri,  3 May 2024 07:13:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 3 May 2024 09:12:05 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 98a1ed7ae3557ac2522f48c23b21a65708630720
X-Git-Newrev: 2ebf2a85c0fe64384660def2621e37d7ee04c603
X-Patchwork-Hint: ignore
Message-Id: <20240503071321.41E238652D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/opensc: openssl
 is optional, not mandatory
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ebf2a85c0fe64384660def2621e37d7ee04c603
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

openssl is optional, not mandatory since the addition of the package in
commit 8aaa7ecbce1d10cbcd880c3da5e429988f96176a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit b097ed3a4b32c074130c4f4c6b97ce9983fa675a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opensc/Config.in | 1 -
 package/opensc/opensc.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/opensc/Config.in b/package/opensc/Config.in
index 8c6a95a41d..13b085f389 100644
--- a/package/opensc/Config.in
+++ b/package/opensc/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_OPENSC
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pcsc-lite
 	select BR2_PACKAGE_PCSC_LITE
-	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 	help
diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
index aa82bd18da..f4dc2206ea 100644
--- a/package/opensc/opensc.mk
+++ b/package/opensc/opensc.mk
@@ -9,8 +9,15 @@ OPENSC_SITE = https://github.com/OpenSC/OpenSC/releases/download/$(OPENSC_VERSIO
 OPENSC_LICENSE = LGPL-2.1+
 OPENSC_LICENSE_FILES = COPYING
 OPENSC_CPE_ID_VALID = YES
-OPENSC_DEPENDENCIES = openssl pcsc-lite
+OPENSC_DEPENDENCIES = pcsc-lite
 OPENSC_INSTALL_STAGING = YES
 OPENSC_CONF_OPTS = --disable-cmocka --disable-strict --disable-tests
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+OPENSC_DEPENDENCIES += openssl
+OPENSC_CONF_OPTS += --enable-openssl
+else
+OPENSC_CONF_OPTS += --disable-openssl
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
