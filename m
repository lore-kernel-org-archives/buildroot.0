Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCB5C433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 15:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC2EC40221;
	Wed, 29 Dec 2021 15:52:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1vbN4N1S1qrc; Wed, 29 Dec 2021 15:52:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2100940218;
	Wed, 29 Dec 2021 15:52:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AEEF41BF393
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 15:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E28E813E9
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 15:52:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8dWRX7N1sMLD for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 15:52:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6893813E8
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 15:52:14 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id a1so19236743qtx.11
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 07:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2PC4m44EQ4WnoycGQWAjCAziFqGm289JVZ+rVDeGSoA=;
 b=Mb4Y6bT/YqWQYu/eQ6VNB5hMrqRFViahDxZg9DMJQSgY20H5xaEydsaxkxgUWWAgk1
 Vp2ySAmllXRpJzjl11XtBj6p9YmjSi8wygvRWHMUqNsAyijuLjfI/AdOc4V6IWSSfD2K
 O4pUcsCVxfvziKmv4nYp6WOeSZKKNlXjygESOchLmqXdGXrep79Nmi9/IMyr8/3pixgL
 FwvrZcEh/CAebFHanmncK2VR0m4ByfDLkhHVETxy6+hMSDjgSl+vtXNgRq11QyhB7E0q
 KHtKy1n5A2D7gzSHKJ2Yv1P/BvQNpy0qTmSeRstVKKAicpQXhh4IjadAmHrZdkoM7riI
 AUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2PC4m44EQ4WnoycGQWAjCAziFqGm289JVZ+rVDeGSoA=;
 b=Z6PoVPUNAyZ8RefR5kxrpXdxI6AaqWYxH76RbKEGD55hog7xd93Y4/1pROEbcPcceE
 eavhaFhHtbeNXXGwATdurLDxXmJps6Q6lB6KI5LshSuN6s6n+ccw1p/pCkmfzFgQlJGz
 cEKWp5CoB0QC1sC1tmOrrRwBkVg5yIpCb6U8ZOvVeoeBQSx9WEzjuykO4jKrxVaoZmkR
 2dBdD6+oCmCwySLBDUdySJ8DSSLYL5UExzgJbXXwllkegs1KUsE7QkmqGfeqt/6+Bsir
 o/rNjmxFFLDVgx3wyU/SbUJ3YtYW5cdAiJrdF7u+gxK0zr13XGquT8XYApiBoeHOCNzP
 T1vQ==
X-Gm-Message-State: AOAM530aFh9dwnlBUH4dxmj3/h1RYVJwtdAjswIXrMgj1sJQrO6HuLT2
 rJWaBnwlXB3td/4d2IRX662p3l2R+co=
X-Google-Smtp-Source: ABdhPJzZAwm8Ox894OtyhBGPW6MMjy8iga1R/y4AoEyxI8loQzfdEcnxcK1S2Ny4/L192cqP3I0V5w==
X-Received: by 2002:a05:622a:48f:: with SMTP id
 p15mr23317701qtx.246.1640793133041; 
 Wed, 29 Dec 2021 07:52:13 -0800 (PST)
Received: from blazer.lan
 (bras-base-mtrlpq4718w-grc-03-142-113-6-7.dsl.bell.ca. [142.113.6.7])
 by smtp.gmail.com with ESMTPSA id v20sm17788032qkl.123.2021.12.29.07.52.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 07:52:12 -0800 (PST)
From: Ash Charles <ashcharles@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 10:52:11 -0500
Message-Id: <20211229155211.122190-1-ashcharles@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] pru-software-support: bump to latest version
 6.0.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to that latest version of the PRU software support [1]. Since
v5.9.0, the examples have been updated, kernel header references have
been bumped to v5.10, and some minor bug fixes added.

[1]
https://git.ti.com/cgit/pru-softward-support-package/pru-software-support-package

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 package/pru-software-support/pru-software-support.hash | 2 +-
 package/pru-software-support/pru-software-support.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
index a2c78e7a1a..e8ccc93a2c 100644
--- a/package/pru-software-support/pru-software-support.hash
+++ b/package/pru-software-support/pru-software-support.hash
@@ -1,3 +1,3 @@
 # Locally-calculated hash
-sha256  4a6b1b2b8ca892c442fd7fce7ddbf6b74e0619def2bb19f3ad67c94720b7ca3a pru-software-support-package-v5.9.0.tar.gz
+sha256  cba9e0bca3abc0041cf7ce6a30af9de440b325cf8c9bcc826485d2f837cb4cf2 pru-software-support-package-v6.0.1.tar.gz
 sha256  62a2f56498cd1bac2d4ea6ea1c941affba1e4bb65bfdf2dcffd8e5079fa34399  PRU-Package-v6.1-Manifest.html
diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
index 87a382948b..d0259c5f80 100644
--- a/package/pru-software-support/pru-software-support.mk
+++ b/package/pru-software-support/pru-software-support.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PRU_SOFTWARE_SUPPORT_VERSION = 5.9.0
+PRU_SOFTWARE_SUPPORT_VERSION = 6.0.1
 PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package/snapshot
 PRU_SOFTWARE_SUPPORT_SOURCE = $(PRU_SOFTWARE_SUPPORT_NAME)-package-v$(PRU_SOFTWARE_SUPPORT_VERSION).tar.gz
 PRU_SOFTWARE_SUPPORT_LICENSE = BSD-3-Clause, Public Domain
-- 
2.26.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
