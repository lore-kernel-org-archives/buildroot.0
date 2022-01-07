Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AA5C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 20:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 427BE60AE8;
	Fri,  7 Jan 2022 20:36:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rc-TgNHQLHse; Fri,  7 Jan 2022 20:36:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F34260AE4;
	Fri,  7 Jan 2022 20:36:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 88FB61BF5DA
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84EED40037
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:36:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2WFrNnykIPku for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 20:36:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F375429A2
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 20:36:43 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id v6so13182417wra.8
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 12:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1RkIaXXOrTKxfCvq6S+dmslmr91c3jc4T0s/26CqK4s=;
 b=jMRCExmJV4/vj0WQYhX7xnUyBFj3MpWQMjclzfXqf1u2BqJB/i9z5U8hvsokZwOW8+
 rNRuoRbYeQPWrt4WXegImGQnnVFCoFE/q7G/VLfjjuMQ0UljnsfDIvR9I4FKKbmDSxyF
 QMgh1zGcTD0a+mpGmDXe3CDD7qhMIqCFDXFttGlgCsDTUw0IkRYXgqseZAoYSJRTjk1f
 pvkK4Jnj9bUFAO4ZPy1LF1fyhTIisfix2tjzkkkh8fA6MFNz7o55mHYeHHKk/p1LeiTG
 n9EEZvZjGoZ9srFGWH1Sr7HmAds6nQGYJsgqxWbESIRbKbRUKggCnbpXUY3QAylhhYDy
 CBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1RkIaXXOrTKxfCvq6S+dmslmr91c3jc4T0s/26CqK4s=;
 b=eDBvaO79N91YFWkuFC2KTeg3aw9mmzm4rBHUriwlj3FLvrCy3ZaduoooMzWlYn50t5
 j8ztfV0UM9WX8ixLlCiIIxz17cNsS0badtS34G9uf+M6uJuKKtjdTFAp9mi/ZNmvGeu2
 LWPqwAyL/C0qR+SXmYnY5MuTgLo2luj6ORa8z9nBXqmwl/Rv1hfON5/zZZe71MOluFO5
 ZwBqCaDIliQ+Zt7X+xuq5JKuF3IDs2wybR/ovoM5DQuypEteKfNuZ+YH5BZVZWNCZ/jq
 DEc3OUR+cP2+MF+jDog3wK0B9y4o3u0t9dZXrn3rETPnpNmpfwLiEkxbwFX6Qb4FpeUk
 Ypzg==
X-Gm-Message-State: AOAM5325Lz2F+8LuhuMfsKyBKNgr34CvpXpps/IeplRby+BV/kWGliUU
 roDmqEj5P8rUdjGwc/N7Tn+/Po43O14=
X-Google-Smtp-Source: ABdhPJx0lnmv6kIBX82jnhKNauBcvBAD6u/j0OTDhzcLZ2y68dW8iY7jm0fC020k6GR/NBJmr0/JOw==
X-Received: by 2002:a05:6000:1543:: with SMTP id
 3mr56655629wry.140.1641587801761; 
 Fri, 07 Jan 2022 12:36:41 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id c16sm3331524wrp.109.2022.01.07.12.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 12:36:41 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 21:35:33 +0100
Message-Id: <20220107203534.1461378-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libnftnl: bump to version 1.2.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.netfilter.org/projects/libnftnl/files/changes-libnftnl-1.2.1.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnftnl/libnftnl.hash | 2 +-
 package/libnftnl/libnftnl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index 9737da1878..0a183eedcf 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,3 +1,3 @@
 # From http://www.netfilter.org/projects/libnftnl/downloads.html
-sha256  90b01fddfe9be8c3245c3ba5ff5a4424a8df708828f92b2b361976b658c074f5  libnftnl-1.2.0.tar.bz2
+sha256  7508a5c414fab13e3cb3ce8262d0ce4f02c1590a8e4f8628ab497b5b4585937c  libnftnl-1.2.1.tar.bz2
 sha256  98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24  COPYING
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index eff93b895f..616afa6307 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.2.0
+LIBNFTNL_VERSION = 1.2.1
 LIBNFTNL_SITE = https://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
 LIBNFTNL_LICENSE = GPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
