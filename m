Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F08C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 04:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA8B7613EF;
	Thu, 11 Jan 2024 04:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA8B7613EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MOK_OC-e0Fpy; Thu, 11 Jan 2024 04:54:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32CD8613D7;
	Thu, 11 Jan 2024 04:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32CD8613D7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E18F1BF8B4
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 04:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D762D41BAA
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 04:54:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D762D41BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K7w-3cG0qzFp for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 04:54:08 +0000 (UTC)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FDDA418FD
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 04:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FDDA418FD
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-36071910050so21767315ab.1
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704948847; x=1705553647;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WRRM+Ei1x0gIxgHbQcLVb63EM+3OIZsvky7Xg4k2+Qo=;
 b=qhta2ganrjgUT1/KbeGtFz2XOsoZWYcT7KgvZI33mKLKsUvCIrkJ9A3RZsOzjUSN78
 UvE/6h4/uz4ewFUh1rYQtLYwq1NW5J2w+/GbGBDBFvO1nstwPnlFyyYlQQKRti4y+oMH
 O7Xd2GUjp4QUV3Te1ger9qPF+0ExoiIkI2G7VMUEe1VTGKGQqUlHdwWKZj3BE1LC8uw/
 LJfMXPElaPN3iTKTCDKp9WB2Og2rFXsvPaG9sd18213ClRihcHMpqZRmJA77JUDBDKwv
 PqUMxlgaRhPy0cPnNdgNXhxh94mGQMbFazGhx9P+u7DF2WAKPB/PN/QzJ5gx44dopY07
 +hug==
X-Gm-Message-State: AOJu0YyRKiRN1SHAl6NZyHACY69JBcOPr/UZUi6fTd8L9Gd9Ku2x0auV
 u2FsvC1vR1EIh6u0MCszd9ZeR0V3QcLkpw==
X-Google-Smtp-Source: AGHT+IHiEvf7DnDfRgRX8YttZnIzoxJ7OTWw9whG9IQ22nrqHRYyxFKPvwx8Bwk/H/e2oC7cHCH0VA==
X-Received: by 2002:a05:6e02:118f:b0:360:7f8c:1efb with SMTP id
 y15-20020a056e02118f00b003607f8c1efbmr529114ili.64.1704948847231; 
 Wed, 10 Jan 2024 20:54:07 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 bv26-20020a056638449a00b0046dcd4d4229sm100818jab.125.2024.01.10.20.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 20:54:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:54:05 -0700
Message-Id: <20240111045405.2894223-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704948847; x=1705553647; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WRRM+Ei1x0gIxgHbQcLVb63EM+3OIZsvky7Xg4k2+Qo=;
 b=LXqlETkFiGogKltBHzFyYY6Z3rXq1vibKmt2UVipQfqLBPFf8u37KmVa13pSGSGJyr
 LUSCuQirIea4VlNFaMOKexrfInmYSlnsHpXd7hxLiy51I9uLoJl6xeuVdN0NVcARD5Np
 Ma2tmhoEnQDvkf+5S7/ZKAa6GxBXdHtfZYaxZLqTTDR/6yOv8eqlGp8Ai1jcz16UcBqY
 F0xqYcfckqVRi65Rqbxzjs0zri+Ur2puF8zSoXQvT9/fX+R/vCZly5A/8F2kaOEi6aOD
 PiBsTCyNFNf011NbHNTYX4FNtl+cqkH4UQeMEi9jADHH6n3JzBS82clYp/z9pj74NFsM
 fHmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LXqlETkF
Subject: [Buildroot] [PATCH 1/1] package/python-redis: bump to version 5.0.1
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

License hash changed due to year update:
https://github.com/redis/redis-py/commit/28cc65c18cc4fb37ef14497c963eb181dba8d25d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-redis/Config.in         | 4 ++--
 package/python-redis/python-redis.hash | 6 +++---
 package/python-redis/python-redis.mk   | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-redis/Config.in b/package/python-redis/Config.in
index 4143e1f1c1..e22959cf7b 100644
--- a/package/python-redis/Config.in
+++ b/package/python-redis/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_REDIS
 	bool "python-redis"
 	help
-	  Python client for Redis key-value store.
+	  Python client for Redis database and key-value store.
 
-	  https://github.com/andymccurdy/redis-py
+	  https://github.com/redis/redis-py
diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
index e27f87bd50..2d9df87a10 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5  ad365234df634680d15294ddc87c42de  redis-4.5.5.tar.gz
-sha256  dc87a0bdef6c8bfe1ef1e1c40be7034390c2ae02d92dcd0c7ca1729443899880  redis-4.5.5.tar.gz
+md5  f4bff9e3819ec832bb789b8b58363d6b  redis-5.0.1.tar.gz
+sha256  0dab495cd5753069d3bc650a0dde8a8f9edde16fc5691b689a566eda58100d0f  redis-5.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256  7801a39e3a1aec58a7ea7c9f4dc1238cf0922c36a1fc8eff0bb7d684ff6dd354  LICENSE
+sha256  a57b250a5bf03d7afe55b74063313f2adb7b00d546c0ab149a89398333fe3cc8  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index 186702dc83..067a754352 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 4.5.5
+PYTHON_REDIS_VERSION = 5.0.1
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/53/30/128c5599bc3fa61488866be0228326b3e486be34480126f70e572043adf8
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/4a/4c/3c3b766f4ecbb3f0bec91ef342ee98d179e040c25b6ecc99e510c2570f2a
 PYTHON_REDIS_SETUP_TYPE = setuptools
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
