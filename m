Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87EFC7618E
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 20:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 540244173C;
	Mon, 24 Apr 2023 20:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 540244173C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PMZqbB6wkFV9; Mon, 24 Apr 2023 20:26:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 318104174A;
	Mon, 24 Apr 2023 20:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 318104174A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BDC9A1BF476
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4A1F60C0F
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4A1F60C0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pG0weq9XmGz5 for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 20:25:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEAEC60AA5
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BEAEC60AA5
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 20:25:21 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-63b620188aeso6094291b3a.0
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 13:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682367921; x=1684959921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/z+S7ItTS/AB7N6sF+38kNep6zgCg4vMMjr56SMrtKU=;
 b=XJpgTPQ0OyDy/1ceoQHSD1Kb6crl/u1X7O4ezI9+vEwSTV//cPaEQr10UefiSv/j1X
 5zrEeUjSTAQIVN5MpaMRfoEPAbodsXy/yADo+hBos222GmBTyIrT39c9lPVrWbambFtF
 yBujQSaUf9ZnlOdN3Dj7wEm2W1743rr2TEG5HpIQAZEv3OeX+OqpQ7/rzpacD0R1EYff
 XN/5OG6AwgVmqzVauZHWXXZ4VPR/QKdMmlV5zG780ibUromZSsC61DISFf1b3j9bXRv+
 0MRkA8SmWjSjMC1wQ4VefgERxUR4DVVfpYAee1HSwXUWvuShxmsT1JvX6mj9Xdg1MvoR
 K4jA==
X-Gm-Message-State: AAQBX9fHwvGcS1CCtmATDzNjtN74iYVGY31mpBtlwS1b0u4QcHGEkaHK
 wuWlI9pmO8QPhE7CmeOpWLzA3HPuCO5FSw==
X-Google-Smtp-Source: AKy350ZKBtWRxB10BWMr22BVDtLJEjepHh/+uxC+NjaLVr3ugmZhnOl29jGqp0hots3Vo/xQ3wTNLg==
X-Received: by 2002:a05:6a21:3389:b0:ef:a31b:af8b with SMTP id
 yy9-20020a056a21338900b000efa31baf8bmr19291986pzb.24.1682367920564; 
 Mon, 24 Apr 2023 13:25:20 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::e18])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a656806000000b0051b71e8f633sm6819592pgt.92.2023.04.24.13.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 13:25:20 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Apr 2023 13:25:04 -0700
Message-Id: <20230424202514.1546092-4-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424202514.1546092-1-aduskett@gmail.com>
References: <20230424202514.1546092-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682367921; x=1684959921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/z+S7ItTS/AB7N6sF+38kNep6zgCg4vMMjr56SMrtKU=;
 b=ZJavsSGc5JhQrbZpQyeNEvODtVdybsfNKPjaHSvFWJSQxKRfHg+UOxG9Dh2xkildP0
 QTU0yCicWFOHvMLv93jHsTY/hzcgYiEchXKAUSVbmBqtLBJgMHtc7vn8UBCVy6SdUasS
 ODWYTKQgjKWM/X8bI8NvWyHTLOlMRwm3Xt0FGM9ANle/JYBCILgnJJrYBLRuSjD/W1BR
 tVULjv3Qsxuyp0QQ75Wi3hrCHnaeoH97Y6OnjthMhkazsB0j0bTEHQjcAOB5AbphfzRA
 VYGgBIXkMCpJmiculKNQZadRL90U2HpD1MD48bv6qIZ6MtSgkFO1kigMIH5+GxC4XMsU
 +m+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ZJavsSGc
Subject: [Buildroot] [PATCH 03/13] package/libsepol: bump to version 3.5
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change the license file to LICENSE. The hash remains the same.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libsepol/libsepol.hash | 4 ++--
 package/libsepol/libsepol.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libsepol/libsepol.hash b/package/libsepol/libsepol.hash
index 039e4e3c7e..c243aaae2b 100644
--- a/package/libsepol/libsepol.hash
+++ b/package/libsepol/libsepol.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  2d97df3eb8466169b389c3660acbb90c54200ac96e452eca9f41a9639f4f238b  libsepol-3.3.tar.gz
+sha256  78fdaf69924db780bac78546e43d9c44074bad798c2c415d0b9bb96d065ee8a2  libsepol-3.5.tar.gz
 
 # Hash for license file
-sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
+sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  LICENSE
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 8551a5de79..f7782542ec 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBSEPOL_VERSION = 3.3
+LIBSEPOL_VERSION = 3.5
 LIBSEPOL_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEPOL_VERSION)
 LIBSEPOL_LICENSE = LGPL-2.1+
-LIBSEPOL_LICENSE_FILES = COPYING
+LIBSEPOL_LICENSE_FILES = LICENSE
 LIBSEPOL_CPE_ID_VENDOR = selinuxproject
 
 LIBSEPOL_INSTALL_STAGING = YES
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
