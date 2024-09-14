Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEE9C021BE
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 22:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 061A2405E9;
	Sat, 14 Sep 2024 22:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27CxFQzzZCAF; Sat, 14 Sep 2024 22:35:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C341840619
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C341840619;
	Sat, 14 Sep 2024 22:35:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E58CC1BF3DB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0B794018E
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9CRSjfduaWt7 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 22:35:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9DA9040130
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DA9040130
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DA9040130
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:35:05 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-82ce603d8b5so137651439f.0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726353304; x=1726958104;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rG6jYP7kpkep9Ol8M5AQlTqgzc4yosXkIxcJVLZpWYo=;
 b=rw5tYWnKmW2UIHocX6MiEwFWxWX07c6RGz/lzkXxU7NWqwp9EfHpANchxO5EqTOyQR
 7WsIb33JUaySghnbTZYX1WDIeuLUjgXumMcSg5YieyXiHLsEKEsyA8IiaKUfg7akxoAI
 rFsbHSXMh4FG2tU4EwjfgHU4jmAM0p/OoXYzA1JAQAHYNoQEOpDU5qD4/7wl7W03ZgvK
 KEIbghAnBiZiWeHOwMCQe2JNIn7oIunYGzs7m041RTvrmWMnKWMdQ9gZgC7CN4TqDx8r
 kDMySLC9k0ehROWvuUQBJBeR0T+5zzLEZeOH5VSHK6WK4So2cbPF2sLZQxLSKqJGskbM
 Zn6g==
X-Gm-Message-State: AOJu0Yy07ezFETSJ3zPz6XIagoI422xZhdos4bNJe1UdhzHsP9iNcgzM
 eHCL6J6kbq4mRWXO9nY0ooMVTzduL2tH61129L5HC5uwSm+dRcvGFe6PyQ==
X-Google-Smtp-Source: AGHT+IHGBTb39vtgmXG+xN6B4MS3dpE43El34nc4KbTGWsupIkv6GGcEXN+UwBy6/vq9NSOCf8xg7g==
X-Received: by 2002:a05:6602:6207:b0:82a:2143:8 with SMTP id
 ca18e2360f4ac-82d1f93f807mr1340573739f.10.1726353304200; 
 Sat, 14 Sep 2024 15:35:04 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d492694a5sm60876339f.11.2024.09.14.15.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 15:35:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 16:35:02 -0600
Message-Id: <20240914223502.1352651-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726353304; x=1726958104; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rG6jYP7kpkep9Ol8M5AQlTqgzc4yosXkIxcJVLZpWYo=;
 b=F9zegRzPa8Xggq4kz/6W+mVPi9GptYdbFdMy0N8YzxLVcF7ILjzqSU96tefI4FywY9
 6zcShGElItX4lIvEJhr8KZDR2q6xDXISjZW84byr1CSZaqwgO3j5KLmATcXdEKl3NCfF
 6gGq+4wPoMjLHwGms6A6YFpV9Cj0642BLGc3fnnZ8+WP/0VcxDBv6UHGJV6u0DUz6dCR
 SfL9TpXSmPfkZoJmCimR6F2iFT1PUELZIuOxhLjoTJRfdpPNzQVq5fc2pYBk4/ANCt/v
 B0/6seeXKaslFrrKYaKmuxHQQj6n9Gz6iJT1T01U3W5CoAupKicVCaGBN9ebIgeSPuXN
 v6HA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=F9zegRzP
Subject: [Buildroot] [PATCH 1/1] package/python-bluezero: bump to version
 0.9.0
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
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bluezero/python-bluezero.hash | 4 ++--
 package/python-bluezero/python-bluezero.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bluezero/python-bluezero.hash b/package/python-bluezero/python-bluezero.hash
index e9ccb9133e..150a384223 100644
--- a/package/python-bluezero/python-bluezero.hash
+++ b/package/python-bluezero/python-bluezero.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bluezero/json
-md5  5c256c89c3973cfd20f340f095525af2  bluezero-0.8.0.tar.gz
-sha256  9bd6706ff6b941c3bedd5b64e0447051120ae8eeac458fb65f56cc6730e1e598  bluezero-0.8.0.tar.gz
+md5  8bace06486618fceca632aedc2733027  bluezero-0.9.0.tar.gz
+sha256  2512935e094e3afd21ca9d4cb1b9aaa88a524e9538ae81305b2086f09f0eee17  bluezero-0.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  59319e80b4caa94ace4817c9f84aa16abc9d4d2b5f7866251b5fda92e87ccdef  LICENSE
diff --git a/package/python-bluezero/python-bluezero.mk b/package/python-bluezero/python-bluezero.mk
index 8e078f1073..81e7363fc7 100644
--- a/package/python-bluezero/python-bluezero.mk
+++ b/package/python-bluezero/python-bluezero.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLUEZERO_VERSION = 0.8.0
+PYTHON_BLUEZERO_VERSION = 0.9.0
 PYTHON_BLUEZERO_SOURCE = bluezero-$(PYTHON_BLUEZERO_VERSION).tar.gz
-PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/67/e1/15fc417b9828d38aa8e09ba06df61d6889740fe45867510a781df9a8ba35
+PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/7b/9c/bfb3e1f92dd39bf3de8fc483a102bfae763fbf156177b77ed96b8a38bbb1
 PYTHON_BLUEZERO_SETUP_TYPE = setuptools
 PYTHON_BLUEZERO_LICENSE = MIT
 PYTHON_BLUEZERO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
