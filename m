Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B1AC35FE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 07:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4645E4028E;
	Sun, 15 Sep 2024 07:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z7PJY9t_Ofbe; Sun, 15 Sep 2024 07:30:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D7A1402C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D7A1402C6;
	Sun, 15 Sep 2024 07:30:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 573771BF282
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52D704028E
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:30:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKp_PYUUr-tp for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 07:30:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 009F7402C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 009F7402C6
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 009F7402C6
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 07:30:35 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3a046d4c465so11667995ab.3
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 00:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726385435; x=1726990235;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IIylBYP8/5HZmOgCGOxE7l1b7Um7QKMagnM4FsZluIg=;
 b=DkLeCvPK7TCgpuNiHrbpQcrDRkpa4vlMVWOckwC/MQ7YjZfP4UaWoG2MCDAyEvE0NU
 KQI4/CckZyxG6a61+oN4AXk0VSZfWHWSV5XqlbvLMP+1zSAa6AVVmUYX0zncGo6aNpmc
 VCzTFAlpCVq1xin5fQ+z3XtKc/qCmXddJ5cpkUz2H1aKl5Fd1xk8I0wV6iPrEW3yYeph
 x8tR3gHLFTsHtgPc1vf8Xk4iCXhiWNBbS5FHooXgZ5Eefwx7yv1Sz+NsMfELlPRbbkxr
 pl9W07KWuaLWEED9+CDhGh6ofHCTQY6jmdOmXQq0TnA3ZfolmXiYCKDve3Ngc/+WvQZL
 3c/Q==
X-Gm-Message-State: AOJu0YwRdY2oh1EdOI4RplmLbdom836UrGFWXDspLn2UW5gbVZQS9hUs
 rBaPFLEjvrhI8uaFjKOZ4T8FYS2OQDZ4shCK4M6pdxiRohETVuxHRitkmA==
X-Google-Smtp-Source: AGHT+IHJj75lz47mcSa+ulZUnA7bkIXEvra/oIFTHPGTkjFU72qI8V7LHDQNd92OZt6bZRcPCw0BeQ==
X-Received: by 2002:a05:6e02:1a4d:b0:39b:3e01:cbd4 with SMTP id
 e9e14a558f8ab-3a0848fb071mr94805225ab.14.1726385434526; 
 Sun, 15 Sep 2024 00:30:34 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed13bffsm799243173.100.2024.09.15.00.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 00:30:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 01:30:32 -0600
Message-Id: <20240915073032.1548709-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726385435; x=1726990235; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IIylBYP8/5HZmOgCGOxE7l1b7Um7QKMagnM4FsZluIg=;
 b=fuSOjfs/EK4+t9qOBpBgMhGo2QyXmOtUyLnjpY1QTPJV79YSboTmEMrbwQc3XWlZwI
 m4bMicjlmx7ihsZBGKkWMyDVeSzeXxPzVsiyM6CrVS1ZQy1aiyMVGnxb0YhU8spgEFWC
 T7yZSUcnkcu5imWeExuR+YVxRbBGPkWXKMKdLvvPSsGDKVAbF8n2uZns9Gqf3DBMgMsW
 lWwMbi3XGjn0l5LkRIM+uD7FOQryKA4gT2aCtveSSNPsJ+dDyiELrJOxjPr4Lq2b9AJI
 ipDaBJH70/a1pzAEuADbb9kb3XDMBeES2sKCpBysXVijkW8ACv94cYK123z+QKRtL6xQ
 opQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fuSOjfs/
Subject: [Buildroot] [PATCH 1/1] package/python-gpiozero: bump to version
 2.0.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove no longer required python-rpi-gpio runtime dependency.

Remove no longer required python-setuptools runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-gpiozero/Config.in            | 2 --
 package/python-gpiozero/python-gpiozero.hash | 4 ++--
 package/python-gpiozero/python-gpiozero.mk   | 4 ++--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/python-gpiozero/Config.in b/package/python-gpiozero/Config.in
index 93e5de3e55..c5f3880ea9 100644
--- a/package/python-gpiozero/Config.in
+++ b/package/python-gpiozero/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_PYTHON_GPIOZERO
 	bool "python-gpiozero"
 	depends on BR2_arm
 	select BR2_PACKAGE_PYTHON_COLORZERO # runtime
-	select BR2_PACKAGE_PYTHON_RPI_GPIO # runtime
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	help
 	  A simple interface to GPIO devices with Raspberry Pi.
 
diff --git a/package/python-gpiozero/python-gpiozero.hash b/package/python-gpiozero/python-gpiozero.hash
index d019b54346..e9266886f0 100644
--- a/package/python-gpiozero/python-gpiozero.hash
+++ b/package/python-gpiozero/python-gpiozero.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gpiozero/json
-md5  b8b63443961de2710d88b82671ec6d8a  gpiozero-2.0.tar.gz
-sha256  403bcc9e7f24f0877653e7fced91ba51508d5197c9d1f80e383fe6693b9c3c27  gpiozero-2.0.tar.gz
+md5  ed36bee070df2a8788c2038d585146db  gpiozero-2.0.1.tar.gz
+sha256  d4ea1952689ec7e331f9d4ebc9adb15f1d01c2c9dcfabb72e752c9869ab7e97e  gpiozero-2.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b6fdd587f3dc3a9b8cc5adae00918e3ffa909b1092bd4decf7e8b1b08fa5d0fb  LICENSE.rst
diff --git a/package/python-gpiozero/python-gpiozero.mk b/package/python-gpiozero/python-gpiozero.mk
index bce7644a34..cc06abc118 100644
--- a/package/python-gpiozero/python-gpiozero.mk
+++ b/package/python-gpiozero/python-gpiozero.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GPIOZERO_VERSION = 2.0
+PYTHON_GPIOZERO_VERSION = 2.0.1
 PYTHON_GPIOZERO_SOURCE = gpiozero-$(PYTHON_GPIOZERO_VERSION).tar.gz
-PYTHON_GPIOZERO_SITE = https://files.pythonhosted.org/packages/b3/a7/85676e0689114ea08ea3c88b7813efd988a9ead64dc9e1b24545b17af4fd
+PYTHON_GPIOZERO_SITE = https://files.pythonhosted.org/packages/e4/47/334b8db8a981eca9a0fb1e7e48e1997a5eaa8f40bb31c504299dcca0e6ff
 PYTHON_GPIOZERO_LICENSE = BSD-3-Clause
 PYTHON_GPIOZERO_LICENSE_FILES = LICENSE.rst
 PYTHON_GPIOZERO_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
