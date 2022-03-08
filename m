Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C34C433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 18:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2201360F20;
	Tue,  8 Mar 2022 18:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NqPfOhl0_CBs; Tue,  8 Mar 2022 18:01:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2728160A83;
	Tue,  8 Mar 2022 18:01:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A7B9B1BF86D
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 18:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A56F9410A8
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 18:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GqqRDKrU3_da for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 18:01:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B48BD410A5
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 18:01:39 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 k29-20020a05600c1c9d00b003817fdc0f00so12970wms.4
 for <buildroot@buildroot.org>; Tue, 08 Mar 2022 10:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0wSW6k4wtF7NnjhoeQlOSiR83DoYiaovUmKNtq2uHG0=;
 b=T8gxml3mR2RrQotfTzCbOva5T/KV4vZ64oHksGJN/7epj2UHf6NFSMxOJQnXeJmMmw
 S2Ef3aF1EeRzBsvwayybSwpUmAi8vbx8H4tc55YyscHCuIoPwGP4jmsQmPuOQBSrHQIM
 o6qyg5+5Ggo3H3pJZ2ZMAYgLVTV5KHtBkPRiyOlgkg5hHfGJ2qkyIg/o7zfGSRFFOf8N
 hsHYb5LMQ1S1uo+oTogqE4f52bBeapwB728AbQgEuijDAsGtPNBCqM6DRnJme4gC0+cW
 AIic12QUcBlQrg1O+/9Uod897L4euR6ZMjcDw4ri0oMUl3n0nivWwtXH5sqYI0ietXx/
 CRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0wSW6k4wtF7NnjhoeQlOSiR83DoYiaovUmKNtq2uHG0=;
 b=GadH0Rt0Y2/dWzKbFQ6QyVN/rXhNOnOxMHFLEODK0StA7hkTpw2oZdBydLrv6FQrRi
 sBpZvy/+pKvb+YKnhEzCoUg5PO73kewD+oyLDuL32fL2OVGq+27uy5G+VU36lVANN7Im
 C2robraCsReYeNeov9yt5e0KpSJFIN2KHoNcuiscX8+kAtL1fMWHiRZ55DmuueHuMU4F
 NH1M6e+bm8OCuspGEYT4W9X7tBRUSi3D1U8lZtF3vbDp/gowkzWxqx1zRkiQBYFYdtMK
 BlMonjtV0Ce6cnnV+rPo8NWFtCS6cU7zQJDzHT9QmF30EH4t48ZWsGMVdWGwFbEsDOir
 ERFQ==
X-Gm-Message-State: AOAM531Q8owGW93cQ2e2hW/PnTjtAQ3BFk7EQNxnFMmfzfBt/4hGaAfq
 kOa2kGHdQt1Z+s/70UJsT+umxNkwuXQ=
X-Google-Smtp-Source: ABdhPJyXvkc0jzkclwxpaMf2FJeBKt9g2Y+2gCX84pXz4H4h279lPheUoTqqfaA4hZe1SgHne72RIg==
X-Received: by 2002:a1c:6a1a:0:b0:387:5ee7:750e with SMTP id
 f26-20020a1c6a1a000000b003875ee7750emr356720wmc.85.1646762497660; 
 Tue, 08 Mar 2022 10:01:37 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 h36-20020a05600c49a400b00382aa0b1619sm2766529wmp.45.2022.03.08.10.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 10:01:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Mar 2022 19:00:56 +0100
Message-Id: <20220308180056.1558155-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libsrtp: bump to version 2.4.2
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

This is a patch release for version 2 & 2.4, fixing a regression
introduced in 2.4.1.

https://github.com/cisco/libsrtp/releases/tag/v2.4.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsrtp/libsrtp.hash | 2 +-
 package/libsrtp/libsrtp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsrtp/libsrtp.hash b/package/libsrtp/libsrtp.hash
index 3de0130f4c..8e51e68ac2 100644
--- a/package/libsrtp/libsrtp.hash
+++ b/package/libsrtp/libsrtp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3cb580928fcd502426809c68406d04aaa5ef1af7ebb0a3a41a52a13576f2fc07  libsrtp-2.4.1.tar.gz
+sha256  3b1bcb14ebda572b04b9bdf07574a449c84cb924905414e4d94e62837d22b628  libsrtp-2.4.2.tar.gz
 sha256  8e19d42a1eec9561f3f347253ddf2e385c55f392f025bb0fd41b88dbf38db5ae  LICENSE
diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
index 885f05a33c..f2ba600dd6 100644
--- a/package/libsrtp/libsrtp.mk
+++ b/package/libsrtp/libsrtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSRTP_VERSION = 2.4.1
+LIBSRTP_VERSION = 2.4.2
 LIBSRTP_SITE = $(call github,cisco,libsrtp,v$(LIBSRTP_VERSION))
 LIBSRTP_INSTALL_STAGING = YES
 LIBSRTP_LICENSE = BSD-3-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
