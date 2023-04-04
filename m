Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDD5C76188
	for <buildroot@archiver.kernel.org>; Tue,  4 Apr 2023 23:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DD28610E7;
	Tue,  4 Apr 2023 23:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DD28610E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fxVd2Cq6H3UP; Tue,  4 Apr 2023 23:00:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69524610E3;
	Tue,  4 Apr 2023 23:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69524610E3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0203F1C2990
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 23:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAD5C4090C
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 23:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAD5C4090C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M9iMV8TP8CW0 for <buildroot@lists.busybox.net>;
 Tue,  4 Apr 2023 23:00:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91BDC40907
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91BDC40907
 for <buildroot@buildroot.org>; Tue,  4 Apr 2023 23:00:35 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id g9so25073234qvt.8
 for <buildroot@buildroot.org>; Tue, 04 Apr 2023 16:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680649234;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wQCykafXk5zIv4uvRm3/AIzUn1DUpYZdStLMGHyE1Sc=;
 b=Hix/uE3hurL1TKfhEZYtHd1cm6IIxjfyYgr87gqdnh1gMrwlCZxDjE0wRTO0KcKXay
 KSX2zu91w3AHdfcboTP1zD5+1ytX+eGHWrr9Vh1ux4FPmIBityfhVENXywXWbHFhen0N
 YW0YZSaX2URfgVy/9SIObzfaxbokyrDZv5susYotnURRfTwflLOkqfQcypDvgztfhYQO
 C0eyn5+xwMFjFlSI6BJXCkynCf60DQYZyZ1KXvMem0xShBiw0zxhkmYXNXUV65AZCPdW
 r6JNrkAlbbzWqIFCGhRsDMam82Fjrp0E0IiwfeUmKVCSmtvFh96hZaFgQLvkNFuyqANh
 ld5Q==
X-Gm-Message-State: AAQBX9d6cuvZJJzX65XWNmQzrDMOpZPtQYsXdcd3ckFoVVNHiSXcnh25
 m+iPYEiALIVjGljojTcHkO4WDZnpDUw=
X-Google-Smtp-Source: AKy350bTlYTXAOvkuReEsZSD9uQ2bW2Cy9MoM13guQ3Lcx4kD1mKlr6AWGqDh2DdCFLHOBgwpb8d8w==
X-Received: by 2002:a05:6214:29e1:b0:5b9:ff75:a011 with SMTP id
 jv1-20020a05621429e100b005b9ff75a011mr5613710qvb.48.1680649234292; 
 Tue, 04 Apr 2023 16:00:34 -0700 (PDT)
Received: from localhost.localdomain
 (bras-vprn-wgfdon1802w-lp130-09-70-55-12-69.dsl.bell.ca. [70.55.12.69])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a0ce912000000b005dd8b9345dfsm3710134qvo.119.2023.04.04.16.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 16:00:33 -0700 (PDT)
From: Peter Thompson <peter.macleod.thompson@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Apr 2023 17:00:28 -0600
Message-Id: <20230404230029.32385-1-peter.macleod.thompson@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680649234;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wQCykafXk5zIv4uvRm3/AIzUn1DUpYZdStLMGHyE1Sc=;
 b=VUfT7w0S9e6eWW4F8BT1WK4ELGwG43BWrW3trqpRcrtHXJOL0yGo73p7fUi93lv0RS
 uerc/TQ/cnttvN7YbzFq2fBk0n0djUEFRKkZDDZhndDaV0lKmHiNgl2Mbsh6dBFwKK7e
 DpkJm8uJL2fC2AzFsI3fDtQnRk2X1OaM9n+lui5ZWlGerml+7631pPdSIwD+TOllxkpw
 +83MDlll1SWUaXQ/2pQ4axdCUPKsbw9BWpwjsNPJi2diVyoFMRb45uFFuwllNor3Do7F
 6qej5e5u/OhEAt3a26bbpjrc2K6g2Kn1B9r+FrLcfUtQ4fPuMZHUuQj+KtScPAfPbAMg
 CHcg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VUfT7w0S
Subject: [Buildroot] [PATCH 1/2] package/sdl2_ttf: bump version to 2.20.2
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
 package/sdl2_ttf/sdl2_ttf.hash | 5 +++--
 package/sdl2_ttf/sdl2_ttf.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/sdl2_ttf/sdl2_ttf.hash b/package/sdl2_ttf/sdl2_ttf.hash
index 3313b341f9..5e7b614130 100644
--- a/package/sdl2_ttf/sdl2_ttf.hash
+++ b/package/sdl2_ttf/sdl2_ttf.hash
@@ -1,3 +1,4 @@
 # Locally calculated
-sha256  78cdad51f3cc3ada6932b1bb6e914b33798ab970a1e817763f22ddbfd97d0c57  SDL2_ttf-2.20.1.tar.gz
-sha256  28aabfed22b3cb0b7e23ef40385e4f66297c960082f029c96d073cc1d4e008d5  LICENSE.txt
+sha256  9dc71ed93487521b107a2c4a9ca6bf43fb62f6bddd5c26b055e6b91418a22053  SDL2_ttf-2.20.2.tar.gz
+sha256  1852c8549e3d154687197d46abababd3e8faae035f19991b2ca850fa3a43ad57  LICENSE.txt
+
diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index f859d097ff..c2c4b660f8 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_TTF_VERSION = 2.20.1
+SDL2_TTF_VERSION = 2.20.2
 SDL2_TTF_SOURCE = SDL2_ttf-$(SDL2_TTF_VERSION).tar.gz
 SDL2_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
 SDL2_TTF_LICENSE = Zlib
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
