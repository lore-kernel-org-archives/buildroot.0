Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0A3C00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 15:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0614281B01;
	Sun, 21 Aug 2022 15:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0614281B01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id psZreJ5BnlYv; Sun, 21 Aug 2022 15:25:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03D2281AF4;
	Sun, 21 Aug 2022 15:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03D2281AF4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55E901BF5AD
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 15:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37FCF403F9
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 15:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37FCF403F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8t182Uo7hfMs for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 15:25:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58339400BB
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 15:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58339400BB
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 219B487A3C; Sun, 21 Aug 2022 15:11:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Aug 2022 17:23:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5238f51fc86714b9fe861edf6a48cf8952e5eeb7
X-Git-Newrev: 525913b24ba686b599e8c1847ed9da1e1cb03b00
X-Patchwork-Hint: ignore
Message-Id: <20220821151111.219B487A3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/network-manager: add
 optional nmcli support"
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

commit: https://git.buildroot.net/buildroot/commit/?id=525913b24ba686b599e8c1847ed9da1e1cb03b00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 5238f51fc86714b9fe861edf6a48cf8952e5eeb7.
It was wrongly pushed to master during a stabilisation preiod.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/network-manager/Config.in          | 8 +-------
 package/network-manager/network-manager.mk | 2 +-
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 1a11fc4270..39114daf18 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -33,13 +33,6 @@ config BR2_PACKAGE_NETWORK_MANAGER_TUI
 	help
 	  This option enables terminal based UI
 
-config BR2_PACKAGE_NETWORK_MANAGER_CLI
-	bool "nmcli support"
-	select BR2_PACKAGE_READLINE
-	help
-	  This option enables support for the NetworkManager Command
-	  Line Interface
-
 config BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER
 	bool "modem-manager support"
 	select BR2_PACKAGE_MODEM_MANAGER
@@ -57,6 +50,7 @@ config BR2_PACKAGE_NETWORK_MANAGER_OVS
 	select BR2_PACKAGE_JANSSON
 	help
 	  This option enables support for OpenVSwitch
+
 endif
 
 comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 4.6, dynamic library, wchar, threads, gcc >= 4.9"
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 92997d1cb6..3c39ce7d6d 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -142,7 +142,7 @@ else
 NETWORK_MANAGER_CONF_OPTS += --disable-polkit
 endif
 
-ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_CLI),y)
+ifeq ($(BR2_PACKAGE_READLINE),y)
 NETWORK_MANAGER_DEPENDENCIES += readline
 NETWORK_MANAGER_CONF_OPTS += --with-nmcli
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
