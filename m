Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03501C4167B
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 18:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C77A4109F;
	Fri,  3 Nov 2023 18:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C77A4109F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JZOaTB1wdmjA; Fri,  3 Nov 2023 18:44:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3483B410A4;
	Fri,  3 Nov 2023 18:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3483B410A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CECD91BF57C
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 18:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3C0F60AD1
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 18:44:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3C0F60AD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p2W87DlR-TJJ for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 18:44:33 +0000 (UTC)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E24B460AD0
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 18:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E24B460AD0
Received: by mail-pg1-x544.google.com with SMTP id
 41be03b00d2f7-5b7f3f470a9so1921457a12.0
 for <buildroot@buildroot.org>; Fri, 03 Nov 2023 11:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699037071; x=1699641871;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U7vuhMeQWqBAST0h8mNm10gEZgya6Wa3H+iuzprxKxs=;
 b=e8My9xzUvwyGMET4YdRLS+5cLYtsIp0ViPPhzXPMmz7TxgQUPLlp2hcnlulLD5457H
 wR0BUT0G8ClaVmIgO0vho1pqnzt3PxlZGGh3KX3aroWriam2bNWiynX0awwlx/EY+mWO
 EblbbMEe0ipqSqFCZreqh48OxdjE6Krug3XVRglJ3bC7OganDdj+RpdxrpsUf++5o5xo
 5+3iRI9wqW0yw/RSUXhIOKqk1+oKAhlXWgbL8XmiSiOVNG6xKpEAjmmAFxEhVqPFUuPK
 n9tWV5M/XD2zClx3GZSEzrnDYLHZ82CQst5QORuBK3aMA/lrBSI323RAyC4HftiL5ATi
 4H8Q==
X-Gm-Message-State: AOJu0YzrPIBhpkg4TIou6lGsKBpGKlqRACuRRpOPfKlPTfQdefZHIWo7
 Km2YH5qzQKu/fQMI16lJntyTSdV1Vf44Q+2IQGfv2jj68mg=
X-Google-Smtp-Source: AGHT+IFso+fi7o1u92vHK/k7He6yEzs07gv1nBMfROksl/DCBiWB6PHs+MbK0a9T0OY87XP5p3BCzA==
X-Received: by 2002:a17:90b:617:b0:27d:58a8:fa7f with SMTP id
 gb23-20020a17090b061700b0027d58a8fa7fmr20350498pjb.37.1699037071354; 
 Fri, 03 Nov 2023 11:44:31 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 em16-20020a17090b015000b002800ea6caacsm1596476pjb.1.2023.11.03.11.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 11:44:30 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  3 Nov 2023 12:44:28 -0600
Message-ID: <20231103184428.1029306-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699037071; x=1699641871;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U7vuhMeQWqBAST0h8mNm10gEZgya6Wa3H+iuzprxKxs=;
 b=Oo8NYyl8HrafSL1wBAWLYQhFO/QdPJcIGd2bNU/HJuf8Q0aAoMrLDTZXqBwPnAksS4
 BGbzlKqRyYv3sgkIvyH7XP5HU1EzGuf4FFtaJGNxRbRGPb5geN/THfQ8iQgz2Iyp0Psq
 m5CXUrgjijXoALz6xtrPqnxMW0nN8xYDK+zjI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Oo8NYyl8
Subject: [Buildroot] [PATCH 1/1] package/python-django: security bump to
 4.2.7
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

 - Fixed a regression in Django 4.2 that caused a crash of QuerySet.aggregate()
   with aggregates referencing expressions containing subqueries (#34798).

 - Restored, following a regression in Django 4.2, creating
   varchar/text_pattern_ops indexes on CharField and TextField with
   deterministic collations on PostgreSQL (#34932).

Tested on Fedora 39 with:
./support/testing/run-tests tests.package.test_python_django

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index b68f4231fa..98c338f9d4 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  ad84c2b9bbebaa26427a2a656fe5ceea  Django-4.2.6.tar.gz
-sha256  08f41f468b63335aea0d904c5729e0250300f6a1907bf293a65499496cdbc68f  Django-4.2.6.tar.gz
+md5  d7afe6a68b631725a1dac116a7832b10  Django-4.2.7.tar.gz
+sha256  8e0f1c2c2786b5c0e39fe1afce24c926040fad47c8ea8ad30aaf1188df29fc41  Django-4.2.7.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 79065ab60a..9b710412fa 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 4.2.6
+PYTHON_DJANGO_VERSION = 4.2.7
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/23/7b/f47d10d870fabfcaa1fba403460a4e482ab7dbba4d715d43981d1f8c8d85
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/5c/62/0c6ab2f3ac9a242b4562b6be1c418685fa7d1ccb8ca302cdb97e0b23cf4b
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
