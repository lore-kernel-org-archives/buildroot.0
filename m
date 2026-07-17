Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49964C4451B
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 16:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0039C60AC6;
	Fri, 17 Jul 2026 16:57:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SHRJvVf83hh0; Fri, 17 Jul 2026 16:57:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1834B60ACA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784307446;
	bh=FXgrH1Y3gBwPi610JUdHWypbQ+Sy0w8N9aE1P9+2ufQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rgGMJEaanYtx2pf/EYWsGz9opcP04PQkBmZ20LAfwcCG0JWpWdORSmxJey8DbKBHE
	 42sJpGRRT76cElrl3QMES95i/kpee2alZhaCG9XYhHpTNMw2M0ZGKiwXXgyPzSFeYz
	 w2CrQpJGQ8dmunGntsewwe8v9shfBw6ANAtP1cljqfZf0YwnXWGLhh5z3hJr58NGHu
	 8amWOLivBCJ9Y/QUmznkiumdAJb7LJ/mOzbRoNJ3anGNo+qVExaHNkaudU1gHLiRAm
	 zTsmZrBfpGa+dvG+Ekr3cS1B3qBpOEFodd8487WN1FdcKFuDaBlRIB+59/inDnC5dy
	 idE/koyzgWTNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1834B60ACA;
	Fri, 17 Jul 2026 16:57:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4E971F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 16:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A68C881170
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 16:57:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JTq6rcW3XvqD for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 16:57:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B77718116D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B77718116D
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 16:57:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FFEA88E54; Fri, 17 Jul 2026 16:56:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 18:56:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9de868be590cf2dae40884daec3d081fb5395f36
X-Git-Newrev: 23ce1c145ee385d94017bbe6fd8409be8f5a5529
X-Patchwork-Hint: ignore
Message-Id: <20260717165647.6FFEA88E54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mg: bump to v4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/23ce1c145ee385d94017bbe6fd8409be8f5a5529
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Major release, multibyte text can now be typed, displayed, and edited in
UTF-8 locales. Also, syntax highlighting, a visible region, and side by
side windows.

Release notes: https://github.com/troglobit/mg/releases/tag/v4.0

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mg/Config.in | 2 +-
 package/mg/mg.hash   | 4 ++--
 package/mg/mg.mk     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mg/Config.in b/package/mg/Config.in
index 11e5bdb273..35e0e6f57f 100644
--- a/package/mg/Config.in
+++ b/package/mg/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_MG
 	bool "mg"
 	depends on BR2_USE_MMU # fork()
 	help
-	  Emacs-like text editor (130 kiB)
+	  Emacs-like text editor (260 kiB)
 
 	  Mg is a MicroEMACS clone with the goal of being compatible
 	  with GNU Emacs, because there should never be any reason to
diff --git a/package/mg/mg.hash b/package/mg/mg.hash
index 6a3e3465b8..147809f719 100644
--- a/package/mg/mg.hash
+++ b/package/mg/mg.hash
@@ -1,4 +1,4 @@
-# From https://github.com/troglobit/mg/releases/tag/v3.7
-sha256  05101360d2194392da0950e8b6f18d067d8af0fd2f572461ba4d4e7b4ccbb4c1  mg-3.7.tar.gz
+# From https://github.com/troglobit/mg/releases/tag/v4.0
+sha256  7040117fc8177b73038027fc59e62012c77842e4ef40ab07e57f7b69832446e2  mg-4.0.tar.gz
 # Locally computed:
 sha256  7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
diff --git a/package/mg/mg.mk b/package/mg/mg.mk
index 59f1d1e316..0b5c14d8fc 100644
--- a/package/mg/mg.mk
+++ b/package/mg/mg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MG_VERSION = 3.7
+MG_VERSION = 4.0
 MG_SITE = https://github.com/troglobit/mg/releases/download/v$(MG_VERSION)
 MG_LICENSE = Public Domain
 MG_LICENSE_FILES = UNLICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
