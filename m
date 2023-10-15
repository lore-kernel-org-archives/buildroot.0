Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215E5CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 11:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ACB681A18;
	Sun, 15 Oct 2023 11:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ACB681A18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dSfbm3DsU-5d; Sun, 15 Oct 2023 11:41:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91B0F819F8;
	Sun, 15 Oct 2023 11:41:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91B0F819F8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D5D9E1BF29C
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 11:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AECA1819F8
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 11:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AECA1819F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uv-VqcXzlzUr for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 11:41:43 +0000 (UTC)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9100F818DC
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 11:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9100F818DC
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5384975e34cso6384434a12.0
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 04:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697370101; x=1697974901;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/BrfOpYLtZa0Fy9J3dNR4eK8SDyM1+RtzJT3t+vpQeI=;
 b=As0we+Ut27aBqLNozBuD05fZLGEtXXXHpEh6+RoAzI1+dD58tWy9RO1FW+ScIvhEHP
 JbQ/ukig9wDtRvOlWMBaejG6jI+UqBHpeXzKBbLHB0UNL//4BhU+yPAqXUZ+1u/x7jFf
 7I+FPIxlLpYQHi76EGBJZyhQ7f0i2qdV4RPnnhGDr0glNC+JpmFTdkH+KaK0MBLvsDg6
 5QAip2MOs28sCHX4+wGPL0pRDnHXmfUCIDpa7AaEv0bT3EuJg4/o9Aj9qYL2QNbbj7mu
 9t+JA1i4QUgX2T16W+HMTWYut3vkDjtii5Sen7Q2KMx814BeOoL9Owsm+i5i5GAHDHDh
 3YJg==
X-Gm-Message-State: AOJu0YwkmRM5QNzXBDTe/Gxl9Wid8UlJfWkXdGCw3ZfN0BrcKlcYvT/h
 D/iDDxKh6PNjnyQ7LqDkdAMLE+7nJgU=
X-Google-Smtp-Source: AGHT+IFKWyc35NN6TA6ReMcQGaqE4fcoXyCbGhFZVVGF4SdcHvESs4vxKGtKwobyafq5aCtxnn7C1g==
X-Received: by 2002:a17:907:608d:b0:9bd:d7bd:1a52 with SMTP id
 ht13-20020a170907608d00b009bdd7bd1a52mr6032674ejc.20.1697370101175; 
 Sun, 15 Oct 2023 04:41:41 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:63d3:7700:b737:23f:c590:d252])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a170906714a00b00997c1d125fasm2191165ejj.170.2023.10.15.04.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Oct 2023 04:41:40 -0700 (PDT)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 13:41:27 +0200
Message-ID: <20231015114127.227700-1-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697370101; x=1697974901; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/BrfOpYLtZa0Fy9J3dNR4eK8SDyM1+RtzJT3t+vpQeI=;
 b=UlToLToLx3E+y5Wvv7EBP7wyk2a2byM7HXRBoM5++q7JCsexTz61Zp+CBcmSa0VrWZ
 th0ruvZiEHc7uCC3rJjYXfeeIuRvljajV8va69dsjK+q+ch0nuXe4iYIYdIqT2chHER0
 P0iTIJXzWGleJck0bchud/Lyi4OgI0YoyUUTd/dy2rjNeyfH6UAjc89CnoHRJCI2vH4B
 toylX21MvO1I6eRmhb/vCRZ8EYgi0TrCsUrBfI+gwrtu5KiWYtWLFuKg+AjB7UKzWYHh
 B9hEMkmOGDW3F8IFzs/M5iGNQThrLl/GkSSWj8R5a9SynsFnT37DSzrETudiL06dju9H
 VJcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UlToLToL
Subject: [Buildroot] [PATCH 1/1] package/redis: bump to v7.2.1
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

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/redis/0001-uclibc.patch | 8 +++++---
 package/redis/redis.hash        | 2 +-
 package/redis/redis.mk          | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/redis/0001-uclibc.patch b/package/redis/0001-uclibc.patch
index 197f43e7a7..6761f9f3fe 100644
--- a/package/redis/0001-uclibc.patch
+++ b/package/redis/0001-uclibc.patch
@@ -12,17 +12,19 @@ Signed-off-by: Martin Bark <martin@barkynet.com>
 Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
 [Fabrice: update for 6.0.9]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Titouan: adapt to 7.2.1]
+Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
 
 =========================================================================
 diff -ur old/src/config.h new/src/config.h
 --- old/src/config.h	2012-10-26 07:20:24.000000000 -0700
 +++ new/src/config.h	2012-10-31 13:41:51.206309564 -0700
-@@ -62,7 +62,7 @@
+@@ -71,7 +71,7 @@
  #endif
  
  /* Test for backtrace() */
 -#if defined(__APPLE__) || (defined(__linux__) && defined(__GLIBC__)) || \
 +#if defined(__APPLE__) || (defined(__linux__) && defined(__GLIBC__) && !defined(__UCLIBC__)) || \
-     defined(__FreeBSD__) || ((defined(__OpenBSD__) || defined(__NetBSD__)) && defined(USE_BACKTRACE))\
-  || defined(__DragonFly__)
+     defined(__FreeBSD__) || ((defined(__OpenBSD__) || defined(__NetBSD__) || defined(__sun)) && defined(USE_BACKTRACE))\
+  || defined(__DragonFly__) || (defined(__UCLIBC__) && defined(__UCLIBC_HAS_BACKTRACE__))
  #define HAVE_BACKTRACE 1
diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 69bfc1475f..b73df17790 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  ce250d1fba042c613de38a15d40889b78f7cb6d5461a27e35017ba39b07221e3  redis-7.0.11.tar.gz
+sha256  5c76d990a1b1c5f949bcd1eed90d0c8a4f70369bdbdcb40288c561ddf88967a4  redis-7.2.1.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index e5d3de8eb9..04f4697e7d 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.0.11
+REDIS_VERSION = 7.2.1
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
