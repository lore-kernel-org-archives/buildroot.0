Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6404CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C2F9853E4;
	Sat, 30 May 2026 17:32:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K24NZ1uXUbTv; Sat, 30 May 2026 17:32:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02961853DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780162351;
	bh=Z8MRleLmZuL5AnopKmFmnuA2ZJX5C+PnxLSb1tbdPQQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LLeVNiPkHAKtuYKEI7m0RbyFNUUlFp+588q7OD1GyJsNP/c7P30aofl1So/xyemER
	 TtNAvyyEmTFeZ3y2LAyAeEHvwiMKs54MTVyV8F6ORfWupC7G3K3kvys1wO81dTj7Po
	 7xvl/jTdsQzeQX6cVxRCD42oeIzXMOf1XeuJSKvUcQuqvTLyqrgqDgqqblHasoebrc
	 bZ/G0TYoyMJvfGqK4Stts81bP8G85bi/p4HaDJRrUngIlTIiRc2PCZD58RIZf615/C
	 UUywnjU+GaAqWOIMGkeZPCP2+FZxoiKqEGJSyn1z41BRhWMBI9O2ult0/JkzP91Aiq
	 YXZu6Uy+lxVDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02961853DC;
	Sat, 30 May 2026 17:32:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71ECAD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 586B14269C
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-_7F3hSmESk for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:32:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97F8C40064
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97F8C40064
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:32:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 652F287532; Sat, 30 May 2026 17:32:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 19:27:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b90127ee7174bc867a98a4c0a0eb164ae7b1fe47
X-Git-Newrev: bc1a1dfece634e434b7f80bb4739ea8e4e7ff185
X-Patchwork-Hint: ignore
Message-Id: <20260530173215.652F287532@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt53d: disable assimp support
 when BR2_PACKAGE_ASSIMP is not set
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bc1a1dfece634e434b7f80bb4739ea8e4e7ff185
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

If we don't disable it, the assimp module from the sources will be used
instead of none. Unfortunately, it currently doesn't build so let's
disable it when BR2_PACKAGE_ASSIMP is not set such that one can still
build qt53d.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/qt5/qt53d/qt53d.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 8d9babd704..459b019902 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -11,8 +11,14 @@ QT53D_DEPENDENCIES = qt5declarative
 QT53D_INSTALL_STAGING = YES
 QT53D_SYNC_QT_HEADERS = YES
 
+# command line argument separator
+QT53D_CONF_OPTS = --
+
 ifeq ($(BR2_PACKAGE_ASSIMP),y)
 QT53D_DEPENDENCIES += assimp
+else
+QT53D_CONF_OPTS += \
+	-no-feature-assimp
 endif
 
 QT53D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
