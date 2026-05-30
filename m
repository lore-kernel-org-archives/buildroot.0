Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDD4CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 086BC6F5DC;
	Sat, 30 May 2026 17:32:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IXdgVD7A1ziY; Sat, 30 May 2026 17:32:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02DED6F56A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780162350;
	bh=nWMq2EiN996mt2IYnRHUe+gNWryv3dNt9TELEKenzis=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aaWRZyHN3LCa+FcrvSs2xv07OoD8M9h3AQQ2D/nOAiO2+7wOblsd/9oedeP3h6ii4
	 1AzCk+ntACl/kK52pFikXiW2c48Wi5jFG3TorGiXO3Ja1w7tPgHbqMlFqTM/y0/o9X
	 KR1ghziVY02zL8d6B+CZQ5eIXH4AgYt0LQ9WD9yuiheMm6HHbecxJQEql9Nuhc9kSY
	 B2cysEaa1ZK9kCBa+e5K5ZjB9/xbZ0GsJbAGlAVJXKLfzZQzqkwVUHK3s+5pD02XDM
	 NMJMX7LYpaBwP9e7GhYQWCp3rOS6upLuwA+3t5HpjCtm1FlyYnZW6L04B/2wAO1ySy
	 cN2iD2/SxNiRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02DED6F56A;
	Sat, 30 May 2026 17:32:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D8FBD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4ED8B42F27
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7suO4DK_ejRA for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:32:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EC0042F21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EC0042F21
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:32:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7040687538; Sat, 30 May 2026 17:32:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 19:28:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bc1a1dfece634e434b7f80bb4739ea8e4e7ff185
X-Git-Newrev: 79b13f6e675d628e8253004a34d1881ffc3a4250
X-Patchwork-Hint: ignore
Message-Id: <20260530173215.7040687538@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt53d: force using Buildroot's
 assimp when selected
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/79b13f6e675d628e8253004a34d1881ffc3a4250
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

If we're adding a dependency to the package, it's for its build system
to use it. Unfortunately, when -feature-system-assimp is not passed, the
assimp module from the sources will be used. Moreover, it doesn't build
currently.

Unfortunately, qt53d still doesn't build with assimp from Buildroot.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/qt5/qt53d/qt53d.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 459b019902..ae15b58df3 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -16,6 +16,8 @@ QT53D_CONF_OPTS = --
 
 ifeq ($(BR2_PACKAGE_ASSIMP),y)
 QT53D_DEPENDENCIES += assimp
+QT53D_CONF_OPTS += \
+	-feature-system-assimp
 else
 QT53D_CONF_OPTS += \
 	-no-feature-assimp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
