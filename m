Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB87EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 20:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDC4960BF0;
	Mon, 26 Jun 2023 20:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDC4960BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zvlUpfIILRhe; Mon, 26 Jun 2023 20:29:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3382160B8B;
	Mon, 26 Jun 2023 20:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3382160B8B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D17F1BF3A0
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 20:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63A3240180
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 20:29:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63A3240180
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lNcnNIS1aTi0 for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 20:29:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4C56408D0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4C56408D0
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 20:29:07 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fa94ea1caaso14094665e9.1
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 13:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687811346; x=1690403346;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BWCt5cSBFlLdsvolx/gnWRezo7XT6TRZ9CQML78az90=;
 b=Ur2DbdZ+7xxumir/VYIZB1pBsEaSdXXSApbbWAcFPPcu7QVX0TGfDgvPb5SPSvKMoY
 Bb7/eDnzDXGRt+PbrxCWIsue+NSiIyXfKkgumvzMQiaPhf2ttXbiDN3cHRzFV8leSHK8
 DuElAyh6b/bdu+14dNU8ImZVQ7vyKgn4Mb9Je53q75UcOdMxBBE/mj3brKCjJTuig4uz
 e+hkacNf25qicPfU1ReUh/rWaCxr1ensR8TFvz6cWZLl3M+h9K0XCdgWiiDFajYLetoi
 nSxQrL4C1xizr6IuWhf3lH+ksHXYwSzRf32SOfz+H0sGpKpF0gE34dsNIxmQMoDHuP8j
 VA8g==
X-Gm-Message-State: AC+VfDzxllin819rpiySbMpWbcJt/pRdrrmXJYUqy9RQ09FS2KkQ8JoZ
 +acAWHXidw+KyCNowFTH0vxvYsb9a9E=
X-Google-Smtp-Source: ACHHUZ5ryrKd70qmQK35GtT/w+/4OGmKoqdlb9486+VhvlOnM2b52rx95KDT46U66En66dGyRIVaFw==
X-Received: by 2002:a05:600c:138c:b0:3fa:7bf0:7a81 with SMTP id
 u12-20020a05600c138c00b003fa7bf07a81mr10112223wmf.0.1687811345706; 
 Mon, 26 Jun 2023 13:29:05 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 13-20020a05600c024d00b003f74eb308fasm8573682wmj.48.2023.06.26.13.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 13:29:05 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jun 2023 22:29:01 +0200
Message-ID: <20230626202901.346078-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687811346; x=1690403346;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BWCt5cSBFlLdsvolx/gnWRezo7XT6TRZ9CQML78az90=;
 b=PPAzKBZb0/dpIRKg1C/L15+Nol+228s3A6WOGYdmokEulbuYSyxlYpqIRlaN7x87+8
 m3U2ckSFkAcFGRkJ+2/FWotgMvbhN5Dq+8BMe6QppEgN0L+ijqyEYtgTqPvLe8GW6oM3
 wqP18KIhDmurbt+zczruTMjNIwB46usn+lWK5tW2/CP+ovbQTmc2saD6lXrA87+jRJ3i
 gKJPaDBQxY7x/7bDJKlZe0j/HSmlNsl27eRDj8G2rGPukdDzADciXMwfSsWKT78TzQpo
 Wvou3pYZd3mWTOEIarPYIJC/PptE4sYc1+Cs3rtkvtwuOCsglrR8MA/QVDQzxz/QWEAJ
 sKNw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=PPAzKBZb
Subject: [Buildroot] [PATCH] package/python-setuptools: add missing
 dependency on host-python-wheel
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
Cc: Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While migrating to pep517 build backend the host-python-wheel
dependency has been added to host-python-setuptools but
not to python-setuptools.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4537951715

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setuptools/python-setuptools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index d957930455..39ead10f55 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -12,6 +12,7 @@ PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
 PYTHON_SETUPTOOLS_CPE_ID_PRODUCT = setuptools
 PYTHON_SETUPTOOLS_SETUP_TYPE = pep517
+PYTHON_SETUPTOOLS_DEPENDENCIES = host-python-wheel
 HOST_PYTHON_SETUPTOOLS_DEPENDENCIES = host-python-wheel
 
 $(eval $(python-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
