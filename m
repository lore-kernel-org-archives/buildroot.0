Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81E7C48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 15:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77B48827BA;
	Sun,  4 Feb 2024 15:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77B48827BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OjiIUwlv_d7c; Sun,  4 Feb 2024 15:23:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D9FB827D9;
	Sun,  4 Feb 2024 15:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D9FB827D9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 004901BF47A
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 15:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD4694011F
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 15:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD4694011F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R4dHLZzYPn_2 for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 15:22:55 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7156F400B9
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 15:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7156F400B9
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-51149561a39so769659e87.0
 for <buildroot@buildroot.org>; Sun, 04 Feb 2024 07:22:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707060173; x=1707664973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1TB81KZgFn0Nihmpb3skEgFK8F4e4UhVxt2ejegNebU=;
 b=a2xAsGbH2as8d5MsJIB24km2AfgmBBFXaqwDYa4f09VkYOow0XV9QRHdQhJDM9UGDL
 yc9IEr7c4UwlGgN/mK0whPPPaqrOR4Wyuorc3k30mXNpAn+J9pGGURykMj/6FylW8s6J
 +dW8/Xf+unP1SCytYuXGmITkMJvy5oN6D1yDaP/gI3eA7sDA5GpZkRohNB+YUl/ykLoZ
 KHsge2YWsqDuO0L4qPMvq1k1p99E9BEWNmvv4pKU7NoUOqggvpGCVSss++SxXdycvxx1
 OUXvLM9opbWiLJ+QH5XPvZ+lh/6IwqrLRjD+bayUQLu/GCCEhHzRxlz3JxvTNg37USn7
 CjZw==
X-Gm-Message-State: AOJu0Yyl3KGjnpvtpRgJCX4niyvuF5ZojvMNPwbi4M8YCZY5FI8X9MTH
 e207GKxBoCia0Qn35qnFecWn+eu+9qy75GjNodGyWMEioMihcxW3lQ274+WxEb0=
X-Google-Smtp-Source: AGHT+IGu88nd9uMKOgh11QS+eLsok+iARHevfryCDm1EzvVplwI3zFZvYHpdsqNPDppKsSzWuYDCvg==
X-Received: by 2002:a05:6512:3d87:b0:511:31f3:5426 with SMTP id
 k7-20020a0565123d8700b0051131f35426mr5608441lfv.8.1707060173316; 
 Sun, 04 Feb 2024 07:22:53 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWyOy2gZORxyz6SNgbOL3SbSZIRJaFbfcjq+ftzi6Z2E3wIG8guEnCotX9nOrvNR4KBRCFFAzrhbElGJyMuAdP85WRlk1vu4w==
Received: from landeda.fosdem.net ([2001:67c:1810:f051:9566:1ebe:e5dc:dd49])
 by smtp.gmail.com with ESMTPSA id
 v23-20020aa7d657000000b0056020849adfsm1557363edr.26.2024.02.04.07.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Feb 2024 07:22:53 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  4 Feb 2024 16:22:49 +0100
Message-ID: <a72d15ae3beda3fbdd4fb1be78ddcdf5023219ee.1707060159.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707060159.git.yann.morin.1998@free.fr>
References: <cover.1707060159.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707060173; x=1707664973; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1TB81KZgFn0Nihmpb3skEgFK8F4e4UhVxt2ejegNebU=;
 b=kChmb+wsnygjivBNUIwebsooQgiubn/a6udSbdQW0JlNbf8+4DkZ7phW0o+7Gk1UJu
 l99rE+Civ9OOJjX+6//tuAP39XHxhMM7WeV/HtK85EJsHt0O/gFYoMW9twRyQlZyKDxP
 vL4Vf3G20JcPQsy/0UOrDlbxGER6pN+LmqoYV1+a3drjk7kUSVZBPTyyhcZHk9+Ig5gk
 CBapcNRGAs4wgMT2GEWBYNHEFGV17oaqzW54u1n+PaNrkIYMuY/AJ1TJyEdqCnXznaia
 P0gLtkqy3bXwAIVf7lkKSC1SOH4vSuBd9WDb4GFkSgHLaY0MBJqZPkvalmLEFBVAVKB6
 p9bw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kChmb+ws
Subject: [Buildroot] [PATCH 2/4] package/libcurl: drop LIBCURL_CPE_ID_PRODUCT
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Commit 4b6202f721f2f5ab36153ba44de65286f7811ef9 set
LIBCURL_CPE_ID_PRODUCT to libcurl but this is not needed as
LIBCURL_CPE_ID_PRODUCT will be set to the package name
(i.e. libcurl) by default

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcurl/libcurl.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 3ecc587a52..83845b8e87 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -13,7 +13,6 @@ LIBCURL_DEPENDENCIES = host-pkgconf \
 LIBCURL_LICENSE = curl
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_CPE_ID_VENDOR = haxx
-LIBCURL_CPE_ID_PRODUCT = libcurl
 LIBCURL_INSTALL_STAGING = YES
 
 # We disable NTLM delegation to winbinds ntlm_auth ('--disable-ntlm-wb')
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
