Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327ABCD342C
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 083D18425C;
	Sun,  3 May 2026 14:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RYSqA2xZvSIp; Sun,  3 May 2026 14:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12BDD8425D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819844;
	bh=ujewxzkkYzFAWDyugoL9D/3oCna9rfNJyZ9iWCRvpPk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a7oPeFQNgECSVh6Zih22ocG0Nw6GFqGrDMmyWcBvyRzTJMy6mdfkd9OWGr4opTd8X
	 3ft3Uu4EWx1gmQcuPcQ5Tsvm/F+nnI72k7pexe4l/FxeabN5xt57+R/huwO7UoT0Mk
	 ec+bk1L+soY6szh1E19KxK+1ectJSeIT/COEyQmVddNDWfF8nOdh1A8Enp/xxldMo3
	 4qupnPSmzT6MYCNBCOUIE2cpUKX4qu4EeC2NEI1OPCptr3sgfvuJr8ayYwmvlgdVkA
	 xgOZNmUKhQo4adECanAf7WoZAQ9PUZ4CI8Z/BbF63dV+iSK36Zkg9Q1ajq+LkSI3+q
	 jkJCBxigblZMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12BDD8425D;
	Sun,  3 May 2026 14:50:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CCB7127
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1EEF40BFA
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jHqflZ0Fovdk for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E4DE40C2B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E4DE40C2B
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC80A83FC0; Sun,  3 May 2026 14:50:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a430a6f92c330a9602e85e9f2ab9fdaebc7f046
X-Git-Newrev: 6628b4f51b4d9b6edc7902471c87dc7e808d4213
X-Patchwork-Hint: ignore
Message-Id: <20260503145024.DC80A83FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dbus-fast: bump version to
 4.0.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6628b4f51b4d9b6edc7902471c87dc7e808d4213
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/Bluetooth-Devices/dbus-fast/releases/tag/v4.0.1
https://github.com/Bluetooth-Devices/dbus-fast/releases/tag/v4.0.2
https://github.com/Bluetooth-Devices/dbus-fast/releases/tag/v4.0.3
https://github.com/Bluetooth-Devices/dbus-fast/releases/tag/v4.0.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index deaaf4bd79..4709b7ed18 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  02f1448d52a71999626135269f3763f2  dbus_fast-4.0.0.tar.gz
-sha256  e1d3ee49a4a81524d7caaa2d5a31fc71075a1c977b661df958cee24bef86b8fe  dbus_fast-4.0.0.tar.gz
+md5  af7d1d9f9b169f07fb4f185c6a78d664  dbus_fast-4.0.4.tar.gz
+sha256  43137f0b73a7adbf7d5c0e9eb9d8d34df9e6e0aeafade2166e641c52dfe0a853  dbus_fast-4.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 5addc1031f..895d5fefd5 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 4.0.0
+PYTHON_DBUS_FAST_VERSION = 4.0.4
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/3d/f7/36515d10e85ab6d6193edbabbcae974c25d6fbabb8ead84cfd2b4ee8eaf6
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/5f/cd/402b0e524bdf37d8b1d22b1d926c538bf1d2eedf115ea1d401c6c08a7d81
 PYTHON_DBUS_FAST_SETUP_TYPE = poetry
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
