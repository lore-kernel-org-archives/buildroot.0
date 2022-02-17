Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451DEC433FE
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 16:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E669D4259D;
	Thu, 17 Feb 2022 16:37:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xsaODexRYCrt; Thu, 17 Feb 2022 16:37:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38A0A42595;
	Thu, 17 Feb 2022 16:37:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 34E1C1BF8B4
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 16:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21B0660B24
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 16:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EWs5zRctBEKt for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 16:36:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62EEC6F738
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 16:36:51 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id f3so9885905wrh.7
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 08:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qM2Dvs+gu/V7wPgfRq1yckeWXkPay5D50CVjwDQfnAE=;
 b=brIdjT7ZFHaI5pJzdOCAs3O3a5OUk9TsmFIzaJFqVDer60VY2+O/Nuhxs7MJ1dA+Ri
 HW4cPsrHQcgFsvTmWC+Ke3VaefL5DLfHzr5ZBWKTil6ulLFtakhyGZhHZL2FTaPdpH4W
 joKecyVeRXh3RdgFD23MwLDwceI9kGrgaxEUrJVYFZ2RXURsNJ6HJU0YJCNqM7aYzGUZ
 szTxQHn/FViVAyO42CHMOTeu7l2xk0MDkSgH931471yZi31i33NwCgvumRHIiwdR6wGd
 QtT6VC2cwYbvewzQRZMXRwUqEY3ldwsQy2TH3iHanuXBHsMxKPrLnzvZYwX+X2v8yFnO
 kPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qM2Dvs+gu/V7wPgfRq1yckeWXkPay5D50CVjwDQfnAE=;
 b=XM4da7ei/qmOYMiJByO2SIm4tcyzyduObhgFfErTk9ZrGefGUKdHeCt78di32DIREA
 /i0D0trz3LtjOMP/TcN2udgjujmn2aYgk53FBNc+d7jrd8DG39ow/m90w3JttnnGbZlM
 VqwjP9fWJGgCccM9VBCVCssUOQwXMtL/kt2vrYcro/Z5a6hbWIwxx6MR4pfP+uWerKWq
 wHtByaKr8NZHwJ0X/RBInWmQzZqObZQA7wpcBtNumhwTnPCTW31UM104dj30qEYLtdtf
 Pt02ana9FkHb2VrfyN9K6V4ZKlrGb6VutTIOBhzm6Irqx0Wg4ZSBHkSqHGQ6HCJUxojq
 GjPg==
X-Gm-Message-State: AOAM533Y/raIDL9akcFDvFJecdH4Z3whkGorBsoWoMYaSqaDvGXtAcC0
 4haJKDdyyAnx2xL5HxE6KbL9ThDQb9g=
X-Google-Smtp-Source: ABdhPJxDKtqeUt8fg+8oAnZR7xDyLNrSSHF9RnY1WfVaEfDNC2qtN5Lr9PuV1T5+n3ZMG5PK6gjnnA==
X-Received: by 2002:a05:6000:178d:b0:1e8:310a:5a51 with SMTP id
 e13-20020a056000178d00b001e8310a5a51mr2893520wrg.642.1645115809203; 
 Thu, 17 Feb 2022 08:36:49 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id 2sm13815662wry.4.2022.02.17.08.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 08:36:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 17:36:54 +0100
Message-Id: <20220217163655.221545-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/kf5/kf5-kcoreaddons: add python3
 optional dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python3 is an optional dependency since the addition of the package in
commit bf48bf86295bc4628bcd14fd4ca415d6971c8ab8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
index 76be8876cc..9a034ba763 100644
--- a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
+++ b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
@@ -10,7 +10,10 @@ KF5_KCOREADDONS_SOURCE = kcoreaddons-$(KF5_KCOREADDONS_VERSION).tar.xz
 KF5_KCOREADDONS_LICENSE = LGPL-2.1
 KF5_KCOREADDONS_LICENSE_FILES = COPYING.LIB
 
-KF5_KCOREADDONS_DEPENDENCIES = kf5-extra-cmake-modules qt5tools
+KF5_KCOREADDONS_DEPENDENCIES = \
+	kf5-extra-cmake-modules \
+	qt5tools \
+	$(if $(BR2_PACKAGE_PYTHON3),python3)
 KF5_KCOREADDONS_INSTALL_STAGING = YES
 
 KF5_KCOREADDONS_CXXFLAGS = $(TARGET_CXXFLAGS)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
