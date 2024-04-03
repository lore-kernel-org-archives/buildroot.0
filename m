Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDC5CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 08:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D19841689;
	Wed,  3 Apr 2024 08:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mRk-cOeNOz6d; Wed,  3 Apr 2024 08:43:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 944D54168E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 944D54168E;
	Wed,  3 Apr 2024 08:43:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4025C1BF44A
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D16B82027
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQ_ikntOg9j5 for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 08:43:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2CCE382023
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CCE382023
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CCE382023
 for <buildroot@busybox.net>; Wed,  3 Apr 2024 08:43:22 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-56dcf805aa1so2990874a12.1
 for <buildroot@busybox.net>; Wed, 03 Apr 2024 01:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712133801; x=1712738601;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GIlafYDrKp7KUGSVT9dFF2CojRxmyE5fu2UggmQJQMk=;
 b=DN9LLbtR+lik/h3q13H5X/Aya+pECGHgTNvcZAiaGiBeftzt4enPq42po8YWWGC/HJ
 nIaAZcpzaYAlOCY5gTwKMmeuys3UrP2KElbd6ad1uCEm6v6qi97xDX9/6GScnTaVQojh
 kxNaA5GRCaSQF71OzJOatyb1nexx4+dZI57+Q3nX1QiGhx9sGDUbuewr5VzmsDVPc4jW
 oD62TJ8ORR5oh7BjO5anFHza8rJOedBm04/9QhnIQc0LSeiGfepvrdOiz2yuaC+7jG5g
 JNQDNijv/PgTt/7EwZIqYZcuVHXPpHnzQc1jhgGFR2esTJl81JKFjV8YAbneWx2YH/oP
 dTLA==
X-Gm-Message-State: AOJu0YyUtDn8ptkcSGvVzUBS0VgZqx+u5ZLBy0eI8u8/DdS6ag+1FnQL
 o11HQmwSxAgLqXQT6YiYNWIBLPl9AB5n5X/jhn364u1diee/L5aAkEVCmAPQ4hBieZry84JAoyI
 =
X-Google-Smtp-Source: AGHT+IE2m+FG8yb2nTqfnutLNxPiJY9lKkm35l4aef38AIs4uUBGAW0jZ442yXS+CDn7QQuwoWsHEQ==
X-Received: by 2002:a05:6402:5190:b0:568:9ba8:8f1a with SMTP id
 q16-20020a056402519000b005689ba88f1amr11712739edd.7.1712133800742; 
 Wed, 03 Apr 2024 01:43:20 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 fd6-20020a056402388600b0056c53ea5affsm7487296edb.77.2024.04.03.01.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 01:43:20 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  3 Apr 2024 10:43:16 +0200
Message-Id: <20240403084316.512333-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1712133801; x=1712738601; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GIlafYDrKp7KUGSVT9dFF2CojRxmyE5fu2UggmQJQMk=;
 b=atisooKOg+3u4/q7IPgE5g4M0JNloielBLm77JBt2+cWxnZ6mrrIZos93K+i9rPtvq
 vjy2uxg7pmVLCYVmntdDDVvzoHBir3H5wZs8zc9f+ZpisMA1JYGLuK107ZGI0eTeNoCj
 Giug9StTWN5vU1e9YixlqTz2R3H8tJ34XWD79wRVodW6pY7JV7sI8BrtCqJpJAQINhk5
 iBxu/XLPuUUn2CWIx1kNy26GQ75slTcHulXiUax7t7m8ldLw40vYSsYry5mJtNt9o6l5
 ji7b5W+RIzkRdHact4wwIonKONx4gUAu8+sB1r5w55gzwtiVnLlKrDNW7CfUdqo9PYTF
 MxSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=atisooKO
Subject: [Buildroot] [PATCH] package/libtommath: bump to version 1.3.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libtommath/Config.in       | 2 +-
 package/libtommath/libtommath.hash | 2 +-
 package/libtommath/libtommath.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libtommath/Config.in b/package/libtommath/Config.in
index b2ffc722a..7447fb9eb 100644
--- a/package/libtommath/Config.in
+++ b/package/libtommath/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBTOMMATH
 	  LibTomMath is a free open source portable number theoretic
 	  multiple-precision integer library written entirely in C.
 
-	  http://www.libtom.net
+	  https://www.libtom.net
diff --git a/package/libtommath/libtommath.hash b/package/libtommath/libtommath.hash
index 4f5dd4023..4ce6057e0 100644
--- a/package/libtommath/libtommath.hash
+++ b/package/libtommath/libtommath.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  986025d7b374276fee2e30e99f3649e4ac0db8a02257a37ee10eae72abed0d1f  ltm-1.2.1.tar.xz
+sha256  296272d93435991308eb73607600c034b558807a07e829e751142e65ccfa9d08  ltm-1.3.0.tar.xz
 
 # Hashes for license files:
 sha256  2fa64b163659f41965c9815882a8296d3d03ff546b76153e11445f9bdecf955a  LICENSE
diff --git a/package/libtommath/libtommath.mk b/package/libtommath/libtommath.mk
index 7b5305faf..66b258641 100644
--- a/package/libtommath/libtommath.mk
+++ b/package/libtommath/libtommath.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTOMMATH_VERSION = 1.2.1
+LIBTOMMATH_VERSION = 1.3.0
 LIBTOMMATH_SITE = https://github.com/libtom/libtommath/releases/download/v$(LIBTOMMATH_VERSION)
 LIBTOMMATH_SOURCE = ltm-$(LIBTOMMATH_VERSION).tar.xz
 LIBTOMMATH_LICENSE = Unlicense
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
