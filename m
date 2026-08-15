Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFF0C5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 16:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FA5260666;
	Sat, 15 Aug 2026 16:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HxwFTyYDvbCj; Sat, 15 Aug 2026 16:29:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFF2D605EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786811396;
	bh=Io04kaabjynVNRJAhpHKfn9JIK3cAg3Epn/T7NknXtE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R98TwCBk/yE+GYMqC1B+nqUadOr/GEc8B8HiU7f/KXpCrwEAjIM3obnVgb2M1adff
	 dlJgmoS4QqvQbMDdrgKSKVFcZwUSYI1vCcjS2UtQ4Jy0bj0j0H1dEnQOmyRdj33Wfv
	 6Dqh9MsFYABqiVbFlJVIjxzDMXUtqryEkmZ8vAASZfZNIDxCDJLHHZ3r1MXyh9rYK0
	 zCqOANUdRQ1I98TpLxG6Szz1Dt+xpFpIcyp29ZSgLJ2UTmOP78q+uQdbVk9mYDVUxk
	 s40odLsrSfbJvDnd9+rtjUO+Qp0BZQMMaZ932dFDmHWngEWY0YVAMk55D4HChqy486
	 FvrOR58wU0Nkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFF2D605EC;
	Sat, 15 Aug 2026 16:29:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D78D392
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 16:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 238A860640
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 16:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T6BS1y_kmZTv for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 16:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72145605D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72145605D7
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 16:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBF7A8D764; Sat, 15 Aug 2026 16:29:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 18:20:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 060ab51e0a0969401eb57480bfb20ea4b24cccfa
X-Git-Newrev: 7fe4e48c329c38ab11469fc620d3c8fcd039facc
X-Patchwork-Hint: ignore
Message-Id: <20260815162903.DBF7A8D764@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglew: bump version to 2.3.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7fe4e48c329c38ab11469fc620d3c8fcd039facc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://glew.sourceforge.net/log.html

Switched to sha256 tarball provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libglew/libglew.hash | 3 ++-
 package/libglew/libglew.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libglew/libglew.hash b/package/libglew/libglew.hash
index 29e63fa308..ded463a609 100644
--- a/package/libglew/libglew.hash
+++ b/package/libglew/libglew.hash
@@ -1,3 +1,4 @@
+# From https://github.com/nigels-com/glew/releases/tag/glew-2.3.1
+sha256  b64790f94b926acd7e8f84c5d6000a86cb43967bd1e688b03089079799c9e889  glew-2.3.1.tgz
 # Locally computed:
-sha256  d4fc82893cfb00109578d0a1a2337fb8ca335b3ceccf97b97e5cc7f08e4353e1  glew-2.2.0.tgz
 sha256  8991cd11befec7c6a63662700f03c0cc42e864b6e77c7e70b80297c951a7f0ff  LICENSE.txt
diff --git a/package/libglew/libglew.mk b/package/libglew/libglew.mk
index c9c49e6987..6c9e09c718 100644
--- a/package/libglew/libglew.mk
+++ b/package/libglew/libglew.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGLEW_VERSION = 2.2.0
+LIBGLEW_VERSION = 2.3.1
 LIBGLEW_SOURCE = glew-$(LIBGLEW_VERSION).tgz
 LIBGLEW_SITE = https://github.com/nigels-com/glew/releases/download/glew-$(LIBGLEW_VERSION)
 LIBGLEW_LICENSE = BSD-3-Clause, MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
