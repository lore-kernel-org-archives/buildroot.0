Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98668EF4EC2
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 08:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0E2B608D1;
	Mon,  6 Apr 2026 08:45:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cojwdW4v3evS; Mon,  6 Apr 2026 08:45:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F8DB6083B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775465128;
	bh=1oIlDc1PAFSL40L2QNJ8Z1R5pviH2yHeNfUWuJqFZi8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kI5nrhBNGW+hv2PPoibljIHvRM5hr2cXea7syEEhakAp2iEI6DOCGb8PWZqVGePGG
	 wJyrLqge2PWlXl0b8DL5Ewz1Ez5JCgSSgxqtCvD3ERtvEu56nwHNUuGUSgNiyN0ITL
	 PZ0oObPMBmagYc4yhjSCsrfuJOgJcbPb+VSDfG1029gZkrjYSCe+et/w6YA03Z5aQW
	 ZR2xg93t5BI8dzupjyeij8WzaSrtzbR38iea2Jvr0yTasFQqcrgfnCxKAoXEU6V8F5
	 bL71pkVGm7KOCX0WzuWgNEKgqrYTrGL8CrmdXouJvLxVJ+ie/QkE/Y0XF6nmYsHnZp
	 CGYsfR53DjzxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F8DB6083B;
	Mon,  6 Apr 2026 08:45:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 429E6219
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 345566083B
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IrABIxCglRWH for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 08:45:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 699BE60679
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 699BE60679
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:45:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA94E80420; Mon,  6 Apr 2026 08:45:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Apr 2026 10:41:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60a95e04d434ff31366a987df0e635fbd9400876
X-Git-Newrev: 4450a8e1a6f79546f90046d273975d5c259de181
X-Patchwork-Hint: ignore
Message-Id: <20260406084524.DA94E80420@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/newt: bump version to 0.52.25
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4450a8e1a6f79546f90046d273975d5c259de181
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://pagure.io/newt/blob/25a32726469ce1868fa7b7c7f7b0e4f91a50a639/f/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/newt/newt.hash | 4 ++--
 package/newt/newt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/newt/newt.hash b/package/newt/newt.hash
index 6d5f7c3dca..e8c945e4fe 100644
--- a/package/newt/newt.hash
+++ b/package/newt/newt.hash
@@ -1,5 +1,5 @@
 # From https://releases.pagure.org/newt/CHECKSUMS
-sha256  caa372907b14ececfe298f0d512a62f41d33b290610244a58aed07bbc5ada12a  newt-0.52.23.tar.gz
-sha512  c845d03946f72a6b46301152d7dc308f71d17b03d255d73d02ea7deb5392e22522dc8504f941fcffe5309c6c10f1b56742dac8585a16b0dc7e0c463f18871dda  newt-0.52.23.tar.gz
+sha256  ef0ca9ee27850d1a5c863bb7ff9aa08096c9ed312ece9087b30f3a426828de82  newt-0.52.25.tar.gz
+sha512  23f239ff599f63fdfec83ba32256a4b4e081d84fe7844a32a9770a0776df7e200315f794d031bca0f7c3526a9730fb3f62973bad40bf96618de6e336e97a8096  newt-0.52.25.tar.gz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index 3c9efe132f..0d78fca345 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEWT_VERSION = 0.52.23
+NEWT_VERSION = 0.52.25
 NEWT_SITE = https://pagure.io/releases/newt
 NEWT_INSTALL_STAGING = YES
 NEWT_DEPENDENCIES = popt slang $(TARGET_NLS_DEPENDENCIES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
