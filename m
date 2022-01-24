Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01D4C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 12:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50E2360E16;
	Mon, 24 Jan 2022 12:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SLg0CvnEbIaO; Mon, 24 Jan 2022 12:02:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9400660D79;
	Mon, 24 Jan 2022 12:02:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 722C51BF228
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 12:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D9D2410D8
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 12:02:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FcHpPEJWOOeo for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 12:02:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BD4E410D6
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 12:02:28 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id h23so19088402iol.11
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 04:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nA91nMnNdkDaK5pYJ3AbdP4cJHhB0yd/oCnrjD48B6M=;
 b=GjvUtX6Q3xVJR28sITm270Xso9heu1IaHcyOTGj+bduu9Y2ISm0f5hzYu6hh+UK9np
 jQtijxEeJuS/i2jYcpmlApU+GZ6ocPGF+a/RopOeZbx2eCcJcNMxJYVz4CJw28oHSIOT
 a/sUSDwLC1Cp5Ce3CJds1zqm3Ov8Arl8xnByU73B8jCawgm7HuvAajVvw44w1gdkEqhA
 8s6uZ8q8c3xdKrKCggYy+7wPENpmrbReLtygCD5HA2wtQQG3L55/o7yQu8BmVsCLC+TC
 c/ffCCN70/dlgvyX8SXUCbgC3usBoSwqKpekDAzbLfUfVUeuXCCEqB670sylY93uHOLp
 EaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nA91nMnNdkDaK5pYJ3AbdP4cJHhB0yd/oCnrjD48B6M=;
 b=lJLogzhQewvsfIZleLLeXZicRjb7ZgqgK7n7wyehbJO5BlUawuVfw00G5/6umI0ZGq
 Fs0jIUwHoDqUf+RjhG51Vp340jJHOxqhGzHfLfhk9DlO9gTptWmqa5Uw9vKt6T4ukCaB
 mTHwu+8izNwvHhFJXNmZYZNYCMpv/LAyHNLvPLKFQ8gkVfoCL0gHJr0wInhEfo3vtaUY
 3TXgnhrOaTWLaONkbBrnNdeSqlhXJ/Frt5oYh60tTqnPt0H5Sr0sEfnVWoF+PjLkj6Cg
 ymzbaLQY0StgZ830NXa119o5BnNlQxweMTTrzH75i0KYXNKHAGlgYcKrKDilVVPftB1j
 bCQA==
X-Gm-Message-State: AOAM533hvP9orx+OLXXGGUByqCpyg1Y21UjF+LcNHYNw3Np4fG94bAH7
 Mx6dxvD45HzARcfgg8ATmjg/KGyrXAk=
X-Google-Smtp-Source: ABdhPJzFXHQxktBzuSUZ9scRYAVDjDNnH8SRvHe7kaJ2aOLoJKN59Po6aNTHlJvGjan9KJgwu4K2xA==
X-Received: by 2002:a02:c4c7:: with SMTP id h7mr6338171jaj.306.1643025747227; 
 Mon, 24 Jan 2022 04:02:27 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id v19sm7109104ilj.49.2022.01.24.04.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 04:02:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 05:02:25 -0700
Message-Id: <20220124120225.593014-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python{3}-cython: bump to version
 0.29.26
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 package/python3-cython/python3-cython.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 70469c012b..b07f171c25 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  81aff945f5bfdfb86e7a5d24f5467668  Cython-0.29.24.tar.gz
-sha256  cdf04d07c3600860e8c2ebaad4e8f52ac3feb212453c1764a49ac08c827e8443  Cython-0.29.24.tar.gz
+md5  971c9708dd5269180868fc0af986084c  Cython-0.29.26.tar.gz
+sha256  af377d543a762867da11fcf6e558f7a4a535ff8693f30cce123fab10c00fa312  Cython-0.29.26.tar.gz
 # Locally computed sha256 checksums
 sha256  a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index ffc8e719cd..cf41086dea 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-cython/python3-cython.mk
-PYTHON_CYTHON_VERSION = 0.29.24
+PYTHON_CYTHON_VERSION = 0.29.26
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/59/e3/78c921adf4423fff68da327cc91b73a16c63f29752efe7beb6b88b6dd79d
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/bc/fa/8604d92ef753e0036d807f1b3179813ab2fa283e3b19c926e11673c8205b
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
diff --git a/package/python3-cython/python3-cython.mk b/package/python3-cython/python3-cython.mk
index 2f15ad8c36..da159cedc8 100644
--- a/package/python3-cython/python3-cython.mk
+++ b/package/python3-cython/python3-cython.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-cython/python-cython.mk
-PYTHON3_CYTHON_VERSION = 0.29.24
+PYTHON3_CYTHON_VERSION = 0.29.26
 PYTHON3_CYTHON_SOURCE = Cython-$(PYTHON3_CYTHON_VERSION).tar.gz
-PYTHON3_CYTHON_SITE = https://files.pythonhosted.org/packages/59/e3/78c921adf4423fff68da327cc91b73a16c63f29752efe7beb6b88b6dd79d
+PYTHON3_CYTHON_SITE = https://files.pythonhosted.org/packages/bc/fa/8604d92ef753e0036d807f1b3179813ab2fa283e3b19c926e11673c8205b
 PYTHON3_CYTHON_SETUP_TYPE = setuptools
 PYTHON3_CYTHON_LICENSE = Apache-2.0
 PYTHON3_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
