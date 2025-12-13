Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B359D5AE41
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 12:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94FEF60D86;
	Sat, 13 Dec 2025 12:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGR4wqJcIrnW; Sat, 13 Dec 2025 12:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FDBE60D70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765629632;
	bh=plLPioN2NifVnxH9kVDhJWql5hKVJrh7aAC1i3Gvy+s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f2YakSXmtPDBR6oSElvtDLKjkLw0USBWhR2FTxVJk1kYCDGwUtGuxyNUKZ+Mu/eGV
	 rNZKGmj5sGW5iza7WOMwU8Vyz/2fsOfG3CXh5YL6dwZ1cuEAcLHMj2lYXnvGMT+QDE
	 eQ5+HZdxWgvsQvqoz2xizCUanh46Lo1UUyWKsDb4R08m8swAwTqq1K7KxGUFA+gwVs
	 2Lus0mN+aUksNm2FX2fdhoih9NMbJnQqF4f+Zo/jhcDkiwk5aYDxyoDtlsbmH29v02
	 B3hsWoQMbddhI9GWt1PUtD/8sGZAp65FMT2ZT1XLl+4k/c9u+BiS2dUQJVWCtJMay5
	 O9yxgmecvnB3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FDBE60D70;
	Sat, 13 Dec 2025 12:40:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 89B43E7
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6ECD281311
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQdV6cYaDDjq for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 12:40:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0DC482289
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0DC482289
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:40:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C49586A8A; Sat, 13 Dec 2025 12:40:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 13:31:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68b83f9a805908e37fa6cf01e57752eb8ae2bc59
X-Git-Newrev: 8f940235c07aac7d564863281563a22611149d5e
X-Patchwork-Hint: ignore
Message-Id: <20251213124028.9C49586A8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dialog: bump to version
 1.3-20251001
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f940235c07aac7d564863281563a22611149d5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes, see:
https://invisible-mirror.net/dialog/CHANGES.html#t20251001

This commit also updates the Config.in package homepage URL
to use https.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien:
 - add link to release notes
 - add link to pgp signature in hash file
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dialog/Config.in   | 2 +-
 package/dialog/dialog.hash | 5 +++--
 package/dialog/dialog.mk   | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/dialog/Config.in b/package/dialog/Config.in
index 830427e53d..169505a144 100644
--- a/package/dialog/Config.in
+++ b/package/dialog/Config.in
@@ -11,4 +11,4 @@ config BR2_PACKAGE_DIALOG
 	  allows a developer of a script to interact with the user in a
 	  much friendlier manner.
 
-	  http://invisible-island.net/dialog/dialog.html
+	  https://invisible-island.net/dialog/dialog.html
diff --git a/package/dialog/dialog.hash b/package/dialog/dialog.hash
index 3136d18b2b..44de2ec1a8 100644
--- a/package/dialog/dialog.hash
+++ b/package/dialog/dialog.hash
@@ -1,4 +1,5 @@
-# Locally calculated after checking pgp signature
-sha256  754cb6bf7dc6a9ac5c1f80c13caa4d976e30a5a6e8b46f17b3bb9b080c31041f  dialog-1.3-20220117.tgz
+# Locally calculated after checking pgp signature from:
+# https://invisible-mirror.net/archives/dialog/dialog-1.3-20251001.tgz.asc
+sha256  bee47347a983312facc4dbcccd7fcc86608d684e1f119d9049c4692213db96c3  dialog-1.3-20251001.tgz
 # Locally computed
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index 681f8ec9fe..1039d593c5 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DIALOG_VERSION = 1.3-20220117
+DIALOG_VERSION = 1.3-20251001
 DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
 DIALOG_SITE = https://invisible-mirror.net/archives/dialog
 DIALOG_CONF_OPTS = --with-ncurses --with-curses-dir=$(STAGING_DIR)/usr \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
