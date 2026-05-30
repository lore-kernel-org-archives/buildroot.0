Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E729CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25BF26F576;
	Sat, 30 May 2026 17:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d5CgTIpA2lb9; Sat, 30 May 2026 17:32:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B1906F5DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780162355;
	bh=k0VywOLLSkTMsoUSf6jZYFvQoaew+9IICgQg+tn+t28=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OI9p6ySew5lJ0DqXWwRBA0ltl/LvWEYvyUVNDCdDxz3sO2xGYG+TwWCO2dF0uiDiL
	 K+d1Z+5XXGHZZzm0rrcJhnxAx3N3wrmZQEWanePdBihLPErp3QiTpnTWfPJF8NVcWk
	 keDO382upBOO/UdJy1XuHFJDXmmv4hYVsUO+5LFKyfDOwk7pcMTHCCwyIp3E+QODOB
	 +gTVvPLwODMpONftQfVuGlE0/bS5QXiD/ZYGiuVpTtakXXmHwtvhDKNWq9lQhZD2o/
	 suD/rPvsbnQdxgVC9HXUyqPtS2sr74d80lQl5IBW7aP/9RoIh38cUYwJdOVi8NBFiN
	 W//MwhxbWXenQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B1906F5DE;
	Sat, 30 May 2026 17:32:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ED70CD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D85BB4269B
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hO9WbsjS0Np3 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:32:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AEEB42698
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AEEB42698
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:32:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BA5887539; Sat, 30 May 2026 17:32:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 19:29:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79b13f6e675d628e8253004a34d1881ffc3a4250
X-Git-Newrev: 11e380fb0300265b5e896a153e2dff2f0762fa1c
X-Patchwork-Hint: ignore
Message-Id: <20260530173215.7BA5887539@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt53d: always disable assimp
 support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/11e380fb0300265b5e896a153e2dff2f0762fa1c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Neither Buildroot's nor the module from qt53d sources compile, so always
disable assimp support.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/qt5/qt53d/qt53d.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index ae15b58df3..33e93ec5db 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -14,14 +14,10 @@ QT53D_SYNC_QT_HEADERS = YES
 # command line argument separator
 QT53D_CONF_OPTS = --
 
-ifeq ($(BR2_PACKAGE_ASSIMP),y)
-QT53D_DEPENDENCIES += assimp
-QT53D_CONF_OPTS += \
-	-feature-system-assimp
-else
+# Assimp support is broken with both Buildroot assimp and the assimp module in
+# the qt53d sources, therefore disable it for now.
 QT53D_CONF_OPTS += \
 	-no-feature-assimp
-endif
 
 QT53D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0
 QT53D_LICENSE_FILES = LICENSE.GPL LICENSE.GPLv3 LICENSE.LGPLv3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
