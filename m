Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02851C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 22:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A534B842FF;
	Wed,  9 Mar 2022 22:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dwt06oESODjE; Wed,  9 Mar 2022 22:03:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCC19842D0;
	Wed,  9 Mar 2022 22:03:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 708D41BF37E
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 22:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D9EE40143
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 22:03:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Io8MQJB5ZUf for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 22:03:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3693B40142
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 22:03:04 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id k24so5115846wrd.7
 for <buildroot@buildroot.org>; Wed, 09 Mar 2022 14:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ab4VboZYmyY8G4Qff2GDOMxlGjwtK2sipeF1py16EL0=;
 b=PyvrdZzMujDdLjv69/oKYfCo+K/cOPa/C34mZYYZv7ueJFYrHajPU7ZY1Un0np4cT4
 BTuIYEzWQSyNETVDb/JIRJluWlV/BX4rcv5JdMxRr8OgqxfZPvPp1+wrqv9Y9jIf7AFy
 yp1iPEKp20+CQX8NS1XEgsySCy07hQJy6WI2v787Z4yVGoIxoUUQTSSEsqsupYteuKrg
 IIW0lDY95IIX5FYp91x3LHmviBqHP++UEvccAi10HMunJutsMG5753bt+we47+FSuhF7
 ibRYQYk0tJRdBFU2r1WNGE2DpHDpDGrmC3Kpl1cDt5a3Bvij96GxWsMFCgfPOHtDOlef
 Sy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ab4VboZYmyY8G4Qff2GDOMxlGjwtK2sipeF1py16EL0=;
 b=oCEqxlwOFoPrQVnH44UnqDYPIWPLtmOJVwO8MiygKEupc7GTxG8c2A+sTF/d/KVCSA
 D5HIqK/qWnDxO8TzmNJARr+o65Kt1kVKPvyrzzcmcHaIte4ZaxRfKEEaywNOJg3Usm/f
 FHSdj4YwdPKt8dTLPQ+mFH9mH9H0P8OQ5jgLEWTaHwLU1y2anGYX8o1L5frpN8wfvh/n
 I/gu9KtQFC+mxj4m4iFN7IsRcsgt5pHElWHZ+Dx9ZQjmI4zAok8Uxf1DAGmysWQpI5Dp
 8nScem1EuNEaNyxR1c6B6V0h8ycAy4PIFG3BiqlD9Cu/klZqPU3ryjSYlWp95iafTIaG
 aGdQ==
X-Gm-Message-State: AOAM532o6cOu04b1qn5lcnJke+E7T+7cdvXxvjbl7dOJ1pj9jtS7Zj1W
 8q76YJELEZ8aj/JSVOx8K6vqU1RbFS4=
X-Google-Smtp-Source: ABdhPJxHRu13G8m39dZvsKpp2TbSvJ+LNqAR1b8+Fk3KzzJ+jnyAc4EWzpwNcZCJc6WNnk4WhZwdIw==
X-Received: by 2002:a5d:40d0:0:b0:1f0:65a4:f11f with SMTP id
 b16-20020a5d40d0000000b001f065a4f11fmr1223190wrq.341.1646863382161; 
 Wed, 09 Mar 2022 14:03:02 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 e20-20020adfa454000000b001f01a14dce8sm2648366wra.97.2022.03.09.14.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 14:03:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Mar 2022 23:02:19 +0100
Message-Id: <20220309220219.787315-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/azure-iot-sdk-c: bump to version
 LTS_01_2022_Ref01
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

https://github.com/Azure/azure-iot-sdk-c/releases/tag/LTS_01_2022_Ref01

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...c-fix-mismatching-function-prototype.patch | 35 -------------------
 package/azure-iot-sdk-c/azure-iot-sdk-c.hash  |  2 +-
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk    |  2 +-
 3 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 package/azure-iot-sdk-c/0001-hmac-c-fix-mismatching-function-prototype.patch

diff --git a/package/azure-iot-sdk-c/0001-hmac-c-fix-mismatching-function-prototype.patch b/package/azure-iot-sdk-c/0001-hmac-c-fix-mismatching-function-prototype.patch
deleted file mode 100644
index 0c262e6c46..0000000000
--- a/package/azure-iot-sdk-c/0001-hmac-c-fix-mismatching-function-prototype.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 3a7997af72e7a4f70109d1639e6725b39046443e Mon Sep 17 00:00:00 2001
-From: Francesco Giancane <30423178+fgiancane8@users.noreply.github.com>
-Date: Fri, 2 Jul 2021 20:47:38 +0200
-Subject: [PATCH] hmac.c: fix mismatching function prototype (#537)
-
-The reported function raises a warning when compilers assert the flag
-`-Warray-parameter=`, signaling that an array-type argument was promoted
-to a pointer-type argument.
-
-While in practice in most C implementations this is correct, fixing the
-warning (and, in this case, indicating the maximum size for the array)
-would represent a best-practice for finding out-of-bound accesses or
-identifying wrongly-sized arrays passed in the function.
-
-Signed-off-by: Francesco Giancane <francesco.giancane@accenture.com>
-[Retrieved from:
-https://github.com/Azure/azure-c-shared-utility/commit/3a7997af72e7a4f70109d1639e6725b39046443e]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/hmac.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/hmac.c b/src/hmac.c
-index 53f2411f8..160af9d2f 100644
---- a/c-utility/src/hmac.c
-+++ b/c-utility/src/hmac.c
-@@ -208,7 +208,7 @@ int hmacFinalBits(HMACContext *ctx,
- *   sha Error Code.
- *
- */
--int hmacResult(HMACContext *ctx, uint8_t *digest)
-+int hmacResult(HMACContext *ctx, uint8_t digest[USHAMaxHashSize])
- {
-     if (!ctx) return shaNull;
- 
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
index 72fa99c44d..5dbb530954 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  987b469aa76d6c81e5dbcd62e81f4ece0620770930cf65722754c76aedd6049f  azure-iot-sdk-c-LTS_01_2021_Ref01-br1.tar.gz
+sha256  082e41f7cdf06fec036b8cfa1793f03e81ba527b55ea13c66be0e4cf9f20ff7b  azure-iot-sdk-c-LTS_01_2022_Ref01-br1.tar.gz
 
 # Hash for license files:
 sha256  be2e9913fad9ff33607287c728f392579e2a6cc83e51b203ef6274c41db02ee7  LICENSE
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index e6de8c851b..874646c445 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AZURE_IOT_SDK_C_VERSION = LTS_01_2021_Ref01
+AZURE_IOT_SDK_C_VERSION = LTS_01_2022_Ref01
 AZURE_IOT_SDK_C_SITE = https://github.com/Azure/azure-iot-sdk-c
 AZURE_IOT_SDK_C_SITE_METHOD = git
 AZURE_IOT_SDK_C_GIT_SUBMODULES = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
