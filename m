Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90A8C4828D
	for <buildroot@archiver.kernel.org>; Thu,  1 Feb 2024 17:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63D35421D2;
	Thu,  1 Feb 2024 17:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63D35421D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EAUEEHzsxyj3; Thu,  1 Feb 2024 17:44:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97DAF42122;
	Thu,  1 Feb 2024 17:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97DAF42122
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E23A1BF4E5
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 17:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36B7142122
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 17:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36B7142122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4LNOzDgHVkBA for <buildroot@lists.busybox.net>;
 Thu,  1 Feb 2024 17:44:39 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C96294210B
 for <buildroot@buildroot.org>; Thu,  1 Feb 2024 17:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C96294210B
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33aef64f702so714767f8f.3
 for <buildroot@buildroot.org>; Thu, 01 Feb 2024 09:44:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706809476; x=1707414276;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lLwewQn47vJRMef5lN7wBlQAisy3P5E2bA2JMEF73G4=;
 b=By/9cEdGJPph82/2BkTpab4V3Qa04z3a1cRs29ImkSqXMKIMfBC/GbhBpupnF0zcSd
 wnc/lw35KsFF9x3aK5IRRnP4kiXvCLctBBCa0P5Y0xWM5DXHkIuDplGpYheaC4xwB/xs
 mMdPa4lgGGF8xH6htnnAHvN6kB5KbfapmjBysU09Rh3KiACOBvOKOY4KT4i7yy1kw2zO
 7biPOgiTMWcNMR5dNIxTFbrbbieP/eLnpoZ89+JEX8/aGG5fce1Cg2HHHQl2srBIpcOX
 u6IXW3OLae2QbAxX8L5rZMeSxJx++ibf1sZA/0iYNdbgmv5gO9McK5XGf4Ad1oBo3xjt
 unWA==
X-Gm-Message-State: AOJu0YwjP91XWYvZdSjW7Y9il7fV2wjDh+xSQ07MegAnlA8UNvmb7jK7
 0zUUh/e1tw3XMf8+TTOElfbP6Lv7t0o5JI/5GrcJ6Adgghm+XvkecNjeOd1uI34=
X-Google-Smtp-Source: AGHT+IEge4YFVObVZsY1AOhtZ0Tcv9biQ9CcuwMvLPpIqQVk2dN9OiMLoc6iAr3iBGo3SRFpv6K2Tw==
X-Received: by 2002:a5d:64e1:0:b0:33b:1a8d:ab25 with SMTP id
 g1-20020a5d64e1000000b0033b1a8dab25mr1202556wri.47.1706809475590; 
 Thu, 01 Feb 2024 09:44:35 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCX7HM6xcDZ0TaXyAbVPmC722d9xnJVkMdneg1+EJbBLS+lOcb2Glyf/liLowk7/TYafUS2MDVkSdzW9adtyIGutGEH6Lh+Ue99/DTNiQzRfyQrRm6nA7jHcGFvS998NW4RjBmVwFgP/pYsy6uBVSRLTHwLm002J/Q==
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 a2-20020a5d5082000000b0033b18230c0dsm9599wrt.10.2024.02.01.09.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 09:44:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  1 Feb 2024 18:44:32 +0100
Message-ID: <20240201174432.182161-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706809476; x=1707414276; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lLwewQn47vJRMef5lN7wBlQAisy3P5E2bA2JMEF73G4=;
 b=hRzQjujJ58QwFk7ZxW8T9mSCrMuhyd3632FxELVnpYvzw6nTM0qCwxAJ5RZxTfxhdM
 nt3Z/KM4xiJSXN7EnN5OEeBp6HzQoBwC25CzQ3o5kVbZ+rzZZay+0o0fI9Hx17FkgOQl
 WFDwu0IWHXnsczsHucZbTFk46PZFmfFh2WBzTLRAPDUUGIwBc0NELHnVEMfY7G3ss24m
 98LfIXZTZJT21aSZbU9hKTa83xOpt0cv1qrxne9sYjJyf8A6zcov17nJlebbuwDUTzl6
 hMnkcOjSyxIVIEeibkOlFzwACIyvaRzMWZcdjlhxj/omScTT5BuNMnbDQuZnjJkvrES1
 R3xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hRzQjujJ
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: drop
 LINUX_FIRMWARE_CPE_ID_VENDOR
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:kernel:linux-firmware added by commit
63332c33aa0771532807fd2684d4eee4eb952435 has never been a valid CPE ID
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:kernel:linux-firmware

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linux-firmware/linux-firmware.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 58fbaab1d7..60e8861abe 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -9,8 +9,6 @@ LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
 
-LINUX_FIRMWARE_CPE_ID_VENDOR = kernel
-
 # Intel SST DSP
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_SST_DSP),y)
 LINUX_FIRMWARE_FILES += intel/fw_sst_0f28.bin-48kHz_i2s_master
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
