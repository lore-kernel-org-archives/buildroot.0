Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC48C433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 07:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70822401BD;
	Wed,  2 Feb 2022 07:33:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m-IpFQXoY4Jq; Wed,  2 Feb 2022 07:33:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CD1B402BB;
	Wed,  2 Feb 2022 07:33:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 335911BF859
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 07:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21F7C81A6A
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 07:33:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kVVndiS8x3tf for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 07:33:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECFC281A1C
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 07:33:46 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id e2so36631974wra.2
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 23:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j+ijgtZ9m/YMqDWBjuJZyfrsTBUEf0gO4lLa7QwL1VM=;
 b=X5r84/gCLgoIDTXN/KoDTVqquJXuSKxkOjZFPzUrQO3SWxhBTWusN8LcY5etJrbKrH
 HoZklmYjZ2gwVGulOoWR6kYi3tXxcOmsrgL1mXE12sVqKA/ExunjGBA9eM3CXFcBWf+g
 jEar6ogOo6YXJwBhDViOw7qpWkASEs4AfoV8vWcjB69CHXCSRdU5bqdG/NGoJWuV93LY
 MYFPu9aghLBWHTx3kt4k1fcXk5x9qMGB5i/Otlff/dbfAuldMfpllH3doKvGEJpbaXld
 zjzyRmi0azsGUTyZk5hXj6LiMXFoCION9KP2kHKMsAX4snLkBAlvOZXAs6glTJI7NN8d
 6Ozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j+ijgtZ9m/YMqDWBjuJZyfrsTBUEf0gO4lLa7QwL1VM=;
 b=fs4vXC5Qf1O1v49WKgFaRYqwsfrjICfnIypuVlgtD/syELjf8uyVhL81/1epj/ww3I
 qQIy4qLGCfNeFHaCJzmYxj6VbN8y+lWPm8+SaaBc6o/YIUyrPu43ddtuF6ix03Lq7Qa9
 NltKrVEJOS/T1SkYHL5YW7VxtIH4GM95y4uj0fJCjKjqz02BwQNeHY+cqesQTLQSTQCm
 Z+GKB6ABbEijzV4qoNOuWMHQxzeO8NUaIXhFCIbQ4na1lZYe4loo6SBlb+YlzCrSygza
 ESu4TlOBQRm5L8gUujGOnWeZ71oNphWwSuttznEMDsRHGHKPH2ne+kEV4SCnS438cjyv
 84Rw==
X-Gm-Message-State: AOAM533pCcJEov5uFqC2nj2tVGz8nkpASgjCYh6xqeQ7qrwsOSOswKi1
 kcIUhfHxtX2pHJtYHyYp98tcpaqzfIcG9Q==
X-Google-Smtp-Source: ABdhPJyyS2cwLOhFFWE9sPGE9AO/QZaf/igw0nHyB8VXNclx1GD8Q6ORSbT+dL6t0+cT/OH0AVdPkw==
X-Received: by 2002:a5d:47a8:: with SMTP id 8mr23342899wrb.475.1643787224835; 
 Tue, 01 Feb 2022 23:33:44 -0800 (PST)
Received: from asaf.. ([2a10:8002:6b3b:0:5ff1:dc04:a9f7:3898])
 by smtp.gmail.com with ESMTPSA id h6sm4052840wmq.26.2022.02.01.23.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 23:33:44 -0800 (PST)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Feb 2022 09:33:38 +0200
Message-Id: <20220202073338.106855-1-asafka7@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/{libuv,
 uvw}: bump to versions 1.43.0, 2.11.0_libuv_v1.43
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 package/uvw/uvw.hash     | 2 +-
 package/uvw/uvw.mk       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 172ef1f168..1874aa344c 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  371e5419708f6aaeb8656671f89400b92a9bba6443369af1bb70bcd6e4b3c764  libuv-1.42.0.tar.gz
+sha256  9e27825a55279de69a7c43e42d509fd1337c9bece2547c761e91a1592e91cc4d  libuv-1.43.0.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 9fe775951d..ed51fc92f9 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -6,7 +6,7 @@
 
 # When bumping libuv, check if a new version of uvw is available
 # and bump it too.
-LIBUV_VERSION = 1.42.0
+LIBUV_VERSION = 1.43.0
 LIBUV_SITE = $(call github,libuv,libuv,v$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
diff --git a/package/uvw/uvw.hash b/package/uvw/uvw.hash
index 5f7521c8b3..564c0980f3 100644
--- a/package/uvw/uvw.hash
+++ b/package/uvw/uvw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  30b0ba97a94d5e652490c6b1b32c95e608263f21cf3bc606308d09b3e3a114bf  uvw-2.10.0_libuv_v1.42.tar.gz
+sha256  3af4efa2842299490ec764f2148f85f4426dfb4f8d8aa436cc2d049db2b7b514  uvw-2.11.0_libuv_v1.43.tar.gz
 sha256  5de32af2469480cf3261c9781962e0887366666ba8ee1f4a32c386c77fc50c88  LICENSE
diff --git a/package/uvw/uvw.mk b/package/uvw/uvw.mk
index 9c15d536cb..161c40849d 100644
--- a/package/uvw/uvw.mk
+++ b/package/uvw/uvw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UVW_VERSION = 2.10.0_libuv_v1.42
+UVW_VERSION = 2.11.0_libuv_v1.43
 UVW_SITE = $(call github,skypjack,uvw,v$(UVW_VERSION))
 UVW_INSTALL_STAGING = YES
 UVW_INSTALL_TARGET = NO
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
