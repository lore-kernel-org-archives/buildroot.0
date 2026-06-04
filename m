Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B94CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 234A560B39;
	Fri,  5 Jun 2026 12:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S9Rt9_4cbn_Z; Fri,  5 Jun 2026 12:38:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DD2960B62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663125;
	bh=x8v0E9iP0kwdOr2+iRCA6kCZ8dQGwgDM1tmub8lwm0E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iU2EAD7zqC/yGIgEtYcm/d1SsZS1ON30P/5RrBMe7ehCXCncaJPB7Cl5ENeSOt6K1
	 kZTzVvcQgDUfahhEEOlwEPHn8FkhAL7KH/wxGddEJCK0V7IuN+84kc13Bb7H7t+aJ5
	 F+1c06x0Me3XBIk6wRmS5ah93HspX9OfHXZhQOmDdXX1mzcihP1grDwc4Uq4dBMt2G
	 upk/NKKA/U81V07Ge4u8ikVHrIFGCn6AqeFKZPlB+0YBLumSCD0dcVLPcjtghAasbe
	 wxCljeRz+XSCj8Ct0oy96hhOhTqRvihwK019mk11IrVyhbCiqp93PePStTlujnkybC
	 I5+zH96U1elTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DD2960B62;
	Fri,  5 Jun 2026 12:38:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DAE0F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AA3081E6C
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qbz6udECvucl for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EA9881E59
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EA9881E59
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8C0787B3A; Fri,  5 Jun 2026 12:37:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:14:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e33766387c686481f32ad3f1468d071a08aa6526
X-Git-Newrev: 2d2a97ab3922b3b8f148568428a3128fbe78a8c9
X-Patchwork-Hint: ignore
Message-Id: <20260605123713.B8C0787B3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/qt5/qt53d:
 disable assimp support when BR2_PACKAGE_ASSIMP is not set
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2d2a97ab3922b3b8f148568428a3128fbe78a8c9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

If we don't disable it, the assimp module from the sources will be used
instead of none. Unfortunately, it currently doesn't build so let's
disable it when BR2_PACKAGE_ASSIMP is not set such that one can still
build qt53d.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
