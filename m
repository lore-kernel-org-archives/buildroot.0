Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EACFCDB47E
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 08:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F95570455;
	Fri, 20 Oct 2023 08:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F95570455
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ZLJ0U1EAiod; Fri, 20 Oct 2023 08:27:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54F1770450;
	Fri, 20 Oct 2023 08:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54F1770450
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 366561BF2FD
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 08:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C2217045A
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 08:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C2217045A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LuiswUn-6H4v for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 08:27:14 +0000 (UTC)
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C80770457
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 08:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C80770457
Received: by mail-lf1-x141.google.com with SMTP id
 2adb3069b0e04-5079fa1bbf8so755638e87.0
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 01:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697790431; x=1698395231;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9aLC37ha0/iSVG1NPVNSNI04D4MvGLtVZhLa+ba8ydc=;
 b=LGivMTFoSpnWiC9xq7ykZUQh9ay5dwaXbHPaqzhJtMDowTzK4o7JWjPlRNoVZlbjSL
 U7MfDvK8wehc04/nq6js3FQfJPJ+aX3nn1j9bx+COWuxgMvC0vvutO7BbijJRLseVXFj
 0zVXfFZQ8ClCflyssSAzmwXY2vk3RYGPj8vpKG/dkj5M/wmyLwGX5yu3vbgK7SIO6D/P
 jLsaoDM/wZW9R0KxQV6/Pvj+qXGxZmDGfqX9cobUP7invtXxJoNYPAqo0QTaVWYyvkq1
 kMG4fsyvj24Q/1is9hiwTKBw2N3QmZIbhR/0L4e2DuhXOK+/kDdcIpJKL3H310b5RcmG
 xMvw==
X-Gm-Message-State: AOJu0YwHb2etHyIHlU13liIzOKTyFzX/SqSia2sgJVhgrFm8qzIq5Vh0
 JfmCnFitTdl6OZEmyPh+xcss6amM8womzWiC2mxgu0+Im6Wovg==
X-Google-Smtp-Source: AGHT+IG0oj7zB6cvBMWvjOA42fAxFcbUCI5gTHNZ3QT1FulHq00x0Dk6UR6GlBaN2hpMlQuM6vyUmQ==
X-Received: by 2002:a05:6512:4019:b0:507:a620:6b96 with SMTP id
 br25-20020a056512401900b00507a6206b96mr899670lfb.57.1697790431396; 
 Fri, 20 Oct 2023 01:27:11 -0700 (PDT)
Received: from localhost.localdomain (net-91-81-8-146.cust.vodafonedsl.it.
 [91.81.8.146]) by smtp.gmail.com with ESMTPSA id
 o1-20020a5d6841000000b0031ad5fb5a0fsm1168826wrw.58.2023.10.20.01.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 01:27:10 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 20 Oct 2023 10:27:03 +0200
Message-ID: <20231020082703.1610281-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697790431; x=1698395231;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9aLC37ha0/iSVG1NPVNSNI04D4MvGLtVZhLa+ba8ydc=;
 b=b/VFPKTL+faqL1IBKneHPJWbd7XOhBCx7KRF3497V2e+3z9tsG2pMW+vkqVKdof+A/
 nguujWSm9Nz3EgurBOP0wVJyZSllyeai3FtKYjL5HQvETfAVgQM09HP2hn7paueKf0Ns
 MfnzmjA/7hErhPnmWrN03kItHGh+Tvxx24A8Q=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=b/VFPKTL
Subject: [Buildroot] [PATCH 1/1] package/python-django: bump version to 4.2.6
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
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tested with tests.package.test_python_django.TestPythonPy3Django.test_run in
Fedora 38 and Debian 11

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index ee1776b44f..b68f4231fa 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  3720c85a8c25cacbce2f95d345d0f5ad  Django-4.1.10.tar.gz
-sha256  56343019a9fd839e2e5bf203daf45f25af79d5bffa4c71d56eae4f4404d82ade  Django-4.1.10.tar.gz
+md5  ad84c2b9bbebaa26427a2a656fe5ceea  Django-4.2.6.tar.gz
+sha256  08f41f468b63335aea0d904c5729e0250300f6a1907bf293a65499496cdbc68f  Django-4.2.6.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 61dfd54dcd..79065ab60a 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 4.1.10
+PYTHON_DJANGO_VERSION = 4.2.6
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/70/d4/eded564fa5928f68771d082ec0eef4d023f9d19dfa1d2923305bc3e62afe
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/23/7b/f47d10d870fabfcaa1fba403460a4e482ab7dbba4d715d43981d1f8c8d85
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
