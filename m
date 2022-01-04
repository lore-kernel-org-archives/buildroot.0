Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A062C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 20:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D4B360EAE;
	Tue,  4 Jan 2022 20:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gd7UralvBzA7; Tue,  4 Jan 2022 20:52:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF71560E47;
	Tue,  4 Jan 2022 20:52:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C2CA61BF44A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFD5140308
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:52:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AqMe3Fkmm9y5 for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 20:52:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA50D402FD
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 20:52:28 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id v18so33185ilm.11
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 12:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=58BG6KbM6kvXWyNHDv4xlDf9dy6C3rN4iWnYKUKCv9w=;
 b=esz6TpRZuPkyxOyluvOGJCoQzwOZkv4yiLm6FRy4rd4s8/ormNDtBa/BkY2W+9/nfL
 dS+QrRZkMGpa2kCf9FPVxLk6zrOpqKp1uaGcn4Vi0tvjeBGLBt6/mFZFX7MErG4qEPSg
 yhM48Oj4ATYZPNCGeMlrWv9Rs/bgxo4V5KAgp8zyy2Oh42WNIGuisrq/4cgxiHPERaaa
 AJG7TLQYYMG6VewKTlTkzKoEo0XeyulX6M0fkoIMHPmiz2WgpkS4w/OmcKTZSa3byIn9
 QrFa8eBKwF7RfZ2ayBftKHiQtKeT2YgytV87ihF7SSnVtXoWKkfJSgCox3FO91QLcW1x
 Sitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=58BG6KbM6kvXWyNHDv4xlDf9dy6C3rN4iWnYKUKCv9w=;
 b=aLN7giY3dNUy080QIitw1Lbiz6EtureDPCqOcx58aW809Y0UWa++E2x5B3N517/13+
 hJhtcK2PHMrIWrmn4Gc1OEON/+dytDAri9Fx+Kc3Dz2ZDjn8vq9twkk5Grgt4GST+x/n
 90kV5uprLevEd61zuwvhF1QuCc18QfTTv9U2JOWz2W0skLbMco5sdvqGoVJbBsqrT+6m
 MBYZdzKRJl5VsTI66ckmZBi1nXwBSJ02ipwhsERsZGXOIcP9BIe5F+psy3+km9Kvz9YP
 sKFfAURtdaNr/1vnfqYY3m5OT7bSQVrp8Z0dNa1zdzTbgxF27iN6BUioaffJObZzZY0b
 pApQ==
X-Gm-Message-State: AOAM531tCi/QKbfIMJlbmuDuvi01n0hhFrj0ZAlkHjEM4e0xL/m0tiFz
 ywnjbtYwH8xgSWlxPpz296aNEU/P1k4=
X-Google-Smtp-Source: ABdhPJyvmJZbJO4vrimAS+CLyvBfZsd96XZkGVPZgj8SqT2DilK0OUDe/d4E5EeTTjGCuXvexDCHbw==
X-Received: by 2002:a92:1e0a:: with SMTP id e10mr24297753ile.28.1641329547491; 
 Tue, 04 Jan 2022 12:52:27 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id z9sm19771300ilu.82.2022.01.04.12.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 12:52:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 13:52:13 -0700
Message-Id: <20220104205213.1367539-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5webkit: use backported ICU
 patch from upstream
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use backported upstream ICU fix instead of adapted downstream patch.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...ion-ICU-68.1-no-longer-exposes-FALS.patch} | 35 +++++++++++++++----
 1 file changed, 28 insertions(+), 7 deletions(-)
 rename package/qt5/qt5webkit/{0001-Fix-ICU-related-compile-failures-from-capital-bool-d.patch => 0001-WinCairo-PlayStation-ICU-68.1-no-longer-exposes-FALS.patch} (86%)

diff --git a/package/qt5/qt5webkit/0001-Fix-ICU-related-compile-failures-from-capital-bool-d.patch b/package/qt5/qt5webkit/0001-WinCairo-PlayStation-ICU-68.1-no-longer-exposes-FALS.patch
similarity index 86%
rename from package/qt5/qt5webkit/0001-Fix-ICU-related-compile-failures-from-capital-bool-d.patch
rename to package/qt5/qt5webkit/0001-WinCairo-PlayStation-ICU-68.1-no-longer-exposes-FALS.patch
index 11d0b7b248..0c3e8b3586 100644
--- a/package/qt5/qt5webkit/0001-Fix-ICU-related-compile-failures-from-capital-bool-d.patch
+++ b/package/qt5/qt5webkit/0001-WinCairo-PlayStation-ICU-68.1-no-longer-exposes-FALS.patch
@@ -1,18 +1,39 @@
-From bf936a2bc8120f693f1effd3d9b130cddc6c4185 Mon Sep 17 00:00:00 2001
-From: Henri Roosen <henri.roosen@ginzinger.com>
-Date: Thu, 18 Mar 2021 11:53:57 +0100
-Subject: [PATCH] Fix ICU related compile failures from capital bool defines
+From 736e1d804d1efa2077c4f1fe0b9084927d82e249 Mon Sep 17 00:00:00 2001
+From: "stephan.szabo@sony.com"
+ <stephan.szabo@sony.com@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
+Date: Tue, 3 Nov 2020 20:06:15 +0000
+Subject: [PATCH] [WinCairo/PlayStation] ICU 68.1 no longer exposes FALSE and
+ TRUE macros by default https://bugs.webkit.org/show_bug.cgi?id=218522
 
-See ICU-21267
+Reviewed by Don Olmstead.
 
-Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>
+Source/WebCore:
+
+* platform/text/TextCodecICU.cpp: Replace use of TRUE with true
+
+Source/WebKit:
+
+* UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp: Replace FALSE with false
+
+Source/WTF:
+
+Replace uses of FALSE and TRUE with false and true.
+
+* wtf/text/icu/UTextProvider.h:
+* wtf/text/icu/UTextProviderLatin1.cpp:
+* wtf/text/icu/UTextProviderUTF16.cpp:
+
+Change-Id: I876cf2b10b8c858c3d265113c062d159749a2f3e
+git-svn-id: http://svn.webkit.org/repository/webkit/trunk@269325 268f45cc-cd09-0410-ab3c-d52691b4dbfc
 Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+736e1d804d1efa2077c4f1fe0b9084927d82e249]
 ---
  Source/WebCore/platform/text/TextCodecICU.cpp      |  2 +-
  Source/WebCore/platform/text/icu/UTextProvider.h   |  8 ++++----
  .../platform/text/icu/UTextProviderLatin1.cpp      | 14 +++++++-------
  .../platform/text/icu/UTextProviderUTF16.cpp       |  4 ++--
- 4 files changed, 14 insertions(+), 14 deletions(-)
+ 7 files changed, 45 insertions(+), 14 deletions(-)
 
 diff --git a/Source/WebCore/platform/text/TextCodecICU.cpp b/Source/WebCore/platform/text/TextCodecICU.cpp
 index dd6ff0675bb1..e0f4bd718828 100644
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
