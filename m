Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9499C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 10:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BE6340576;
	Mon, 24 Jan 2022 10:30:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2t_m9S82CFhP; Mon, 24 Jan 2022 10:30:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FAC540475;
	Mon, 24 Jan 2022 10:30:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25AAF1BF3A4
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 10:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1452860A91
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 10:29:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4KZl_aiU0pfo for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 10:29:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD33360591
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 10:29:56 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id d188so4531045iof.7
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 02:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WnwGyz1JQxKsKuAGVcc/ZM+LKxgcoancq+m1mX+dgp8=;
 b=Q9eQs4BMmra8Isv7gtn375VyNUSLkFxEIpQcjMvFou15XipqbnFBzNoJSr0+gMjtS1
 aCeuCqOWOS84Au+IEoFfySmJUB20Z/vR7LRW6HG/gOt35ReglylpqQA5hKZd3FOgbylX
 dsG9gUL4LPcSjm63tZCdtNSPZ7tpiE39GdfvqDOjPd6jUa79dAppIbJTK9A8GLVTkTyS
 BCXVYVk7yFiKuNIqYqCXLaKx+TK4kC9oGHNqfCmpAAdf5dLH9MHcNRkFmt17YPorqAao
 QubjVdqJLY/FE6IKBcuX4dUD4K7kdxfd+gdo3WbPp7tmvmeSzd0uCsKU5+RefkazueKe
 IfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WnwGyz1JQxKsKuAGVcc/ZM+LKxgcoancq+m1mX+dgp8=;
 b=YFDrtd0NZEBbE0RyMUEESBvaqOTW8ZTrNI4WKgV1P+9Z3VJTuDAfK8WNYH1ZJBtMYW
 BrD1lkK9tTgiosKyoqglXJJisQtiBfyilOSATC7UIkTAqEi0uF9MJbbbrp4vCbD3IqW+
 jF6+iEh3uex7zrZab131HQvkcbE6CBJfeKeBOdaPPTGD87ntDowZDZbUD2U2HZ40jE9p
 rn+KwOrbnLO9YhOfs/5lSXvNnhjlpB8AFsS85zymd/vBnE4oI00SmrkbEDHnmNs5cnlp
 /Kn4CEASB3+9oKhYbUlZZ+FR6YajlDL7HLlJCreER+74MRajTKr2jknWLonKrFg72GHy
 0w+w==
X-Gm-Message-State: AOAM533XLSNxt5Kf0TQ956jKGxy9FfEHXbl1UWzvqfuCVQWRMOcDplUD
 RqbkRtBxQPF3X0Jw7KPcX1EjXBUS0zg=
X-Google-Smtp-Source: ABdhPJw8STWXjrD9FHRXxHLT1JUX0uDbTEz7CVzZtoMHjDjU4rub23095WhPWxVwJ6YNlBbrGqwXzw==
X-Received: by 2002:a02:ca04:: with SMTP id i4mr3507699jak.128.1643020195623; 
 Mon, 24 Jan 2022 02:29:55 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id e8sm6221953iow.53.2022.01.24.02.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 02:29:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 03:29:53 -0700
Message-Id: <20220124102953.524912-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pillow: bump to verison 9.0.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash change due to copyright year update:
https://github.com/python-pillow/Pillow/commit/0bb3f87dcc72a1a80f50690abde5a3ac4576d3d6

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pillow/python-pillow.hash | 6 +++---
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index d14cb5cff6..f3ca8e6014 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  7a1eb5a250c7ccbd549a89e16404f09f  Pillow-8.4.0.tar.gz
-sha256  b8e2f83c56e141920c39464b852de3719dfbfb6e3c99a2d8da0edf4fb33176ed  Pillow-8.4.0.tar.gz
+md5  c5af6e413d2fe9247cf16ce25c816b14  Pillow-9.0.0.tar.gz
+sha256  ee6e2963e92762923956fe5d3479b1fdc3b76c83f290aad131a2f98c3df0593e  Pillow-9.0.0.tar.gz
 
 # Locally computed sha256 checksums
-sha256  5bb11d96b393a698df70018069a986248021f286344c437a13f299c3daf1dfd4  LICENSE
+sha256  a6554cb737ba6c9b47d3301f78de03b4ed0d3f08d6cf9400714f3d4c894f6943  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 5ed57c55cb..2f2e817882 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 8.4.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/7d/2a/2fc11b54e2742db06297f7fa7f420a0e3069fdcf0e4b57dfec33f0b08622
+PYTHON_PILLOW_VERSION = 9.0.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/b0/43/3e286c93b9fa20e233d53532cc419b5aad8a468d91065dbef4c846058834
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
