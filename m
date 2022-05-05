Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D915C433EF
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 21:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FE52832A9;
	Thu,  5 May 2022 21:08:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cY-2326mB5tr; Thu,  5 May 2022 21:08:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 498E782A0B;
	Thu,  5 May 2022 21:08:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BEE5F1BF308
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 21:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A903060881
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 21:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BJqLRVA05rfA for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 21:08:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9392B60864
 for <buildroot@buildroot.org>; Thu,  5 May 2022 21:08:16 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j15so7636255wrb.2
 for <buildroot@buildroot.org>; Thu, 05 May 2022 14:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=moESP2YBYxx65l0hTMOnNebU+vI9IxFwg4Nk381XQdk=;
 b=OVWHFVIgCA/jdCijmkTwPd5T5iUrFlwBNZaXEU0guSPxkFi+sLkCZfZDN81bIY6dMH
 8tCLWI4P0ee3nUuVkyYMT3LQ8lMTRHaK9Vq2sNRgJ+6fHzRefnpyJGxvoAJvTupL1sqD
 bWAByO45cqQpnGv/tlMPfgCO/5ca90sjofQiMjmsgJqerv638HhHQ3batUKKbiLgXGQg
 5WXn5cZnYylv2kca0qm/wpGTBRzv1AmECxd9GdpOxQIy+fiOt9LvmAyQ68zXgcrxRWYv
 37Fz9O9UOnenXSQcaXjwlZ+enwaOCc3mQppoTJoEShuc+zpzvzvnnDSkLQuFjNMuPbig
 /4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=moESP2YBYxx65l0hTMOnNebU+vI9IxFwg4Nk381XQdk=;
 b=1JpoULKAxAsr/4Z7znc7D9jLY7sM7FNd2M92KwDXsUVnDrlO+aCUPBi2WcSuNEq/XT
 qMFfqutkoGvpN/VYP48CbBpXsPdmtarkMY18RZKfdAQR/es38u4FHClcp0Hx5ry+Wy2G
 Pk9vjppch0Xn0jhopigdQbn38+vaRqdwdDZb2bZNcdb64jZLdMXZKdr0+hF0xrbsRk+p
 hQkrne+b63ztilZziOqTgbOth6wtxTn+YrI6emqX5fxQpa4BlvytgSv06jEA+8b3s9gH
 JeEEw8IO2tp6GJyKXJudOV6adcLkCZ7fjBk22+bWk+JAJm/vsmj7WMJSxfNstTZX9zbR
 Vgog==
X-Gm-Message-State: AOAM5335MTrJfnH13SHggknrBTqQbARgzK55YMRqhiDmppeIsFMUO+8F
 SD8eucLS2AKEOvFvCq+rbvtORkoVJlk=
X-Google-Smtp-Source: ABdhPJx9m1MpVIluDLw6TQLRoh08STXEGE/XhGzxNq4jjRyloG1qyhVPV1G3Snl1XdW/AfLY3hIIYA==
X-Received: by 2002:a05:6000:136b:b0:20a:c416:e914 with SMTP id
 q11-20020a056000136b00b0020ac416e914mr21021wrz.167.1651784894409; 
 Thu, 05 May 2022 14:08:14 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c1d0600b003942a244f34sm5853987wms.13.2022.05.05.14.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 14:08:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 May 2022 23:06:04 +0200
Message-Id: <20220505210604.9605-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sngrep: fix build with libressl >=
 3.5.0
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

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

capture_openssl.c: In function 'P_hash':
capture_openssl.c:101:18: error: storage size of 'hm' isn't known
  101 |         HMAC_CTX hm;
      |                  ^~

Fixes:
 - http://autobuild.buildroot.org/results/f1e8cdb3ac35a30055ab79d41e6cc038e5339c37

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...nssl.h-fix-build-with-libressl-3.5.0.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/sngrep/0001-src-capture_openssl.h-fix-build-with-libressl-3.5.0.patch

diff --git a/package/sngrep/0001-src-capture_openssl.h-fix-build-with-libressl-3.5.0.patch b/package/sngrep/0001-src-capture_openssl.h-fix-build-with-libressl-3.5.0.patch
new file mode 100644
index 0000000000..7dbb29ab00
--- /dev/null
+++ b/package/sngrep/0001-src-capture_openssl.h-fix-build-with-libressl-3.5.0.patch
@@ -0,0 +1,40 @@
+From 4e1406ad0df370ff8bf1d3a81aaadbb1cad2d761 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 29 Apr 2022 18:53:45 +0200
+Subject: [PATCH] src/capture_openssl.h: fix build with libressl >= 3.5.0
+
+Fix the following build failure with libressl >= 3.5.0:
+
+capture_openssl.c: In function 'P_hash':
+capture_openssl.c:101:18: error: storage size of 'hm' isn't known
+  101 |         HMAC_CTX hm;
+      |                  ^~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/f1e8cdb3ac35a30055ab79d41e6cc038e5339c37
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/irontec/sngrep/commit/4e1406ad0df370ff8bf1d3a81aaadbb1cad2d761]
+---
+ src/capture_openssl.h | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/capture_openssl.h b/src/capture_openssl.h
+index 780de494..1f87a5cd 100644
+--- a/src/capture_openssl.h
++++ b/src/capture_openssl.h
+@@ -67,10 +67,11 @@
+ #endif
+ 
+ /* LibreSSL declares OPENSSL_VERSION_NUMBER == 2.0 but does not include most
+- * changes from OpenSSL >= 1.1 (new functions, macros, deprecations, ...)
++ * changes from OpenSSL >= 1.1 (new functions, macros, deprecations, ...) until
++ * version 3.5.0
+  */
+ #if defined(LIBRESSL_VERSION_NUMBER)
+-#define MODSSL_USE_OPENSSL_PRE_1_1_API (1)
++#define MODSSL_USE_OPENSSL_PRE_1_1_API (LIBRESSL_VERSION_NUMBER < 0x30500000L)
+ #else
+ #define MODSSL_USE_OPENSSL_PRE_1_1_API (OPENSSL_VERSION_NUMBER < 0x10100000L)
+ #endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
