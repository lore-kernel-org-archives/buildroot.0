Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C25FCD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE69440BFE;
	Sun,  7 Apr 2024 19:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gacvRQlgIAHG; Sun,  7 Apr 2024 19:50:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6524C40BF2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6524C40BF2;
	Sun,  7 Apr 2024 19:50:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC5351BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A61A460A61
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Py3xl4b2uJJj for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:49:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBF9B60A63
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBF9B60A63
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:49:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0D7885C08; Sun,  7 Apr 2024 19:49:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 21:48:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae6579d345e0d9972447b919ffa9ef3c97f231e5
X-Git-Newrev: b097ed3a4b32c074130c4f4c6b97ce9983fa675a
X-Patchwork-Hint: ignore
Message-Id: <20240407194943.E0D7885C08@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opensc: openssl is optional,
 not mandatory
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b097ed3a4b32c074130c4f4c6b97ce9983fa675a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openssl is optional, not mandatory since the addition of the package in
commit 8aaa7ecbce1d10cbcd880c3da5e429988f96176a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
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
