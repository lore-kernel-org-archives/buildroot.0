Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74ACBC47DDB
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 16:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23B7540497;
	Tue, 23 Jan 2024 16:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23B7540497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WfFXWY-MLOvH; Tue, 23 Jan 2024 16:26:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34C634048A;
	Tue, 23 Jan 2024 16:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34C634048A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD31C1BF95C
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 16:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4868403BE
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 16:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4868403BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9gI9yK_JQsVW for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 16:26:00 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FDC040217
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 16:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FDC040217
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e60e137aaso50074025e9.0
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 08:26:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706027158; x=1706631958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=On83pQfddMCkDHDSNBYDbDh3ukN+iw4fm6f2nr1Yo98=;
 b=F76U+mBDWHVFNNd6ETejlWVEZyYHAqVr1wZXSv9dGgD+/ggZzetxlumP+B4tK7d1Iv
 pzVqIYGNQ6IfdBx04+5fb31ZMbro7Eie7+IKowHPw7Pa0Lc0EUe2kmhCmvlyhNDrytrm
 9ARTGGhGzKVsn7Ld5Za1AXahJqe6IDBo5zZdoC1oVJ6VIW4PVKRjwyjP9D31FCliGFbt
 jEgZRvnJYcNPVrvuWStdhtGZ1W9mWzD35azjlm8+lQoaPzO3LgwlFHOzDhGLdso2Unhd
 akoIBKR+50VIYSXIWXeBX6DFoS1NuU077gK/l17seGPalblcBCHEwpKG3rRgwse//w0B
 //AQ==
X-Gm-Message-State: AOJu0YxfIG/MgjKHXiEYM9lTMUZRSEbAL9aLaGe8M4Ht3PfsEBJWDsVN
 Gw4ckt+5bY6VcqRb+I7dvK8scKUzKcY1agkgzjJnT76LpIIzs6eYe6nmhKVX0JzcxuivRn/cM5d
 k
X-Google-Smtp-Source: AGHT+IHkWTH0O1h81C5aeb+yRf1GpWr1PLRfWqumZ2vzDMDFAWfHlOmHDy3jQHJwNyy3ELTPTnnkAw==
X-Received: by 2002:a05:600c:5191:b0:40e:c31f:cec2 with SMTP id
 fa17-20020a05600c519100b0040ec31fcec2mr226362wmb.183.1706027158230; 
 Tue, 23 Jan 2024 08:25:58 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-nan-1-1117-126.w90-12.abo.wanadoo.fr. [90.12.67.126])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a05600c138600b0040d5a9d6b68sm47270550wmf.6.2024.01.23.08.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 08:25:57 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 23 Jan 2024 17:25:48 +0100
Message-Id: <20240123162548.2738451-3-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240123162548.2738451-1-antoine.coutant@smile.fr>
References: <20240123162548.2738451-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706027158; x=1706631958;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=On83pQfddMCkDHDSNBYDbDh3ukN+iw4fm6f2nr1Yo98=;
 b=fU5cG03vdcIWpSn9wl1VWuRVtunAyVNKRlxXPtMKu9uA4C5/2F14kwqP12oSbI/Siy
 5A/VmcCITFcX6jZLGDGTXqEyCB/tSBvB7GvsWMspLHkc1/hHRUcl8wPMS2v/Sgln1Cni
 1sk2thMI8PRh86uewEyxH+m1zyFmcCCpSOUkbX3Rp8z+TLF6f4rp3OCkvOWFRwmcm/1V
 S6zpr/lMh6yakzy0M1ZO/ixR8f+2EwIKf0eiFjXDxRFBjYv+V1d250qhFx47ePUOT9U0
 CJoexIchZlqs03IhIcIerQ/YQP/QgKgW7LloQgrnHHTLzkY7fnKrhjVRRpCFin09Tgrx
 DQng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=fU5cG03v
Subject: [Buildroot] [PATCH] package/dust: bump version to 0.9.0
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The licence have been updated between versions v0.8.3 and v0.8.4.
see:
https://github.com/bootandy/dust/commit/520c439edcba7fd8e8884e19d98f448553e6a42d

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
Tested on qemu_x86_64
---
 package/dust/dust.hash | 4 ++--
 package/dust/dust.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dust/dust.hash b/package/dust/dust.hash
index d4f6bff4e4..8f202d4870 100644
--- a/package/dust/dust.hash
+++ b/package/dust/dust.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  271cc0f1978049b2dbfece633b85d4dd0184df346bd93720062c13e4332f2549  dust-0.8.1.tar.gz
-sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
+sha256  b1712d3bcb7443e892019b0dcfa378d97e8e35f4b21e7ab62523cc30fb974c19  dust-0.9.0.tar.gz
+sha256  aee6e2d13d3a55c7881630c09b41ca7b3b44bb1437b5d36695d22decc3655160  LICENSE
diff --git a/package/dust/dust.mk b/package/dust/dust.mk
index 2cffc336a9..c566723c1c 100644
--- a/package/dust/dust.mk
+++ b/package/dust/dust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DUST_VERSION = 0.8.1
+DUST_VERSION = 0.9.0
 DUST_SITE = $(call github,bootandy,dust,v$(DUST_VERSION))
 DUST_LICENSE = APACHE-2.0
 DUST_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
