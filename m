Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AAAC433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 10:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9901040526;
	Mon,  2 May 2022 10:12:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZCnlLltmmhWz; Mon,  2 May 2022 10:12:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A198D404DA;
	Mon,  2 May 2022 10:12:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1102A1BF3CB
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 10:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DCB9404DA
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 10:12:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zMpbAQSW61Ys for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 10:12:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1279E404CA
 for <buildroot@buildroot.org>; Mon,  2 May 2022 10:12:27 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id w4so18935155wrg.12
 for <buildroot@buildroot.org>; Mon, 02 May 2022 03:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UJXE6AY/VivlrlEShH1wCTw4i3gWXvK+/TgaEpQGUDw=;
 b=QzyDP3NpAEEUalUKPGJojf3XPp6qRpwu1GQklEurFzFbvi8qZojcc3fDShGS5LoNmy
 c64jFAwloEh/E6LCCquFOl9TprrPDx/uWRUbVPEl1GwpVp14NMPL/9YGKEj5IUhWq1gO
 w5PzorJ0IVYEL6UdoSO7hy8ZCmyonU7jhYF4wWzUumBdQKj92D+QRswcXOHaHw0yUpu6
 CuZCw+1VlGck2hadiYOH6AUbasrmrL91JjT6EJyVy4da9qBQTfF7OqjttHa484x7W08d
 efZL9iAE29FzDfHIZ9yKwtHdUCZTQ8sDyVf/t2SYxWkWB7GM+iFv6ZdGvILXSIyccQx2
 kVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UJXE6AY/VivlrlEShH1wCTw4i3gWXvK+/TgaEpQGUDw=;
 b=W8JPmGv5KAFZ7xjfvLVHe/DLQg8RUQo/QyMjY5jN2UGDYVHlOPYPTbpRjJ2pkuhqfu
 5g30qne5t9SQlWPxobgfVAlxRFTscMad3g/uEiEjdDB9+6SZ88eC08XIW6Yd7g3TbBnz
 5IcvU9l1klpJISZKeWKbOF7pdZK8Y8ism48KKQs/F2/cQ8acYPLnynVKyrn3NjzCUhpA
 m3VDEvvHDCGeP2QEyHIld6jJVAJhXnCe5rQZ+NLYwXl518ZVIWF91jDuWhgVAZK9SAv1
 0O57vBR2BROj9NUoO4Fr1yQD+3ijUHiyJGSa+GzsM7EzIhZpQHgp4TNKoQK257XqvaaW
 btHQ==
X-Gm-Message-State: AOAM533e7bA+X4Fo38Y7b01I56SEPAuISUEN1+ure8BvnTbM3GaE970X
 QmOB6wyHJTNLZbyYvwj8wgweoVfz5Js=
X-Google-Smtp-Source: ABdhPJyOgKADO9xYj6c9jTaF8fTfZaICTfLI1TI2xt2ofOtoKs3csVlft7lJkLTUhBq4ISAFW5jpWw==
X-Received: by 2002:a5d:434e:0:b0:207:a48e:a99a with SMTP id
 u14-20020a5d434e000000b00207a48ea99amr8797835wrr.250.1651486346046; 
 Mon, 02 May 2022 03:12:26 -0700 (PDT)
Received: from smartron.home ([2a02:a03f:63d3:7700:47c:f3ae:fe47:54e6])
 by smtp.gmail.com with ESMTPSA id
 22-20020a05600c021600b003942a244eddsm7297685wmi.34.2022.05.02.03.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 03:12:25 -0700 (PDT)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 May 2022 12:12:08 +0200
Message-Id: <20220502101208.1576497-1-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/redis: bump to v7.0.0
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From the release notes:
(See https://github.com/redis/redis/blob/7.0.0/00-RELEASENOTES)

Introduction to the Redis 7.0 release
=====================================

Redis 7.0 includes several new user-facing features, significant performance
optimizations, and many other improvements. It also includes changes that
potentially break backwards compatibility with older versions. We urge users to
review the release notes carefully before upgrading.

In particular, users should be aware of the following changes:

1. Redis 7 stores AOF as multiple files in a folder; see Multi-Part AOF below.
2. Redis 7 uses a new version 10 format for RDB files, which is incompatible
   with older versions.
3. Redis 7 converts ziplist encoded keys to listpacks on the fly when loading
   an older RDB format. Conversion applies to loading a file from disk or
   replicating from a Redis master and will slightly increase loading time.

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 74a9392a63..582c3afa03 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  5b2b8b7a50111ef395bf1c1d5be11e6e167ac018125055daa8b5c2317ae131ab  redis-6.2.6.tar.gz
+sha256  284d8bd1fd85d6a55a05ee4e7c31c31977ad56cbf344ed83790beeb148baa720  redis-7.0.0.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index f3c030d68c..3b91fbf8c8 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 6.2.6
+REDIS_VERSION = 7.0.0
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
