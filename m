Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E416CF3963
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 18:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E11E042418;
	Thu, 19 Sep 2024 18:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CgK1qxWOwj57; Thu, 19 Sep 2024 18:15:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 899634255E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 899634255E;
	Thu, 19 Sep 2024 18:15:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 84B7B1BF31C
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 18:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73E0061622
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 18:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bR6zOl5hxPNQ for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 18:15:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 712AC61600
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 712AC61600
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 712AC61600
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 18:15:48 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-82d07f32eeaso65480639f.2
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 11:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726769747; x=1727374547;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7DvWK7mqoNIU5Bdaw6PmhY0LxadFVy4qhHdDBqcHFug=;
 b=pcDOjMNtUXGOtQ/2B39O99ultxGAaPmUf2f0jA7NQW5gqmTvu6kawxBM2jeBZ6NK2+
 5iyTkfag1P+hX5IAtfPDihOhIaXjM5EI+/1nxrOeCu13gwxNbEOKHtbsTVXD4j70YOVW
 yhenhZwcpTtAdeMV+RAmO4EmzlKmRQue8iGsFAuzF2EEdvdwZdPRQs5Ik/gR6QhHVE3C
 8ZPaL6QfaznZp/S4dV0lhGFKiky4o8WNjbPvM271iK2JcTyW04mYgfPMIKsurnnQUKSZ
 vamYeYG3CSNqBDSb/1ripeQB6waxlNE4sIYrNFznO/oRbHNqyS54lGMDF1uwskcHeMWc
 Mz9Q==
X-Gm-Message-State: AOJu0YyJTYUrDdZnyZJZyfTjwsxn2enAXlZxZZEzuNKops9+ZG1nFFdX
 H5YsPqSbpS02Bo4mejFCBF3WDbSPfCYe5F4wk1fODFianCy0n1ApnImXhQ==
X-Google-Smtp-Source: AGHT+IERa0azU8UHv1tfLxQUnkmJqwmVXl0Z8zKEzsIgbuTaljBgnHunUUz+ukNUgPYcX3MMtlhRVg==
X-Received: by 2002:a05:6602:6302:b0:831:fbd3:88d3 with SMTP id
 ca18e2360f4ac-83209ce0ad9mr54529139f.2.1726769747005; 
 Thu, 19 Sep 2024 11:15:47 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ebf455esm3120907173.32.2024.09.19.11.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 11:15:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 12:15:45 -0600
Message-Id: <20240919181545.628348-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726769747; x=1727374547; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7DvWK7mqoNIU5Bdaw6PmhY0LxadFVy4qhHdDBqcHFug=;
 b=aYpqPFmlQ78V0sUezGGlaFFVq8U6HkPxwEq1tllrgr7kTPubga4BSEvUoZ9Liihjt0
 X61i7Dkfa51gGuk6PYmB0vqyA9ET2C6otlMg4VX+IjfIy529TgFyXsrpBGBJlrtPBv3B
 EBzuTzKdvYc/kkJ9n7XqmBWXh+6O9gVqF+LwRKYEwe5TA9ll5RXdUSHI5E3NZ/33XzAk
 TESKwHpRh2l9lTr+JvfjTdZGzKgXUgB+uYTFvkV9ap1b8eOtIcZh+JSaCY6mNWVd7d7n
 ebiB+u6P/PZzQthXm4+N59W6tvJ3jyWr2XPRSKqMqgL9zm/go5Qgt8U1Lcq38MCP+FsQ
 p6Sw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aYpqPFml
Subject: [Buildroot] [PATCH 1/1] package/python-redis: bump to version 5.0.8
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
 package/python-redis/python-redis.hash | 4 ++--
 package/python-redis/python-redis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
index 2d9df87a10..0f53479790 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5  f4bff9e3819ec832bb789b8b58363d6b  redis-5.0.1.tar.gz
-sha256  0dab495cd5753069d3bc650a0dde8a8f9edde16fc5691b689a566eda58100d0f  redis-5.0.1.tar.gz
+md5  e5de12682a1bd96e36a58137db72ee37  redis-5.0.8.tar.gz
+sha256  0c5b10d387568dfe0698c6fad6615750c24170e548ca2deac10c649d463e9870  redis-5.0.8.tar.gz
 # Locally computed sha256 checksums
 sha256  a57b250a5bf03d7afe55b74063313f2adb7b00d546c0ab149a89398333fe3cc8  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index 067a754352..6fbfe5feec 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 5.0.1
+PYTHON_REDIS_VERSION = 5.0.8
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/4a/4c/3c3b766f4ecbb3f0bec91ef342ee98d179e040c25b6ecc99e510c2570f2a
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/48/10/defc227d65ea9c2ff5244645870859865cba34da7373477c8376629746ec
 PYTHON_REDIS_SETUP_TYPE = setuptools
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
