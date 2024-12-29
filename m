Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C059E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 17:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 088D380C5C;
	Sun, 29 Dec 2024 17:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vSKOVsWPkQfK; Sun, 29 Dec 2024 17:49:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D99080C48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D99080C48;
	Sun, 29 Dec 2024 17:49:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CF6AC8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 17:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B3D460733
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 17:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6xzpwbHDQK-X for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 17:49:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B096C6060C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B096C6060C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B096C6060C
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 17:49:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c38e.dip0.t-ipconnect.de [79.214.195.142])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4DFCEA4C408C;
 Sun, 29 Dec 2024 18:49:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33440)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tRxQH-000000002d8-44aa;
 Sun, 29 Dec 2024 17:49:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>,
 Daniel Lang <dalang@gmx.at>, Romain Naour <romain.naour@gmail.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Sun, 29 Dec 2024 18:49:48 +0100
Message-Id: <20241229174953.1347624-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1735494594;
 bh=SjSs3DQm8FRk6tJKEvL5ykCIEKQXzQ1PjGjSM5LbtgU=;
 h=From:To:Cc:Subject:Date:From;
 b=lj+iQAV80NU67UDvpWZs/l6ByXzBcMLis+YulEyEXqNXLhYXBx9/8aHAJ+NVvtPi+
 f5tWgiJtPECeui8t/i28aW2eFwFgA6wCU4NqkmZDv+g0kNuww4yGr5+8COsllGNCeh
 DuYxFP1HNCsuEqUFPlpA/BNLspE5+D2ey/YSxTIlG+Y/XBA2hqykQXsoWa8tQR6PKw
 WJIu1Ss2Ucl1SQnonmaUwWDp8h4FoChz3/i3vY9E22U550gMhXHWA4dB0VK85d43Ve
 vsAgesrxPoBn1HaaI84tTm86J8Tkr0r2elcH2KBB+Ox2KgOtQVvdNrnp54uf+29Ki5
 gqJMJRGD0h5FA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=lj+iQAV8
Subject: [Buildroot] [PATCH 1/6] package/libdrm: add host variant
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed for mesa3d bump to 24.1.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdrm/libdrm.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 9d463ca01e..a8a912859e 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -116,4 +116,25 @@ else
 LIBDRM_CONF_OPTS += -Dtests=false
 endif
 
+HOST_LIBDRM_CONF_OPTS = \
+	-Damdgpu=disabled \
+	-Dcairo-tests=disabled \
+	-Detnaviv=disabled \
+	-Dexynos=disabled \
+	-Dfreedreno=disabled \
+	-Dfreedreno-kgsl=false \
+	-Dinstall-test-programs=false \
+	-Dintel=disabled \
+	-Dman-pages=disabled \
+	-Dnouveau=disabled \
+	-Domap=disabled \
+	-Dradeon=disabled \
+	-Dtegra=disabled \
+	-Dvc4=disabled \
+	-Dvmwgfx=disabled \
+	-Dtests=false \
+	-Dudev=false \
+	-Dvalgrind=disabled
+
 $(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
