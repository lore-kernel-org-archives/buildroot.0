Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEC9CD11BF
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 13:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE12141B40;
	Sat, 23 Mar 2024 13:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHa3reBfu0tT; Sat, 23 Mar 2024 13:50:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D13FB41B23
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D13FB41B23;
	Sat, 23 Mar 2024 13:50:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9DFDE1BF84C
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 13:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2A324064F
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 13:49:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CFnOJreyEgPv for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 13:49:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A01F408A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A01F408A6
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 13:49:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65A07810D9; Sat, 23 Mar 2024 13:49:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 23 Mar 2024 14:39:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 575d7e31c6f87b0733915e376f22d614b21fc5da
X-Git-Newrev: 354855c4bbdaea82fe8cce5829161ff3363e2292
X-Patchwork-Hint: ignore
Message-Id: <20240323134948.65A07810D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/modem-manager: bump to 1.22.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=354855c4bbdaea82fe8cce5829161ff3363e2292
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Explicitly disable newly introduced build options.

Changelog:
https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/blob/mm-1-22/NEWS

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/modem-manager/modem-manager.hash | 4 ++--
 package/modem-manager/modem-manager.mk   | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index 4b8b795af7..fa81acd9dc 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
-#Locally calculated after checking https://www.freedesktop.org/software/ModemManager/ModemManager-1.18.12.tar.xz.asc
-sha256  9c16b47547faac9515f2d03d1e8175de9c5e6769b1ee16b608ba6cfe6f04b03e  ModemManager-1.20.4.tar.gz
+#Locally calculated
+sha256  6c8f8720737a3788e394c700f36236278c9de09d76069a079e6f1daaf08b2768  ModemManager-1.22.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 979a80a8e9..495dbcd258 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.20.4
+MODEM_MANAGER_VERSION = 1.22.0
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.gz
 MODEM_MANAGER_SITE = https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/archive/$(MODEM_MANAGER_VERSION)
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
@@ -13,6 +13,8 @@ MODEM_MANAGER_SELINUX_MODULES = modemmanager
 MODEM_MANAGER_DEPENDENCIES = host-pkgconf dbus libglib2 $(TARGET_NLS_DEPENDENCIES) host-libxslt
 MODEM_MANAGER_INSTALL_STAGING = YES
 MODEM_MANAGER_CONF_OPTS = \
+	-Dbuiltin_plugins=false \
+	-Dfuzzer=false \
 	-Dman=false \
 	-Dpowerd_suspend_resume=false \
 	-Dtests=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
