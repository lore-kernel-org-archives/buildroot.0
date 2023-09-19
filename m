Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0FACE79A8
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 15:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5F9F6160D;
	Tue, 19 Sep 2023 15:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5F9F6160D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EREsPpcKDHOK; Tue, 19 Sep 2023 15:35:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48CB160FAF;
	Tue, 19 Sep 2023 15:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48CB160FAF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9EF2D1BF28B
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 15:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8579740A94
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 15:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8579740A94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9sdWfRLXsa3h for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 15:35:19 +0000 (UTC)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D39B40A8A
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 15:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D39B40A8A
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5031426b626so4037105e87.3
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 08:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695137717; x=1695742517;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qiRXWsmXwjZS6/EYIe4nNEbB8ASFN10VNGaKzZhEv2s=;
 b=tQu2zgvqRYTEFsNv8zx768+3VWMXIzKhg4yJ9iODaKXsIV5ECp69FxolfAKDk/WfSB
 p/wCJrhgGXmcg0imzpiOdhEevr4FQVtWh+rrwgmbG/TSHGcQ5fug3YUfL7kKJ9atfA1f
 /QNVISSeY68fTyOrjE8fcSGGHIaMO9DXiKiQobUGDRS/jY2M8rM+JXcCTLqAhdoJgl72
 Gdg9Jp+ElSWYDhjsjI3Oh15YstRBRBwPTnsF7CKy7j4UFLz1euTuxKDg5p2mdOyJaT0h
 kiQ7jWJHd0nzHZtGKASlwivdUUY+UpRig08dVT49vCokL8sax3iFwKhTdqS0Kg4wZHtw
 pIPA==
X-Gm-Message-State: AOJu0YxRLruoj7XFADGhPnE5UlHoWV3coAkXMm1L3473aYsXQ2CwcjRJ
 anJhFjOdVmABceU0vF6E1O/Yd7fQC2fDjClInGf66w==
X-Google-Smtp-Source: AGHT+IFB0KjkG+X0sr3NL5BG5s/Niue60kJyYCiPSDOk4sNBeFzF2VWqXVFRe+kbX2DDyOQLj5k8qg==
X-Received: by 2002:ac2:4c3b:0:b0:500:ac0b:8d52 with SMTP id
 u27-20020ac24c3b000000b00500ac0b8d52mr89024lfq.7.1695137716665; 
 Tue, 19 Sep 2023 08:35:16 -0700 (PDT)
Received: from angelo-ThinkPad-T470p.amarulasolutions.com
 (host185138219236.static.fidoka.tech. [185.138.219.236])
 by smtp.gmail.com with ESMTPSA id
 ck9-20020a0564021c0900b005231e3d89efsm3988960edb.31.2023.09.19.08.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 08:35:16 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 19 Sep 2023 17:35:13 +0200
Message-Id: <20230919153513.2801785-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1695137717; x=1695742517;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qiRXWsmXwjZS6/EYIe4nNEbB8ASFN10VNGaKzZhEv2s=;
 b=eZfBQnW4FfWAzPnj5IqrbZ90KMBglRaWyxdnTk1XFQThlGx0FttDvhhiaYYj7fCpbO
 YxegK3KgJVnYnI7skRLFuaoXrEv188proZanrcMQgxCFaZKud81WiWhd+42B03/tjH00
 MDY6tz51fzLlo3OI6JvNtVPRAvWDpRJBJPiVc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=eZfBQnW4
Subject: [Buildroot] [PATCH v2] package/python-pillow: bump to version 10.0.1
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v2:
* Fixed md5 hash file name (thanks Quentin)

 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index bca66a7436..c2c5125678 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  2a8f327ba2250aad26ed101337c8fa56  Pillow-10.0.0.tar.gz
-sha256  9c82b5b3e043c7af0d95792d0d20ccf68f61a1fec6b3530e718b688422727396  Pillow-10.0.0.tar.gz
+md5  93a0585ab0ee9717a7576129bdabdf93  Pillow-10.0.1.tar.gz
+sha256  d72967b06be9300fed5cfbc8b5bafceec48bf7cdc7dab66b1d2549035287191d  Pillow-10.0.1.tar.gz
 
 # Locally computed sha256 checksums
 sha256  0fdb68ffb39062553be40be4e6eaea9700b4f5e870a720ae86b8925d67613ddd  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 95a67f304e..d9f6fba861 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 10.0.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/0f/8b/2ebaf9adcf4260c00f842154865f8730cf745906aa5dd499141fb6063e26
+PYTHON_PILLOW_VERSION = 10.0.1
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/64/9e/7e638579cce7dc346632f020914141a164a872be813481f058883ee8d421
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
