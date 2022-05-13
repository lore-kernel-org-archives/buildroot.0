Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E632FC433FE
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 20:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 842C283F89;
	Fri, 13 May 2022 20:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rzp0GPTsgU1E; Fri, 13 May 2022 20:23:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87CD983F84;
	Fri, 13 May 2022 20:23:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C2E71BF3CD
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 20:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98B6B40494
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 20:23:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6_NslS3KoA-R for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 20:23:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6025400EA
 for <buildroot@buildroot.org>; Fri, 13 May 2022 20:23:24 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso7540700wma.0
 for <buildroot@buildroot.org>; Fri, 13 May 2022 13:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HOrUKIo8kHXxmRpYdNRU5hQRyaT+WVw2hsY1R6Sh10E=;
 b=AMEFPm3fwfUS4rCIPY+2i39CLXdT7MyQxK/7bD78PBLvWvECtdyt9/VB0HZo2vdf8s
 AcCG5TnXd4frpuL4BpKNzNKfzeRbQibcf2qiGBtUtsFKlUEP+V3RxEw/xvKgRUlLzwAs
 JMD2BQ62qbeIBIdN0ClA+/ZhWfNDnJ25UjmbUHIbPTjPCkfCve8R955wpgitbTW7WrO5
 JPI0RW/yONMUmIkxfCbK31QzQEIfDUMW+rWxpQ7Kmk3YBPD0gTOhViOIB95/Idn4lLZ3
 HKcS4Mp078EoNWAXeGZE0DmFnu0NhKnzovSaEAx49t/CQJymaUcj8hYBpkZSy8PQAwoD
 caRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HOrUKIo8kHXxmRpYdNRU5hQRyaT+WVw2hsY1R6Sh10E=;
 b=3AjGLm7Hh6lhzJ4N9PMAAixEJgViscxA4PaYA+9RT4eznHZ/pxXA5ooeXousguk+J4
 AJeVJlwXdY3SSblFUNEQHaI7nLrhkYdS4DSkLl+7Lx+SNHF5rusrLBowkHk9dayHNfxx
 1x/URJw+Xrk3cgYEGIhWFst3zUfNXRR3MfHpx3ztBzzSEHJvX8eemF4fJYQxvHO9+1VI
 e5Fc2sFuBhILacR1TBSTUniYfXa//d4aeKNgPo1uHF/trl9cUtpQD8k6WAPBnDzzdCiC
 yYE7wmLuwMI7/L+2RZX6BgsBL9/juS2sHhjiXbrQTQMSNT2J2R4BiYyA3SjPAQ9rWlMf
 iGsg==
X-Gm-Message-State: AOAM532yrR7BPrbV75nGtMd2FBF8igigfaJjrT0VKVy6WX8m0tm2Zm8U
 PNv2rPjwB2cC27n0Tc1/rNTFcOX3pXI=
X-Google-Smtp-Source: ABdhPJwvx+4yHs/jN/IZ0xgfgMJCBH8jDhGGecZKXxOpYcterMhdc6dMj/bjXjsh2chAg68e75rUqw==
X-Received: by 2002:a05:600c:1d17:b0:394:646d:fd73 with SMTP id
 l23-20020a05600c1d1700b00394646dfd73mr16368013wms.103.1652473402642; 
 Fri, 13 May 2022 13:23:22 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 h9-20020adfa4c9000000b0020cd65d3595sm3036929wrb.69.2022.05.13.13.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 13:23:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 22:21:08 +0200
Message-Id: <20220513202108.750746-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/janus-gateway: fix build with
 libressl >= 3.5.0
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
Cc: Gregory Dymarek <gregd72002@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

dtls-bio.c:40:1: error: variable 'janus_dtls_bio_agent_methods' has initializer but incomplete type
   40 | static BIO_METHOD janus_dtls_bio_agent_methods = {
      | ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/92fe19446b40551c0139254d9efc6b3904fa287a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0004-Fix-build-with-libressl-3.5.0.patch  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/janus-gateway/0004-Fix-build-with-libressl-3.5.0.patch

diff --git a/package/janus-gateway/0004-Fix-build-with-libressl-3.5.0.patch b/package/janus-gateway/0004-Fix-build-with-libressl-3.5.0.patch
new file mode 100644
index 0000000000..6d75318a45
--- /dev/null
+++ b/package/janus-gateway/0004-Fix-build-with-libressl-3.5.0.patch
@@ -0,0 +1,25 @@
+From 8e450a097f5f0c7e9c034e954fbc709797521f1c Mon Sep 17 00:00:00 2001
+From: Lorenzo Miniero <lminiero@gmail.com>
+Date: Fri, 13 May 2022 18:42:38 +0200
+Subject: [PATCH] Fix build with libressl >= 3.5.0 (see #2980)
+
+[Retrieved from:
+https://github.com/meetecho/janus-gateway/commit/8e450a097f5f0c7e9c034e954fbc709797521f1c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ dtls-bio.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dtls-bio.h b/dtls-bio.h
+index 92f06d7c0a..fbfd4c37bf 100644
+--- a/dtls-bio.h
++++ b/dtls-bio.h
+@@ -35,7 +35,7 @@ void janus_dtls_bio_agent_set_mtu(int start_mtu);
+ int janus_dtls_bio_agent_get_mtu(void);
+ 
+ #if defined(LIBRESSL_VERSION_NUMBER)
+-#define JANUS_USE_OPENSSL_PRE_1_1_API (1)
++#define JANUS_USE_OPENSSL_PRE_1_1_API (LIBRESSL_VERSION_NUMBER < 0x30500000L)
+ #else
+ #define JANUS_USE_OPENSSL_PRE_1_1_API (OPENSSL_VERSION_NUMBER < 0x10100000L)
+ #endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
