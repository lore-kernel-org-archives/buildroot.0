Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE152C47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 13:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57F5582C7D;
	Sun,  7 Jan 2024 13:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57F5582C7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MKUn_lDVYsbi; Sun,  7 Jan 2024 13:26:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BD6481E56;
	Sun,  7 Jan 2024 13:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BD6481E56
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6355F1BF831
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 13:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 394CA81E56
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 13:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 394CA81E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oTg_fucNJZSW for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 13:26:21 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 573AA8141F
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 13:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 573AA8141F
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40d60ad5f0bso14095865e9.0
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 05:26:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704633978; x=1705238778;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1qJ2wFJq7HB5are+sUN5qkWf6RWmzmMdNdb4QD7r3go=;
 b=HgWe67juEwQeK9YUX4yplb4UcG7o7KRGdTwIw/6KCskCbFcFfeEC5IAMlSpoVP5htj
 vv+Xv6z3NVwyTMk+f4zjXRMQfKFD+CjCh4PuyP73bOCDtU9I8DdYZp6zVGe3nQitOySD
 vAJfEb+FPpsS2IONUugLJ1Ie6Iv/lJEv93+bhFBf/Su+4TKBbSgnIamzwVBPlCpRPSjG
 /ShEqvROWa3CnJ5zkVk6/0mX1GvrBVlvVduElBvfoAHzbIysGQdGp27AGAB9Jn8VI3Em
 RPrFDxeWHUuhk7NWZ4yjeQgjvfcl8Uy6RuLfKyQB0ZlsErjQ6vw3lLhTKWwSQC2Rz4c0
 g5lw==
X-Gm-Message-State: AOJu0YxSBx1z4UPRL3tOyR6kh1iBapbYcBIUDUxoS/BP5C/IlRC8kyAS
 bZSzOU4rQnCgNHFymkaENg2iKjGXsB0=
X-Google-Smtp-Source: AGHT+IECnFBQo4/p0+92P2u5Sx7/XumBjVfFXDbMF+6pvEoM+j4eZiVtWaGf6Svnk8s0wYFy0o3V0Q==
X-Received: by 2002:a05:600c:c1:b0:40d:3327:2be8 with SMTP id
 u1-20020a05600c00c100b0040d33272be8mr1348642wmm.136.1704633978580; 
 Sun, 07 Jan 2024 05:26:18 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c4ecb00b0040d2d33312csm7681751wmq.2.2024.01.07.05.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 05:26:18 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 14:26:16 +0100
Message-ID: <20240107132616.3166936-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704633978; x=1705238778; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1qJ2wFJq7HB5are+sUN5qkWf6RWmzmMdNdb4QD7r3go=;
 b=O9F5U+eGvAvcB2LVU73fJDC1fOT6k8qttP3kd5AQXoNhX9OqCq+LqxqvJnJQNKRptb
 9cfnvQEPKjEJkIVZa3kKRuixra9pY4ljm1lKV0sg/+kasZhseqd+VFj9T89QjemTjQ5r
 ddyfWc1gy91MYQUqCV4kaQgj3n9UzMTP07KG86URuDNuhhMqr49CwkBFYiSDWmlXOv8D
 T+/JanU9fEPSINCzrzI7Cwc8OZGLHKhBXo90lF151VOz7B9r97EkGrROGsbQboyyYr97
 NX1BVy3/R+S6GUScXQv5v9V3wo46fvwYIfmfEJnPv23/yDCuB9lXGaYlBWPwpygQv08i
 G4xQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=O9F5U+eG
Subject: [Buildroot] [PATCH 1/1] package/liquid-dsp: bump to version 1.6.0
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/jgaeddert/liquid-dsp/releases/tag/v1.6.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/liquid-dsp/liquid-dsp.hash | 2 +-
 package/liquid-dsp/liquid-dsp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/liquid-dsp/liquid-dsp.hash b/package/liquid-dsp/liquid-dsp.hash
index 6fdbd62a86..4e18f3caa2 100644
--- a/package/liquid-dsp/liquid-dsp.hash
+++ b/package/liquid-dsp/liquid-dsp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  93003edb6e74090b41009b1fae6f273a3e711dc4c8c56a0cca3e89167b765953  liquid-dsp-1.5.0.tar.gz
+sha256  6ee6a5dfb48e047b118cf613c0b9f43e34356a5667a77a72a55371d2c8c53bf5  liquid-dsp-1.6.0.tar.gz
 sha256  4df7126196efba1283deb99e3269418dde4ab0ad1fde80a55051153451eb4df2  LICENSE
diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index a96d4cab79..0ff7b73a60 100644
--- a/package/liquid-dsp/liquid-dsp.mk
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIQUID_DSP_VERSION = 1.5.0
+LIQUID_DSP_VERSION = 1.6.0
 LIQUID_DSP_SITE = $(call github,jgaeddert,liquid-dsp,v$(LIQUID_DSP_VERSION))
 LIQUID_DSP_LICENSE = MIT
 LIQUID_DSP_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
