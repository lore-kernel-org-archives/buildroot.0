Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51EBCD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 14:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71B52407A0;
	Sun,  7 Apr 2024 14:00:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o44JRmyZXXYU; Sun,  7 Apr 2024 14:00:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32F97407A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32F97407A4;
	Sun,  7 Apr 2024 14:00:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF9581BF21A
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A82E681F37
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:00:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zl4zNAbK5l9E for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 14:00:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9154E81F31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9154E81F31
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9154E81F31
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 13:59:59 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-415515178ceso23762905e9.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 06:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712498396; x=1713103196;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JlF4UXpf9FYwuzA/zPUVV5FQwPlKrQs6CApZfS98IKE=;
 b=aGobJGPHvvGFihBGB/CFV81S149um6wHFGuPdYUkH2R5fQ8sCudWSMAwuVkDMYSTir
 i3mItH85zuQAn86Jvly5JGlmDUaa6Yri20zfH+ZXiBtVcw8ZWi1mjv0R3f/QsM6z0Zat
 JsLMl0fjoUiGi4MMpqV8TUf5De7aOIswkh1blgpUjlnnUCMc0bluhYO+HTGEVgVr4U25
 6DnaBr6KGTgHJn94QbHEh5nrMybrs9PprXi0GzUu8jf3rLaVxb+JFVRFZZRjoavC9NLo
 iIX0oZ/VaDUqh9J0N/+XTdOA8IcI8krc/Dvyir/4ZI1PBwkIj+FFg+UDxWax4GhHBrCC
 R0jA==
X-Gm-Message-State: AOJu0Yw/iugOSI1kQi7Y29WLWJU1mociRteUMuhBhSn/+A+7RTeNfwGk
 AjyvoBqZca9RKzXQTDU0TUiktmHVrtFKGpOTxaqXcalLcd8ez8o5NWwYMVtx
X-Google-Smtp-Source: AGHT+IF2Lo9GpJURREjdTclGZJdjtiM0GOfqqz86JOYicTOT0kL8Wli3Z8XmYbADDwC+7Sw2UGK1Zw==
X-Received: by 2002:a05:600c:468e:b0:416:2e00:ceec with SMTP id
 p14-20020a05600c468e00b004162e00ceecmr4926937wmo.26.1712498396356; 
 Sun, 07 Apr 2024 06:59:56 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v19-20020a05600c471300b004157ff88ad7sm10024950wmo.7.2024.04.07.06.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 06:59:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 15:59:51 +0200
Message-ID: <20240407135951.1868714-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712498396; x=1713103196; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JlF4UXpf9FYwuzA/zPUVV5FQwPlKrQs6CApZfS98IKE=;
 b=gpIBAtZnED+lKlwaIHAKTAyVx6SPJkIMdSWNwrQWGJTOLCp2tG8l9cg87GZxlm7TQ4
 l8yoMHO74pTHs8CDiGuSb+ZgayA8CI28GvnSl2IqGkwmEtoS2Ql3vGRHkO1/9GJPRz88
 AtvK79nJ/KHXkLL7Rp5/SW43EnP0EOvOnwt1lYWrHZCJJIxqFbtw7S7s1s+4E4ddUT/3
 YwvmEgEPayzzD+OA/ft3SqwIaLbtqQhnotKQ28F4yAFidHBdQDuCBqkfMHn35yccH28Y
 pVFw2IE0xv1FrSYExrqbkYoU+65wqq3i1sqXPtKFiGfv9wLLAPqrf/BrtYEfVCHQ0XnU
 kGtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gpIBAtZn
Subject: [Buildroot] [PATCH 1/1] package/oatpp: disable tests
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
Cc: Alessandro Partesotti <a.partesotti@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit d5bba26801b352f591451cf73e0b7509de0e6850:

[100%] Linking CXX executable oatppAllTests
/home/buildroot/instance-0/output-1/per-package/oatpp/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/ld.real: cannot find -latomic: No such file or directory

Fixes: d5bba26801b352f591451cf73e0b7509de0e6850
 - http://autobuild.buildroot.org/results/1587b391baecdbb5a24a0c0b2c33d63cb71a2f7f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/oatpp/oatpp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/oatpp/oatpp.mk b/package/oatpp/oatpp.mk
index c8b0c9694a..d3f6e1a9c2 100644
--- a/package/oatpp/oatpp.mk
+++ b/package/oatpp/oatpp.mk
@@ -8,7 +8,7 @@ OATPP_VERSION = 1.3.0
 OATPP_SITE = $(call github,oatpp,oatpp,$(OATPP_VERSION))
 OATPP_LICENSE = Apache-2.0
 OATPP_LICENSE_FILES = LICENSE
-OATPP_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
+OATPP_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF -DOATPP_BUILD_TESTS=OFF
 OATPP_INSTALL_STAGING = YES
 # Only builds a static lib and headers
 OATPP_INSTALL_TARGET = NO
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
