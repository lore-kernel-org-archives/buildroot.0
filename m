Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226CDFEE4C9
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 14:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D83D96081A;
	Sat, 28 Feb 2026 14:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id voGyP2ELpDS1; Sat, 28 Feb 2026 14:49:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D51A6607E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772290152;
	bh=gHWUlia9t1rkERhaJYu0wTQ2EZDcI9oVZ4+XQHUS1Ec=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K6wBbue9YZYTTw5goCHHvozfw/TcTfIpKpPDFoU4pdLQ+NxNq4ILgduU4dqz28qZ4
	 135rzQvCqxP5pTuqk1P0BDCWPwYjIcjxFxfzBO0oaZSB1IuDye0z1XhmxkQ0XpyBOI
	 YzBKpDdHrXSIQJeowWGYS6XbtCFXdwrijYT4cAiYAJTiViBqyyuRQvD1FLlaQ4sx0Y
	 O1vB3GXCuB/ewSJtwzwJbNUwoz5sjURWwaxk2GKpOAVK4n51gPfTRMI3mQZEDzlDRl
	 7yUFLxAOvfs4DTdw6FjhPXPzLBNjZ0T25s1T8PMZt6JnsGnXSmB0JEzSdn844T7QMy
	 fmf/T6aitP5YQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D51A6607E3;
	Sat, 28 Feb 2026 14:49:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B845A18D
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 14:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E21F400C2
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 14:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JHUKLlWIfM-C for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 14:49:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E868240063
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E868240063
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 14:49:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C887F85C1D; Sat, 28 Feb 2026 14:49:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 15:24:51 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a7db1db0816d1e668b2802e9d1279915ef8b6634
X-Git-Newrev: a26c13c8e15efdd3f2548d261e5df29f9ff5ecba
X-Patchwork-Hint: ignore
Message-Id: <20260228144907.C887F85C1D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/piglit: bump version
 to git 3051e13ae1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a26c13c8e15efdd3f2548d261e5df29f9ff5ecba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/piglit/piglit.hash | 2 +-
 package/piglit/piglit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
index a778401253..8158177e4f 100644
--- a/package/piglit/piglit.hash
+++ b/package/piglit/piglit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  0553524e1bfce646771560805cbe523204c59dcee20dc58bb9baa87134a50ea1  piglit-62d499d63d2b8b29a67efd9d93ed9b6a94d4950e-git4.tar.gz
+sha256  060d45db7304446ef280afd60fad3a728bcd9fdfe4c204b8a236e6a4a46ce592  piglit-3051e13ae12e1c927c7baace3138a8bebec7018a-git4.tar.gz
 sha256  dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licences/GPL-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  licences/GPL-3
diff --git a/package/piglit/piglit.mk b/package/piglit/piglit.mk
index 619f29204f..e61c3c9e61 100644
--- a/package/piglit/piglit.mk
+++ b/package/piglit/piglit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIGLIT_VERSION = 62d499d63d2b8b29a67efd9d93ed9b6a94d4950e
+PIGLIT_VERSION = 3051e13ae12e1c927c7baace3138a8bebec7018a
 PIGLIT_SITE = https://gitlab.freedesktop.org/mesa/piglit.git
 PIGLIT_SITE_METHOD = git
 PIGLIT_LICENSE = MIT (code), \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
