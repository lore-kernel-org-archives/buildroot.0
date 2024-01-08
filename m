Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A928C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 06:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C84E60E86;
	Mon,  8 Jan 2024 06:51:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C84E60E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4NqTCHG5hx4u; Mon,  8 Jan 2024 06:51:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68BF560BCD;
	Mon,  8 Jan 2024 06:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68BF560BCD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9720D1BF387
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 06:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C9D6415F5
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 06:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C9D6415F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2WRfZ1MaAQE6 for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 06:51:35 +0000 (UTC)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A057415F1
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 06:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A057415F1
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7bbec1d1c9dso112120239f.1
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 22:51:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704696694; x=1705301494;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gwI+B7S8LTGfA6ra9o7778mwBLEXwsBVmSG4ugLN38M=;
 b=hGNvg7Js/M7C0NUX0Z8ejdw4onxGez299Ze81b/4+ZcngoUFloNOMUExT0CwzL7Vbx
 AKv+dIm02XSUDjjczBP8P/q+qGfyiobfcCdM4quxnF9VsGZYJqLsIdL98oClRFZBo+GU
 d2kW2uvK4V4PMNRuFoAQWnfra+XUJghkiUIa8GnDRDQodLnVMFVSEZyIo/oUjqdXq1j6
 ghMLcBWBWIVFjLbialEtAfTsQP5Ii+PnTZhe3vxv6jInJN4obp02K92Bm+4aIwit4BHP
 D0cS+BAU/BNAMJkME/ENaJaK/9xi8tkFuv8kwtUW+iRxot8j79CVFdaoKr0ddcuiZnO8
 QTLQ==
X-Gm-Message-State: AOJu0YyHIgXc8ftyQuuP5TbGpp5WA6II7jsBE5PNpNiQ8xFVv8iLkvZG
 cnkp/Zk8EujdJB/w4B7VAJZlIUo0kWTMzw==
X-Google-Smtp-Source: AGHT+IHe8UasQpDgEC+XLQD5ZPj15B7+/F+aZZUGcZK+9kcBME76+59DbOQJLl5T5VW/rGqw+5knvQ==
X-Received: by 2002:a92:cda8:0:b0:360:3c53:e652 with SMTP id
 g8-20020a92cda8000000b003603c53e652mr6324115ild.1.1704696693861; 
 Sun, 07 Jan 2024 22:51:33 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 cq8-20020a056638478800b00466754ca2fesm2037926jab.68.2024.01.07.22.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 22:51:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 23:51:31 -0700
Message-Id: <20240108065131.3452618-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704696694; x=1705301494; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gwI+B7S8LTGfA6ra9o7778mwBLEXwsBVmSG4ugLN38M=;
 b=ZxixDfMvjhD8rjARoqfcqLXmp+jiCWxXt4vDQRZ63F2oNyqGzJPnCZtP/MHQYtc4Uv
 SjjwlUKYTnVmqDwuSz6sWtQ8l5ofiexs41DswmURYWkDMbODmnzNFQA9IUlU00e6GAcz
 wtCX/UV4xjQ4drGvOkNLUEVNpMRh2MLeP4fKqWt6gOHVIT2gGcEqoHjedyNQ2sYMq8RV
 9kq/BV0+RA4LwwpDpVPvd2y2j85SCmv4v7yO4bOGWt54OuYZIhESsUA7LD3Th4wGEBa+
 95+qFdWKzbOvbKisCJIwo6SY8WM/b1gs8FVa/j9fa7wYXa1X7dCtaX0XzzZ/EsfdtDvV
 DyvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZxixDfMv
Subject: [Buildroot] [PATCH 1/1] package/python-apispec: bump to version
 6.3.1
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-apispec/python-apispec.hash | 4 ++--
 package/python-apispec/python-apispec.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-apispec/python-apispec.hash b/package/python-apispec/python-apispec.hash
index f8a2350eaf..9c47a2c1a6 100644
--- a/package/python-apispec/python-apispec.hash
+++ b/package/python-apispec/python-apispec.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/apispec/json
-md5  d6cc7586754cf1c653ffb7ee83955d3a  apispec-6.3.0.tar.gz
-sha256  6cb08d92ce73ff0b3bf46cb2ea5c00d57289b0f279fb0256a3df468182ba5344  apispec-6.3.0.tar.gz
+md5  1aa13f34a226fca977d72f061360e96e  apispec-6.3.1.tar.gz
+sha256  b38e4479916d43f2b1e88ce15fc2fae93adf2e8d55cb59ec74ac66a827941483  apispec-6.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a452afcef750956a8396f7e7a6f913a117d28ef99a13170c29dc74c3b7a95f29  LICENSE
diff --git a/package/python-apispec/python-apispec.mk b/package/python-apispec/python-apispec.mk
index 744fb76810..aee0e16840 100644
--- a/package/python-apispec/python-apispec.mk
+++ b/package/python-apispec/python-apispec.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_APISPEC_VERSION = 6.3.0
+PYTHON_APISPEC_VERSION = 6.3.1
 PYTHON_APISPEC_SOURCE = apispec-$(PYTHON_APISPEC_VERSION).tar.gz
-PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/3f/1e/207c3e61c805eef214d7e5c58106312f9af4733b07f470224e4e309dc65e
+PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/ff/0c/e70aa981d8ebe2e8a500a85c923579ce3363feccd704268e6ff8053875dd
 PYTHON_APISPEC_SETUP_TYPE = setuptools
 PYTHON_APISPEC_LICENSE = MIT
 PYTHON_APISPEC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
