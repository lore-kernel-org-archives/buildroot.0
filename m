Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7993EE8FDA7
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D51C60A5D;
	Fri, 26 Dec 2025 18:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qF9NDJMMqQ-8; Fri, 26 Dec 2025 18:21:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77F1A60D62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766773289;
	bh=N+5u1FnOvpREkrKT6kn4FuvxEAByHbRy7sNQ+U8COoM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZUm6J6fhmtzsfK0YSG+S+3RN6HFLFp/Q1dgXgR2eaOKpO7INlEJ0sQYotFNVOpj08
	 LSv4cKinCfyzQf3LLOcpaJ7ehENLmvi7VOrDKmjwdDIHKWyH1dPXHi5PRVkXF5siY6
	 Y/qH2osyPDF9BCYSJwPS8DqorWrmDbPtSGskT2ZROteDGhrJg0tjU1zA+iNLJHQvz5
	 3Bc/z1WFH4TK1dnInwpmM0Op74RL81ls/GbQ3k0XrICO7RN6VCi6JSYZkqcSmFIU5c
	 TVyzBhA3A9hKy7NPNZa6hYWqMh+9SuAnO96J0hEHk3X6oFdDkdp4vSrIrRJ8rtjS27
	 qCEAgt4nGD5yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77F1A60D62;
	Fri, 26 Dec 2025 18:21:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DAD8EC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52E6E80C43
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WZBaYUuGss7O for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:20:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03B8F80C6F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03B8F80C6F
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01DBF81840; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 17:39:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af552df64eec032dde8f9a66df965c2a386792e1
X-Git-Newrev: 74e84b5cdebb94ef0b8ec9d42125fb257449326f
X-Patchwork-Hint: ignore
Message-Id: <20251226182056.01DBF81840@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/yad: bump version to 14.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=74e84b5cdebb94ef0b8ec9d42125fb257449326f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched SITE to github according to
https://sourceforge.net/p/yad-dialog/tickets/337/#8b94

Release notes: https://github.com/v1cont/yad/blob/v14.2/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/yad/yad.hash | 5 +----
 package/yad/yad.mk   | 4 ++--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/yad/yad.hash b/package/yad/yad.hash
index ec0edc522d..0bb54d24a1 100644
--- a/package/yad/yad.hash
+++ b/package/yad/yad.hash
@@ -1,6 +1,3 @@
-# From http://sourceforge.net/projects/yad-dialog/files/
-md5  82d458a2e1695dd0709f71ad26109812  yad-0.40.0.tar.xz
-sha1  4376eb42f8e38972124dc81e534cbdc9088109fb  yad-0.40.0.tar.xz
-
 # Hash for license file
+sha256  5cab399af8d9a10b76d477f848180d00addba38f4f1272a05b153a393bba3038  yad-14.2.tar.xz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/yad/yad.mk b/package/yad/yad.mk
index b40220f9ad..06adf6f20e 100644
--- a/package/yad/yad.mk
+++ b/package/yad/yad.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-YAD_VERSION = 0.40.0
+YAD_VERSION = 14.2
 YAD_SOURCE = yad-$(YAD_VERSION).tar.xz
-YAD_SITE = http://sourceforge.net/projects/yad-dialog/files
+YAD_SITE = https://github.com/v1cont/yad/releases/download/v$(YAD_VERSION)
 YAD_LICENSE = GPL-3.0
 YAD_LICENSE_FILES = COPYING
 YAD_DEPENDENCIES = host-intltool host-pkgconf libgtk3 $(TARGET_NLS_DEPENDENCIES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
