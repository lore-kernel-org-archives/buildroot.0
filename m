Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A69C531C9
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 11:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7A3C60B16;
	Sat, 25 Jul 2026 11:08:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id waE6D2VzsDrg; Sat, 25 Jul 2026 11:08:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B263360698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784977714;
	bh=pcjaT2WifJJRbjL9Tb9L9Skht15YB/GaSExEx9jFgZc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=boQmmMvf8NdD4W+yuGrpTKa0t0dAjGxDuej50WnW6xHclNNCMjZeyrMbZkpdgb4r+
	 gk1iFzyZ0g1QQGK7Osu4bZZe53ljdt77YTJSMB5UnetwCSCKQ/6Ii5NkAKsiIGEn23
	 4H3zUyHBCYcJmP+noA9CN4cP95y2Na3Hoxlf5gNnn5+l66xhlFZzgUQu09Ys0ddlEP
	 qHCMOfPP0bmcMjcC2VLGle83Y8/jUDoj5ACfn+/o9QZZ73m6UOqCLBtlq6R8zEh7fo
	 Vf3eLfRvMrKgXIzJjXiwjpFnbKS/Lrtaq1Nl0WYPTUQjcbkjwHb4MqxX5NJ+dwi4V6
	 Gwj3uxflKMRgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B263360698;
	Sat, 25 Jul 2026 11:08:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C5FD4990
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7CE380FB0
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IZoKCFjSdT_k for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 11:08:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E25E481006
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E25E481006
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:08:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2F4C8A585; Sat, 25 Jul 2026 11:07:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Jul 2026 11:47:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60ccc562781e74c30f074c46baa79b89e2e0791d
X-Git-Newrev: 19c1f93e1293414ace60ced20d5058b096268820
X-Patchwork-Hint: ignore
Message-Id: <20260725110749.C2F4C8A585@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlite: bump version to 3.53.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/19c1f93e1293414ace60ced20d5058b096268820
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://sqlite.org/releaselog/3_53_4.html
https://sqlite.org/src/timeline?from=version-3.53.3&to=version-3.53.4&to2=branch-3.53&y=ci

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 1b81bef6e8..3844da4792 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c917d7db16648ec95f714974ace5e5dcf46b7dc70e26600a0a102a3141125db0  sqlite-autoconf-3530300.tar.gz
+sha256  0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c  sqlite-autoconf-3530400.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index b27abef9e9..5d0fdf4791 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.53.3
-SQLITE_TAR_VERSION = 3530300
+SQLITE_VERSION = 3.53.4
+SQLITE_TAR_VERSION = 3530400
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2026
 SQLITE_LICENSE = blessing
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
