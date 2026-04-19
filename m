Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02053EA7197
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 19:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FD944064F;
	Sun, 19 Apr 2026 19:05:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EGzh83BocT2Y; Sun, 19 Apr 2026 19:05:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C635A40854
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776625536;
	bh=2AjNk1tRMdWcIk9RjDKVviqH8S3mJQjFVlwxcjPW4/o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j1ZrQ4r8tc2gysDR6TKKVxMf+a2ios1kjZAMwyR1zmJW5ZSfBEh+P+zKzZUzerRa/
	 r5g2onQrKPAq61sCmp5/JxuGwkaeGuI6kipjW1JcR7aH8lAghDfRT5zTGoPbzpaYgw
	 VXJ4P2mrVcz5/wPg+cjhHAy5CEY6VRcBKQjx/Rf5W7O0yk1CJLmeRh7kt6OVLut55a
	 Diyn0EbKkIsOumZaGzhwedl5tnq2wLZSHfZS0pvn6egk6yzfvlTfaZwGKtMYpsNkyj
	 v/8P94/a+yWgFvGLiio1m5RhVKxYgMeo8XJbaYifjiLQkTEzdZByZDAoufwzzGG1P9
	 Eq3XKCWAg5iNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C635A40854;
	Sun, 19 Apr 2026 19:05:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 055BD2B8
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA57360FE6
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQp2j4YJDM9H for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 19:05:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1398608C5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1398608C5
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:05:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A8B281F7B; Sun, 19 Apr 2026 19:05:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Apr 2026 21:04:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6300c1237f8e9e5fd623fe2fbd04f0c5928a5417
X-Git-Newrev: b30035e832bf7afbc4506806255d75d8f92cd4df
X-Patchwork-Hint: ignore
Message-Id: <20260419190534.9A8B281F7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-mythtv: bump version to
 21.3.5-Omega
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b30035e832bf7afbc4506806255d75d8f92cd4df
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/janbar/pvr.mythtv/blob/21.3.5-Omega/pvr.mythtv/changelog.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index dde8406aae..004ad86448 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8dbbc12e5b95adeda229a572e24202abda52284f59a96c30798d7d3a855f6a42  kodi-pvr-mythtv-21.3.3-Omega.tar.gz
+sha256  37e7ffd44707d135fd5512d560fce34ad02880410142df1b3b607a834634bc99  kodi-pvr-mythtv-21.3.5-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 9ab39ac092..063b39f582 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 21.3.3-Omega
+KODI_PVR_MYTHTV_VERSION = 21.3.5-Omega
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
