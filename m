Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C187C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 20:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5652814B7;
	Sun, 13 Feb 2022 20:43:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6RTv2108Cz0G; Sun, 13 Feb 2022 20:43:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10AE7814B5;
	Sun, 13 Feb 2022 20:43:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5CD061BF83E
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 20:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47D6C814B4
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 20:43:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ufz17ClghQC4 for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 20:43:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51C63814B5
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 20:43:05 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j26so12969195wrb.7
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 12:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xhlhowzGfIN0fT8/pch6H0xxaDxK8aqohTUaIJWB35U=;
 b=QNe1BWQoJYJgpRw4L2qegcBarHOl4nFvhqy+CJHlcMbTQnoXwrKH/9PvjarvDZHHlO
 blh/beHk/rxa/ramsiCtCAtxjK1r41BuBpE+IG3zdV+h5RaYSwqujD2H5tUZYLPGQKWD
 UwVFH+CmaZzE8r4TlK29zgC0RMdIxBQTLgFzh8uPsrgiNvdYQ6Wn1i3F1oezSGMMVd6A
 HlHfqqgTjchKjBa2kbJ36ieUBCe3zjy+SUM0d7oIDJfcByojb5zyaj+U4yb9GPHt1PzH
 m20Mlv73y8jiwdT11kS7IuWGzsnlyoCBGtghzNfrL0qGpFOWxYkiqC2KU5cishiFJEMA
 M4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xhlhowzGfIN0fT8/pch6H0xxaDxK8aqohTUaIJWB35U=;
 b=O4ZiarSuCLmJTgujQ3MaOq1Kme6cMUkUAREX2gVnKQSFcxkBYsaHNIKp+8AOl5oKaP
 PClPgOywCpPTduwmzKyx/7XQql7q5BKB1MQILt45QTlc2Ydr28IaHowPoIiTnWbS5XPv
 o+v0vd/JSIarUHlXWGaPEEgxIu70PbdMftePoCISnr/aaibZrWkjTb5hV89E7qlrgHMp
 x1hzOw0XuuA2914x/ZFseuyRhVpMlWpyQ8Ij6bysPy/+SbFbd/jx6mbA519PeudaIfY2
 tbKpjElwTss9Gc2zEqdXj44/aW3B6jj3JBtBEkldrLuS2m9elEaKSnA4G4/maE2jVG32
 SBfQ==
X-Gm-Message-State: AOAM530ghDy6ZN0LfOTKf2on3uHdiTad7muNJ47X8zjLyOcetLvMOoZh
 EiBCtB2j3negPnecw4hI4AAOlo5uXYg=
X-Google-Smtp-Source: ABdhPJwokgbu8NPbWAXHHmrYD2vXbQplxOwcxTmri/apr0FuK9wpXeNJOwO5OIBFUVqZlLvP8tWlEw==
X-Received: by 2002:adf:fb10:: with SMTP id c16mr8839033wrr.200.1644784983354; 
 Sun, 13 Feb 2022 12:43:03 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id x11sm9603997wmi.37.2022.02.13.12.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 12:43:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 21:43:27 +0100
Message-Id: <20220213204327.1206836-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-gnupg: add
 PYTHON_GNUPG_CPE_ID_VENDOR
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:python:python-gnupg is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apython%3Apython-gnupg

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-gnupg/python-gnupg.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-gnupg/python-gnupg.mk b/package/python-gnupg/python-gnupg.mk
index f16910e517..fda264a0ed 100644
--- a/package/python-gnupg/python-gnupg.mk
+++ b/package/python-gnupg/python-gnupg.mk
@@ -8,6 +8,7 @@ PYTHON_GNUPG_VERSION = 0.4.8
 PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/b1/90/75e15ead9693028c05fc7abd25c756c0d1da27bf04a27d6f5c4139d8ee10
 PYTHON_GNUPG_LICENSE = BSD-3-Clause
 PYTHON_GNUPG_LICENSE_FILES = LICENSE.txt
+PYTHON_GNUPG_CPE_ID_VENDOR = python
 PYTHON_GNUPG_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
