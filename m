Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5D1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 21:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50BA4402CA;
	Sun, 13 Feb 2022 21:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yuNDO3KeZwQm; Sun, 13 Feb 2022 21:34:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83149402BD;
	Sun, 13 Feb 2022 21:34:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B7211BF475
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 21:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1735760A9C
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 21:34:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jEy-isO4YWcE for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 21:34:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17933606F9
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 21:34:10 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 q198-20020a1ca7cf000000b0037bb52545c6so10548205wme.1
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 13:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AU+uHrKKYnZ3kow3zkm2L0C0BNxokPN3riF5DHrUwUw=;
 b=JWFa4yyq7G/qoEgyoHouu4GrzVkl8X70BAbaM6O4ojkgILlVz1/g47zFVsBo7YRqOb
 dQorP496ByWv7otKBZqVrhg0KR7rf9c8BJKMnoWHnAq4wYzyOrYqnuVbT4KCicEJhpkl
 nG6Eck25eS9cVJ9AFXLMEB8Jj1ITzB4kddIf2yd1UsQS+vEEHVDWg5CgtRUYFgGxnHSM
 vfbTBmb1FSeNWZRuO6ZgDpWVcxoHnBuoRQSMQCtPecUOMr27dQk7cnd9WG3ezmBKUPVB
 jHLdWEUBkXxc0ubNDEQgFO4nJ+6YowOOBPq3BOSiKrl/DZGmcJZl++3t1JHhil3AIw4p
 i7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AU+uHrKKYnZ3kow3zkm2L0C0BNxokPN3riF5DHrUwUw=;
 b=odfqmMHG54pyu87n54+nUQ/OkwZA5ztoHybEHSgCTWpIh/wf4T+K/t93v8tPd4uuqq
 Ed2JvT77KBRYl3iqmZUUneMDdwfMHRzEyZNciJb+rEmjrdbgiKgdkwpDizmc7KcLe7oU
 QOIsm1JDdqhpEhAFTtof0v/W2JkHT5NLjWQr7CTGWQlsfqt5FThoawTl2Bjv03dnaq1a
 r2PgpgYOr46PS6rH8VRp0tzFzneofXIRi5TBrsSpJYvlJyUTlyjYHyFKKrVsTlzl2Xzi
 QFHEmMFdRTxvgBE4cDEggycMv51hRaEJuob9fJgSBnXMzOieBs5ikNM5nUb+g7WW4Wnb
 CQtg==
X-Gm-Message-State: AOAM531Xjyodk3da5L3QHo3k5+sSeGUVLag5J8u3HUkiz40K3FhHspFn
 Vkt9USnWeCa30DjWHb5neg0A/YoPJ3Y=
X-Google-Smtp-Source: ABdhPJwaywiW5DXnbQhqEAlkFCB+JFGSV4Hu0Jm7uiesXkPgBKHHAavx06QPlZONOP8DexB3BkVMWA==
X-Received: by 2002:a05:600c:a06:: with SMTP id z6mr8489895wmp.9.1644788048019; 
 Sun, 13 Feb 2022 13:34:08 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id o14sm30994830wry.104.2022.02.13.13.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 13:34:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 22:34:30 +0100
Message-Id: <20220213213430.1506727-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/opentracing-cpp: bump to version
 1.6.0
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
Cc: Jan Heylen <jan.heylen@nokia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

https://github.com/opentracing/opentracing-cpp/releases/tag/v1.6.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opentracing-cpp/opentracing-cpp.hash | 4 ++--
 package/opentracing-cpp/opentracing-cpp.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/opentracing-cpp/opentracing-cpp.hash b/package/opentracing-cpp/opentracing-cpp.hash
index 591c0e4a0a..8cfaf5fd47 100644
--- a/package/opentracing-cpp/opentracing-cpp.hash
+++ b/package/opentracing-cpp/opentracing-cpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 015c4187f7a6426a2b5196f0ccd982aa87f010cf61f507ae3ce5c90523f92301 opentracing-cpp-1.5.1.tar.gz
-sha256 076d03156735d5ff2df2ea0f8b12351ef65e5e9222b5c8c6a35101dadb41e717 LICENSE
+sha256  5b170042da4d1c4c231df6594da120875429d5231e9baa5179822ee8d1054ac3  opentracing-cpp-1.6.0.tar.gz
+sha256  076d03156735d5ff2df2ea0f8b12351ef65e5e9222b5c8c6a35101dadb41e717  LICENSE
diff --git a/package/opentracing-cpp/opentracing-cpp.mk b/package/opentracing-cpp/opentracing-cpp.mk
index 0605cd5d96..12ce40fbed 100644
--- a/package/opentracing-cpp/opentracing-cpp.mk
+++ b/package/opentracing-cpp/opentracing-cpp.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-OPENTRACING_CPP_VERSION = 1.5.1
-OPENTRACING_CPP_SITE = $(call github,opentracing,opentracing-cpp,v$(OPENTRACING_CPP_VERSION))
+OPENTRACING_CPP_VERSION = 1.6.0
+OPENTRACING_CPP_SITE = \
+	$(call github,opentracing,opentracing-cpp,v$(OPENTRACING_CPP_VERSION))
 OPENTRACING_CPP_LICENSE = Apache-2.0
 OPENTRACING_CPP_LICENSE_FILES = LICENSE
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
