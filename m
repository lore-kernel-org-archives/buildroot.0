Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4BACAC587
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 13:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B80F861546;
	Sat, 13 Sep 2025 13:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CX3ttHWrt_p0; Sat, 13 Sep 2025 13:31:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0EC561575
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0EC561575;
	Sat, 13 Sep 2025 13:31:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DBB7225B
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 13:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD3C2411A2
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 13:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j9zvJWPxOlA6 for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 13:31:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C954841194
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C954841194
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 13:31:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5BDD84529; Sat, 13 Sep 2025 13:31:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Sep 2025 15:27:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c28daa7422192d54d4372635bdb380d1491ba200
X-Git-Newrev: 718b6ff826fbae23c9f3fcd4b899ace22616e976
X-Patchwork-Hint: ignore
Message-Id: <20250913133134.B5BDD84529@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8822cs bump driver version to
 latest with support kernel 6.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=718b6ff826fbae23c9f3fcd4b899ace22616e976
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update driver for kernel 6.16+
- Update repository link

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rtl8822cs/Config.in      | 2 +-
 package/rtl8822cs/rtl8822cs.hash | 2 +-
 package/rtl8822cs/rtl8822cs.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rtl8822cs/Config.in b/package/rtl8822cs/Config.in
index c827291ae4..2e1c376902 100644
--- a/package/rtl8822cs/Config.in
+++ b/package/rtl8822cs/Config.in
@@ -10,4 +10,4 @@ config BR2_PACKAGE_RTL8822CS
 	  Realtek RTL8822CS Wi-Fi driver as a kernel module (JetHome
 	  repository)
 
-          https://github.com/jethome-ru/rtl88x2cs/
+          https://github.com/jethome-iot/rtl88x2cs/
diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
index 1d7c074ff1..2a649fe493 100644
--- a/package/rtl8822cs/rtl8822cs.hash
+++ b/package/rtl8822cs/rtl8822cs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  6150edd8e5d5812831597d4f49a6631a503468c512f85cbe449d853b6caea261  rtl8822cs-0986d5734e7630efea218dae9c16d11a10231819.tar.gz
+sha256  12bf44c0dbce921440f5800a98e877fadda2d656824cca546c2b9e0e99e6a489  rtl8822cs-0ef9ddd619d2a386df90fd7c32b65958b0d675ed.tar.gz
diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
index 345e4a0c48..d10388c2e1 100644
--- a/package/rtl8822cs/rtl8822cs.mk
+++ b/package/rtl8822cs/rtl8822cs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RTL8822CS_VERSION = 0986d5734e7630efea218dae9c16d11a10231819
-RTL8822CS_SITE = $(call github,jethome-ru,rtl88x2cs,$(RTL8822CS_VERSION))
+RTL8822CS_VERSION = 0ef9ddd619d2a386df90fd7c32b65958b0d675ed
+RTL8822CS_SITE = $(call github,jethome-iot,rtl88x2cs,$(RTL8822CS_VERSION))
 RTL8822CS_LICENSE = GPL-2.0
 
 RTL8822CS_MODULE_MAKE_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
