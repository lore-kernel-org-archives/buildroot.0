Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162A8C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 17:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83AAC60F17;
	Thu, 24 Feb 2022 17:36:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tKS4hAAMMdNy; Thu, 24 Feb 2022 17:36:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CA7360D6D;
	Thu, 24 Feb 2022 17:36:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1AA961BF28C
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 17:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16C2860D6D
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 17:36:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t2O01SN7Iiel for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 17:36:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15C1860D52
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 17:36:25 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id s13so792004wrb.6
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 09:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IJsmjc1EdIzImQds5OKinBmIfzGUk0VVamkcsCzpdHU=;
 b=l7MV+pYAVtm8qsIRt0+FFXjBuzK+QPKoyeYY5qGGNwLxG6ONypk6/bAdbokqlURNay
 fbaabx8Vfx7ftHqAZzJN5fBgKmU+/QdPk9U96wbq+afjf5U3rCutxDb4LA27/4sCEfCC
 gaAbkHE8faI6uu1DKmXWUctQgaamnjIgqxKDwqlKc8dyIN/yykMzR9lICQMwN0ffybjV
 aBKUYlyCA9cH/onErMXJuPtUdKOolZivNxPZZwGmbdduDo88hv5mg4eoF2IKx8Q/igqa
 uNYOXAjOCw1sy4eenTEsUwGiF5Zkymkd5oa7k7v97yQaa/ubiafOr3Bmy/wps6XayHOW
 qoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IJsmjc1EdIzImQds5OKinBmIfzGUk0VVamkcsCzpdHU=;
 b=JfjOKFPhp2WIEw3nsFKTDMCV+34nTmoXexn6mI75enAO5U1QTfAbrhTIpvnDz4gyAZ
 dNMgETAVJWVhMYTKVh7ft1BWmCtbcIG5kLYvk99RiAaoZqGAnLOBFOWvfQqT55kgdu8J
 vs93kz9MlOCKCCTEQmc+pMTCUtUDfCa19gQsnyq+fB1ZlyQDMItyg270mi41d+MpalZi
 XyCLVeq3rUyXPuW7MSs0t629fhQfqRxhV+yuu8mlMDQbUljr9ZtbD+2LHyAHJgn7u7mg
 yHY9zF+CexeFRdi9MZfhofFzLUDmnz2uaePLUJFS046VicnjGXrJIgFQKBcF366zVT2J
 ti+g==
X-Gm-Message-State: AOAM531RGVnL3EgNFA5aIRDvk2rsNCJkmG2ICZKmN4YVuZ4j3n5W7p8C
 J2eThM0PDL5tlSq0p62TZ/sen0IEIiI=
X-Google-Smtp-Source: ABdhPJx7V0Zy9e2M1Xgn0Np216SrDt+l6ihOfK2Ea7Qecjp+4R3cQrGW0xToghHFBN/+akYp3U8wBg==
X-Received: by 2002:a05:6000:3ce:b0:1e4:b2ba:e3e3 with SMTP id
 b14-20020a05600003ce00b001e4b2bae3e3mr3105338wrg.204.1645724182879; 
 Thu, 24 Feb 2022 09:36:22 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 d8-20020adfe888000000b001e060f07236sm19634wrm.14.2022.02.24.09.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 09:36:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 24 Feb 2022 18:36:15 +0100
Message-Id: <20220224173615.486414-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: fix musl build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following musl build failure raised since commit
6fc5c8e92c1d7997e48b207187d2d3c7ad42819:

In file included from src/shared/queue.c:15:
./src/shared/util.h:106:1: error: unknown type name 'ssize_t'; did you mean 'size_t'?
  106 | ssize_t util_getrandom(void *buf, size_t buflen, unsigned int flags);
      | ^~~~~~~
      | size_t

Fixes:
 - http://autobuild.buildroot.org/results/83eaeb3863040645409f5787fdbdde79385c5257

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...rc-shared-util.h-include-sys-types.h.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/bluez5_utils/0006-src-shared-util.h-include-sys-types.h.patch

diff --git a/package/bluez5_utils/0006-src-shared-util.h-include-sys-types.h.patch b/package/bluez5_utils/0006-src-shared-util.h-include-sys-types.h.patch
new file mode 100644
index 0000000000..8a5bd64d43
--- /dev/null
+++ b/package/bluez5_utils/0006-src-shared-util.h-include-sys-types.h.patch
@@ -0,0 +1,39 @@
+From 1d21878d84f16e28e16c61b36799a62e22732d97 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 24 Feb 2022 18:19:33 +0100
+Subject: [PATCH] src/shared/util.h: include sys/types.h
+
+Include sys/types.h to avoid the following build failure on musl raised
+since commit fb57ad9b9d107856e5f1c8135da04ffa2f7a11ac:
+
+In file included from src/shared/queue.c:15:
+./src/shared/util.h:106:1: error: unknown type name 'ssize_t'; did you mean 'size_t'?
+  106 | ssize_t util_getrandom(void *buf, size_t buflen, unsigned int flags);
+      | ^~~~~~~
+      | size_t
+
+Fixes:
+ - http://autobuild.buildroot.org/results/83eaeb3863040645409f5787fdbdde79385c5257
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://patchwork.kernel.org/project/bluetooth/patch/20220224173104.479809-1-fontaine.fabrice@gmail.com]
+---
+ src/shared/util.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/shared/util.h b/src/shared/util.h
+index c01eccf8a..554481e1e 100644
+--- a/src/shared/util.h
++++ b/src/shared/util.h
+@@ -14,6 +14,7 @@
+ #include <alloca.h>
+ #include <byteswap.h>
+ #include <string.h>
++#include <sys/types.h>
+ 
+ #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
+ #define BIT(n)  (1 << (n))
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
