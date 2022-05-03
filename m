Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA98AC433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 16:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3618A4060E;
	Tue,  3 May 2022 16:32:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eN60VyfN-rsz; Tue,  3 May 2022 16:32:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 404A9405D8;
	Tue,  3 May 2022 16:32:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 875971BF342
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 16:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 734976102D
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 16:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ILZM_bOQCyl6 for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 16:32:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 855436102B
 for <buildroot@buildroot.org>; Tue,  3 May 2022 16:32:48 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 p7-20020a05600c358700b00393e80c59daso1525092wmq.0
 for <buildroot@buildroot.org>; Tue, 03 May 2022 09:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/ig6e5CPWZOp9gXMZMmAJod4nK0AN698vmBpAK+tvfY=;
 b=OpOGeMv0WmB7GfzxdP2SHuj5bTiCH1QV7Pn+mRs3uQ/TsrGV4nUIeK+XmzqUhA0TXN
 ho5PBpD/iTVacCidKisIRgimbhMhH3iprx/zLfcU6AGee8ENolZBie4OOPo+PCycqpYZ
 +o8v2bR7F6TCoyRrI7o9KoV4fv9lAgHNyOiHzI2S8PG9YVQ9P/4jxm8DJg64J8PDzUAL
 nHuYJ/n+Se5e+FmTBlSVXlcdznVxJ8iChfq7vJGLYNJnBZBsgk5k5XOQixDxFe9chaxq
 1gWjbmEOvVPA8Fwri8SffXuszqdgH6ZAD+FZ1kPzg0LnqtZ93lVOe7aUNdlkum/S1Jhz
 qAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/ig6e5CPWZOp9gXMZMmAJod4nK0AN698vmBpAK+tvfY=;
 b=mou80AN6H9eRWZ9AdXHwy0zP0Mozts4jDYiBiOzszf6S7ubwR5AcFV3K0x04WdCbyF
 3MbSF1X2zRr1RcM8A38cL08J5ASTSVdM2qHrLB4kwpiSxBuxj5rJScdnM81eOBAzs2mF
 qqkLnsoSVp4lDNB9RCpF4qIHhKMmr/mgdmawjwygt63DCuE0olvTKW51vLUTNtBwfHev
 +or70GBuyWatKC/DfjLPfpV/s1yFa+M5qwF3KnW+PCivmuM+SJTHMvMR/ePZibHaVE+p
 E5s1EhSP9nW0nqseJYRsA3+JEfvdUGtag5MeLEMJvLnwmmhgXT7i4GvNPsui8n5bhSO0
 kQag==
X-Gm-Message-State: AOAM531ZzgsLHL1TcKvpmxTnbgLaqMSGPp/7w2ZBR4keowkb8Sh+/Pa9
 dJ3V6dDgTo+YfDuEipMmU1JD8klpeys=
X-Google-Smtp-Source: ABdhPJzbxl2r3UIPySXR129yuJ7HxO91X0gPEKkCUKbraXI0d2FSivSWaUfrr6nFNme67HUP7dc6+Q==
X-Received: by 2002:a05:600c:5008:b0:394:533c:54a1 with SMTP id
 n8-20020a05600c500800b00394533c54a1mr2109153wmr.15.1651595566388; 
 Tue, 03 May 2022 09:32:46 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m15-20020adfa3cf000000b0020c5253d903sm9361720wrb.79.2022.05.03.09.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 09:32:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 May 2022 18:30:08 +0200
Message-Id: <20220503163008.3959966-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/aircrack-ng: fix build with
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

lib/crypto/crypto.c: In function 'calc_mic':
lib/crypto/crypto.c:203:2: error: variable 'ctx' has initializer but incomplete type
  203 |  HMAC_CTX ctx = {0};
      |  ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/d8444dada84a54205273ac627d3e4f4692a55364

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...rypto.c-fx-build-with-libressl-3.5.0.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/aircrack-ng/0003-lib-crypto-crypto.c-fx-build-with-libressl-3.5.0.patch

diff --git a/package/aircrack-ng/0003-lib-crypto-crypto.c-fx-build-with-libressl-3.5.0.patch b/package/aircrack-ng/0003-lib-crypto-crypto.c-fx-build-with-libressl-3.5.0.patch
new file mode 100644
index 0000000000..da1549df5b
--- /dev/null
+++ b/package/aircrack-ng/0003-lib-crypto-crypto.c-fx-build-with-libressl-3.5.0.patch
@@ -0,0 +1,35 @@
+From cbfe47193bbab1f82fafb4b83c3d159a0f1fe03d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 3 May 2022 01:34:41 +0200
+Subject: [PATCH] lib/crypto/crypto.c: fx build with libressl >= 3.5.0 (#2310)
+
+Fix the following build failure with libressl >= 3.5.0:
+
+lib/crypto/crypto.c: In function 'calc_mic':
+lib/crypto/crypto.c:203:2: error: variable 'ctx' has initializer but incomplete type
+  203 |  HMAC_CTX ctx = {0};
+      |  ^~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d8444dada84a54205273ac627d3e4f4692a55364
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/aircrack-ng/aircrack-ng/commit/cbfe47193bbab1f82fafb4b83c3d159a0f1fe03d]
+---
+ lib/crypto/crypto.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/crypto/crypto.c b/lib/crypto/crypto.c
+index df2c1bf41..52bc5e5ac 100644
+--- a/lib/crypto/crypto.c
++++ b/lib/crypto/crypto.c
+@@ -196,7 +196,7 @@ void calc_mic(struct AP_info * ap,
+ 	int i;
+ 	unsigned char pke[100];
+ #if defined(USE_GCRYPT) || OPENSSL_VERSION_NUMBER < 0x10100000L                \
+-	|| defined(LIBRESSL_VERSION_NUMBER)
++	|| (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
+ #define HMAC_USE_NO_PTR
+ #endif
+ 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
