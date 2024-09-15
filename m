Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC03C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 05:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED16540471;
	Sun, 15 Sep 2024 05:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgcCe_KhrvTM; Sun, 15 Sep 2024 05:33:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C76C340225
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C76C340225;
	Sun, 15 Sep 2024 05:33:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 96D661BF293
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 05:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 858B74042A
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 05:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n3-KBEe7qRIV for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 05:33:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 25C5A401FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25C5A401FE
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25C5A401FE
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 05:33:27 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-82a238e0a9cso78860239f.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726378406; x=1726983206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a/0bU6Z5MubSA6yawvjPDv4vditrqjDk0PuHCuwEVG8=;
 b=trJk3T5uMO919VcONH+6qeBlKXB25MRtsVTCevCMxrPPz0TmQbUdYO5qKyxBypWG2w
 BT+sbFvhgr2WLWvAO1H1zEZr3qczwKciTJv1o7AHt+FIKnEPQnGxmE/LyvnK7vMZPHA5
 N8xZcrtpnMDqL3NTrpD82E++9VWkTrkYXc2z5ahF66R4eWv0ks5A7OQ49s0H9djZWY1t
 i2zRx9SY9X3z1qPFHoMfwdIDwr9y+vYae3t5nEZD4NkAyX7dFFxozUWqRX6VhN6u2Smv
 79KbFTL6rsYIh+AvpStrUDbr5o0csbVXrBJ/eRbAWSc4teU7YOS1cObeCP1eisGY4WZb
 8B4g==
X-Gm-Message-State: AOJu0YxID7QJk2mrmptvOfu/NtiT5uBkcUFBWhElP8djbipNnl5fnpfT
 8SNyPm20qK008NJhg5IqOMd37WmHAODPvs9e86Vezsj1EkLCbaQcBxFjrw==
X-Google-Smtp-Source: AGHT+IFbUUcZltLyKaVtnLNgwCESaj6Ko63nBdNyOzDHXBqIsYICUBx6Q3J7HPseRlCKlkVNYDMxeQ==
X-Received: by 2002:a05:6602:29d4:b0:82a:34da:72f7 with SMTP id
 ca18e2360f4ac-82d37858b53mr942373939f.16.1726378405836; 
 Sat, 14 Sep 2024 22:33:25 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d49269955sm79396039f.8.2024.09.14.22.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 22:33:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 23:33:20 -0600
Message-Id: <20240915053320.1418783-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240915053320.1418783-1-james.hilliard1@gmail.com>
References: <20240915053320.1418783-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726378406; x=1726983206; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a/0bU6Z5MubSA6yawvjPDv4vditrqjDk0PuHCuwEVG8=;
 b=jP6Oo74jPOTIHD+F0AIhi7/hxlQaC0rl3W14XHfXDuPNHPyWY8YSFLqGEl6//G6/DI
 WInC4l3Y2XLzfJxO7VmK+pda/FlB6xpXfVXFJAtYYKBk1Zb/HPJwSYb5NT/s3xCJTpyw
 dcqMlPzYX/8zqrDlm6MaSEziuUw2dTZVDk0WJ4snnvDLt80BoTad0M7kZVXGj2jw87pr
 AI/SW74UewGP8Dy5Zwj9NvbGoreoDsAYREhSTjVIWf7Le4mILiw70YrQ5ljoRsj/3npG
 8fANGYT5uHKvQpeyVm7EDt03TOhr/Xb6hAbze5KkLbTjYL42HjWYc8wFz4uWYP2usbmP
 dY4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jP6Oo74j
Subject: [Buildroot] [PATCH 2/2] package/python-engineio: bump to version
 4.9.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-simple-websocket runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-engineio/Config.in            | 1 +
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 5 +++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/Config.in b/package/python-engineio/Config.in
index b42b609e0d..9b9849ac48 100644
--- a/package/python-engineio/Config.in
+++ b/package/python-engineio/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_ENGINEIO
 	bool "python-engineio"
+	select BR2_PACKAGE_PYTHON_SIMPLE_WEBSOCKET # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB
 	help
 	  Engine.IO server.
diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index c1b02350bc..61c0dfe47f 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5  619e7fce0257a8219187f50aa94844a3  python-engineio-4.8.2.tar.gz
-sha256  f8609e3afdda318fdc336b4ba2de8dd397bb8f9b8a1b43e56c27330e32c2e34c  python-engineio-4.8.2.tar.gz
+md5  3d1aa3e72ff50c1d779f6a6f543a438a  python_engineio-4.9.1.tar.gz
+sha256  7631cf5563086076611e494c643b3fa93dd3a854634b5488be0bba0ef9b99709  python_engineio-4.9.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index 67092402b4..d291364705 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 4.8.2
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/e2/24/4a69dd119d10e31c4439f910a2a0f71b540b9f835ab60efa1f0f7bcae0c7
+PYTHON_ENGINEIO_VERSION = 4.9.1
+PYTHON_ENGINEIO_SOURCE = python_engineio-$(PYTHON_ENGINEIO_VERSION).tar.gz
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/50/01/94faf505820f1fb94133a456dad87a76df589f6999de563229a342e412fa
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
