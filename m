Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3E2C6FD1D
	for <buildroot@archiver.kernel.org>; Tue,  4 Apr 2023 23:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E26B610F8;
	Tue,  4 Apr 2023 23:00:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E26B610F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CgrwR_-ucdz6; Tue,  4 Apr 2023 23:00:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D0EF610F4;
	Tue,  4 Apr 2023 23:00:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D0EF610F4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2900D1C298C
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 23:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D56E4090C
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 23:00:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D56E4090C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B695Td6SVbrS for <buildroot@lists.busybox.net>;
 Tue,  4 Apr 2023 23:00:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECA5640907
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECA5640907
 for <buildroot@buildroot.org>; Tue,  4 Apr 2023 23:00:49 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id g9so25073666qvt.8
 for <buildroot@buildroot.org>; Tue, 04 Apr 2023 16:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680649249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/hWox6W7UGXygqu6DUupPwzoq1vuXxEj9UxcwwCcXNg=;
 b=IAI0jUT8IAv5FJdm06NYC4s6a5nhaEaQdKRhproGGAzC44VQbLC+3/q6PvR2Tf1HGp
 WUbYX4qRqQCBukTPQdSK2XUMs9aaeTt9/WNM87OzygU/60wyyMjKwIz4VgtFHryt3V8N
 44eMDDlTvrHbMMc+jyuxoFRDkIs4Fjgr5Xa9V90+jfDK7SVOQH4ZLXPAGGHg0XO3NFLN
 +wX+yoUaH/Rh/29znIwVJ1v7EKj3nB3av+TePTtRfKJxGHUwMfdKs+K/82TQGWAh+Cok
 jl1joAwnQSNynr/Y+jFgFVHsrmq34P0aUgs8FaMRWpzAVlLfT0S69/neB5siUVwdE9CF
 +YMA==
X-Gm-Message-State: AAQBX9fP29cFsaJEyGv26aBt3B5Hq8MZwki+cKLyX1sbA+jQlJtkaP/b
 Zbn3TYjRQ5z4tLo8eI/rrke7BbVMm5M=
X-Google-Smtp-Source: AKy350blJLZKU1ivyCVvH6If5VK4irRvG7I8ij2C3FwWd/mKZh8YzFYMhw2aJwoM1qAVFalRlqAF1Q==
X-Received: by 2002:a05:6214:e4c:b0:5e0:ad80:6847 with SMTP id
 o12-20020a0562140e4c00b005e0ad806847mr6755594qvc.38.1680649249260; 
 Tue, 04 Apr 2023 16:00:49 -0700 (PDT)
Received: from localhost.localdomain
 (bras-vprn-wgfdon1802w-lp130-09-70-55-12-69.dsl.bell.ca. [70.55.12.69])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a0ce912000000b005dd8b9345dfsm3710134qvo.119.2023.04.04.16.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 16:00:49 -0700 (PDT)
From: Peter Thompson <peter.macleod.thompson@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Apr 2023 17:00:29 -0600
Message-Id: <20230404230029.32385-2-peter.macleod.thompson@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230404230029.32385-1-peter.macleod.thompson@gmail.com>
References: <20230404230029.32385-1-peter.macleod.thompson@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680649249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/hWox6W7UGXygqu6DUupPwzoq1vuXxEj9UxcwwCcXNg=;
 b=CKQvs8E6S71AdMAUn1v8hVJoY1pfk1amei59G6lw3yYPT+X0FMt2TXcIOSwE9QZFyx
 sEtOkaFJzCyEFZZOkSGcekfVMNO6e0V3gXeBWPMe0FmNPPjKyUM46glQId9YddOjHtuc
 1x7vR8sLe+RpqL2+Xz6en2v97+wvfczsSFgqvTPmvcjcx3RKQ3wMJjUjW1/FUlQW2Y9L
 v74e56iComzC1TOBip8Af6B7Pkv0pOu+2H++KdC4Upg8HNvvt6ULZCkzS5KBJ4vgyXvD
 8/UDmff2t5XsULu/ff3ijcfOClopcQg33sU88PWIwc0C6uo893fYCLnt3aFYRJaxEkXs
 otBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CKQvs8E6
Subject: [Buildroot] [PATCH 2/2] package/sdl2_image: bump version to 2.6.3
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
Cc: Peter Thompson <peter.macleod.thompson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Thompson <peter.macleod.thompson@gmail.com>
---
 package/sdl2_image/sdl2_image.hash | 9 ++++++---
 package/sdl2_image/sdl2_image.mk   | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/sdl2_image/sdl2_image.hash b/package/sdl2_image/sdl2_image.hash
index e1efa4debe..7ec84077d2 100644
--- a/package/sdl2_image/sdl2_image.hash
+++ b/package/sdl2_image/sdl2_image.hash
@@ -1,3 +1,6 @@
-# Locally calculated after checking https://www.libsdl.org/projects/SDL_image/release/SDL2_image-2.6.2.tar.gz.sig
-sha256  48355fb4d8d00bac639cd1c4f4a7661c4afef2c212af60b340e06b7059814777  SDL2_image-2.6.2.tar.gz
-sha256  28aabfed22b3cb0b7e23ef40385e4f66297c960082f029c96d073cc1d4e008d5  LICENSE.txt
+# Locally calculated
+sha256  931c9be5bf1d7c8fae9b7dc157828b7eee874e23c7f24b44ba7eff6b4836312c  SDL2_image-2.6.3.tar.gz
+sha256  1852c8549e3d154687197d46abababd3e8faae035f19991b2ca850fa3a43ad57  LICENSE.txt
+
+
+
diff --git a/package/sdl2_image/sdl2_image.mk b/package/sdl2_image/sdl2_image.mk
index 953742de28..aaf379788c 100644
--- a/package/sdl2_image/sdl2_image.mk
+++ b/package/sdl2_image/sdl2_image.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_IMAGE_VERSION = 2.6.2
+SDL2_IMAGE_VERSION = 2.6.3
 SDL2_IMAGE_SOURCE = SDL2_image-$(SDL2_IMAGE_VERSION).tar.gz
 SDL2_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release
 SDL2_IMAGE_INSTALL_STAGING = YES
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
