Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A3CC0015E
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 20:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4DDC40BD0;
	Wed, 26 Jul 2023 20:28:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4DDC40BD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OYhwsVe9DxJO; Wed, 26 Jul 2023 20:28:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0ACE240A59;
	Wed, 26 Jul 2023 20:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0ACE240A59
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 99BFD1BF40D
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 20:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E5F6819BC
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 20:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E5F6819BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JfqTusrIeTqZ for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 20:28:43 +0000 (UTC)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 019ED81970
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 20:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 019ED81970
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-53fa455cd94so105491a12.2
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 13:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690403322; x=1691008122;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UbbhFy2jirfHbS4g0mFGZqrpc+ss6sH8Th1JP4hrQA8=;
 b=Hr0zY136zEjzjUl35m2m1B0csJFgji65jumHLigbI9kRIRapM8q1XTI3/T6nmkGfDd
 C7rufTZnCvFiGzdjyu2etDZtNE8MDkWQ2nSq+TMkRtuZMV+rqu9jqvGeci9wVgBWN/YJ
 G8xjWvo75uXbD0rJOdmeQ46iAuByhASmyWkBLYWqmWx4IxfKhO+eZTZsUnhXBL7hsshd
 jWWn/DyL7j6UmwQdcguRnqPseV2NSXkvwtCH2J9y/7Hd+RI/iff/wnOZTuZynb8696Mo
 Xa1l9LjkFkP/7Uyi8pAozi3ZZvP50zlnicbgO6oz/Q6gViKp9DYIifsA7zEgo7Rdzz57
 b4Nw==
X-Gm-Message-State: ABy/qLb7+2DcwlYvmhf1KLwugEeyEMUAGe5ZwthTkVenRTUCHEWqITeh
 nQvxB/xxXEzSvtY6BQTHrNxe+AsHyEn+WtV+HLO6RQ==
X-Google-Smtp-Source: APBJJlEUWbzYXvWxpdGPwFb+wK2EmgUH2nVu1VY/eiRMR4d2ewDz/MSgGAYL8rVyxTgeLSxSaR9evA==
X-Received: by 2002:a17:90a:3d85:b0:268:d1c:2421 with SMTP id
 i5-20020a17090a3d8500b002680d1c2421mr2459760pjc.38.1690403322044; 
 Wed, 26 Jul 2023 13:28:42 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 v20-20020a17090a899400b00260a5ecd273sm29600pjn.1.2023.07.26.13.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 13:28:41 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 13:28:36 -0700
Message-ID: <20230726202838.1931660-1-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690403322; x=1691008122;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UbbhFy2jirfHbS4g0mFGZqrpc+ss6sH8Th1JP4hrQA8=;
 b=Ro91T9RDUVvlBleDGxFXKI+xknxzlMqix3gW/LY1KXoDqf57OE+RUTz4yGjACAt/aK
 W32pG87AAeFslLFGFnKkBY7Nbho/RSktP9ePACVw1h+KHWY8zxYT6SfuvlY0sH0Txz3P
 lGfZ4dPa46Banzvo3eC5CNRvcXyX5T3BpznucDjQWT5BJuvbVyQE5EWbRseUu4D15OOW
 W8356pxXEdvfr6K9nXeDbBfd/WdtTmF5JHfCvtkkNmuQ7FBjFVhwVQlypoUbmWbcy2tH
 JIWo6VWPN/+e8k5fjqFbJFK8SkxUi0mofPXLQ8d5hQYt/FtnqpL/c/D/c8XTbgzBFSdY
 Hf1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=Ro91T9RD
Subject: [Buildroot] [PATCH v1 1/3] package/python-pylibfdt: bump version to
 1.7.0.post1
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/python-pylibfdt/python-pylibfdt.hash | 4 ++--
 package/python-pylibfdt/python-pylibfdt.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pylibfdt/python-pylibfdt.hash b/package/python-pylibfdt/python-pylibfdt.hash
index 056fd3a62e..82527e727e 100644
--- a/package/python-pylibfdt/python-pylibfdt.hash
+++ b/package/python-pylibfdt/python-pylibfdt.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.python.org/pypi/pylibfdt/json
-md5  5765c20ac6cde517d5b7218503ab707b  pylibfdt-1.6.1.tar.gz
-sha256  90c667c5adf44c6ab2f13bdc566598897784c7b781bed91064e7373bd270b778  pylibfdt-1.6.1.tar.gz
+md5  353ee3063d0b10e94d165e032897d34e  pylibfdt-1.7.0.post1.tar.gz
+sha256  2d048f9f8ce9a0527d497f423dea1f1135f9811c05b009cc5d5753771c1f9ba1  pylibfdt-1.7.0.post1.tar.gz
 # Locally computed
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  BSD-2-Clause
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  GPL
diff --git a/package/python-pylibfdt/python-pylibfdt.mk b/package/python-pylibfdt/python-pylibfdt.mk
index dc68de83b3..5511bd12b3 100644
--- a/package/python-pylibfdt/python-pylibfdt.mk
+++ b/package/python-pylibfdt/python-pylibfdt.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFDT_VERSION = 1.6.1
+PYTHON_PYLIBFDT_VERSION = 1.7.0.post1
 PYTHON_PYLIBFDT_SOURCE = pylibfdt-$(PYTHON_PYLIBFDT_VERSION).tar.gz
-PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/15/3c/40b1d6a1df9dbc9d9ba5700a47ad95ca1e984f18daf25ede0da5f67d0cf7
-PYTHON_PYLIBFDT_SETUP_TYPE = setuptools
+PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/96/5c/77ef0f0459e0b13f39ecc22e21ad4ac9fbe741e8a7cd70702ac8165f80e2
+PYTHON_PYLIBFDT_SETUP_TYPE = pep517
 PYTHON_PYLIBFDT_LICENSE = BSD-2-Clause or GPL-2.0+
 PYTHON_PYLIBFDT_LICENSE_FILES = BSD-2-Clause GPL
 PYTHON_PYLIBFDT_DEPENDENCIES = host-python-setuptools-scm host-swig
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
