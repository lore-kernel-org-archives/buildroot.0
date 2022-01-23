Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF892C433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 22:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5036840338;
	Sun, 23 Jan 2022 22:09:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CJuXDQJmp4dS; Sun, 23 Jan 2022 22:09:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B3FE4030D;
	Sun, 23 Jan 2022 22:09:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4AB441BF2F9
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 22:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38F014030D
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 22:09:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wGmunEqH9-sZ for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 22:09:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E176402EE
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 22:09:14 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v13so10188041wrv.10
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 14:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nyyKEAlLaJPvVBPkzk5y/iBLPvd4zJ9jHeIUbrgUzYQ=;
 b=i8UCzoJmxwzp0Me8b0cEOzSakSB7GDtO/kpaJ974y+j8hHnwB+1cCGMeg0ixxS5iPc
 87aXijACaECoUrT5mg8zDl5VlUJGfwgmS1Vn1RhUdeNdmSZ8WPYdYZLCem6y3Jp1HEMs
 wuSZVHRK058leSgICyt9Pdvj4TO4tT+F7OTFt765fq2Vk/wd52P1Qox9xPez+TvqvOk2
 WaQpVIvD8CZtFGA/OhDlSahqxu7hbFU0wdd2g14WP5Xn7B9lURQzEQy3YN2nym0Zxlku
 6AsWpV67qzgSPxtDSbMjmE6/ilUIgi+KTGQro4dEqlt4DHWRmNLz+5A/8S+3puHeNrWt
 ZEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nyyKEAlLaJPvVBPkzk5y/iBLPvd4zJ9jHeIUbrgUzYQ=;
 b=mqnWWSn6ZjjKvglXXgfQbzl2IMXdUs96WaiBEmsfcMMsK05AFGT7fNMYpefEmvfgqI
 1PUjZkwOALpMNPRSwIOFJlYbkyBfBKdXNyBUxpClQ1XH7cGDZGDRAZ0QSvN5PzlpVQEI
 /vlbMnrVymXRzJGALacv/G+XfmtmYYbTVWncNCwNsg0aMgPwwHRRubjYYxo5veF0O49/
 7Ar3Zn8I5o/YzcN+F9dIXb6Xu7o6+4eYFccrwLt4UgOq6C67EN4dWBK04skrMF8R1K3R
 dFLIxQEehrmj8xzfEuGQ3gV/TgwuJjUY3sEkCTv2V8r+IAvfKr6Ac6FaB8jREj8mS9h9
 y/TQ==
X-Gm-Message-State: AOAM533qrBldgxxSid08MUpk+YhTxG42w2PgMFUjIgUv78neefAua1UB
 gqTdBKJg3VSnU4Wkf4ToOWTVlnAF87Y=
X-Google-Smtp-Source: ABdhPJykHQI+Y1ApKf71SjpvZP7nf57beT0Vh+5EpCYka/BFcXmsNc67knAMwXJBp/tpKAZBzgbEDw==
X-Received: by 2002:a5d:58c8:: with SMTP id o8mr11725171wrf.549.1642975753076; 
 Sun, 23 Jan 2022 14:09:13 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id b2sm1964034wri.88.2022.01.23.14.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 14:09:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 23:07:31 +0100
Message-Id: <20220123220731.787537-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pytz: bump to version 2021.3
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
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update hash of LICENSE.txt (year updated)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pytz/python-pytz.hash | 6 +++---
 package/python-pytz/python-pytz.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
index d1ce81e590..e0f253902c 100644
--- a/package/python-pytz/python-pytz.hash
+++ b/package/python-pytz/python-pytz.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytz/json
-md5	c3d84a465fc56a4edd52cca8873ac0df  pytz-2019.3.tar.gz
-sha256	b02c06db6cf09c12dd25137e563b31700d3b80fcc4ad23abb7a315f2789819be  pytz-2019.3.tar.gz
+md5  d7b7060bbac4970afa2050c139c9fcb6  pytz-2021.3.tar.gz
+sha256  acad2d8b20a1af07d4e4c9d2e9285c5ed9104354062f275f3fcd88dcef4f1326  pytz-2021.3.tar.gz
 # Locally computed sha256 checksums
-sha256	39f07c72a1bfda349cbd27bac9bcb1e6f8c5b4e5cc3fadf56900406e8cc0b792  LICENSE.txt
+sha256  be8b1a37ebe26c592a90f6c0eb33103a7f383ce2f4d7498c0af9a526990a07b8  LICENSE.txt
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index 888f3c4556..d606750699 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTZ_VERSION = 2019.3
+PYTHON_PYTZ_VERSION = 2021.3
 PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
-PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/82/c3/534ddba230bd4fbbd3b7a3d35f3341d014cca213f369a9940925e7e5f691
+PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/e3/8e/1cde9d002f48a940b9d9d38820aaf444b229450c0854bdf15305ce4a3d1a
 PYTHON_PYTZ_SETUP_TYPE = setuptools
 PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
