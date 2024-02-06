Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6356DC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35589831FB;
	Tue,  6 Feb 2024 17:53:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VRSIm65-8RFf; Tue,  6 Feb 2024 17:53:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C3BB831CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C3BB831CA;
	Tue,  6 Feb 2024 17:53:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D36371BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7CD240B67
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7CD240B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7-cZwYEdpoms for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:53:36 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E39E140A39
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E39E140A39
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33b0f36b808so3871153f8f.3
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 09:53:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707242014; x=1707846814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bxtNgcRnbYjEva5iy/B5wvYzQk7SqnlJWMKNSwap+MY=;
 b=V8HHhj0Ob+VdFt2xg89DlGLopZTqNznpkLTosZ8mxxHYdV2jWTdMq3b4gAkcPsBDEg
 NSYHoqSKL4AYJLqzAQU6FPfAxSxu2SlCBTWm0Ix5yzOMar5s+NrzIGvuQDH974bbjFq6
 EN4aNeAT1sAJn/dhe4iUiyzXZnfsaiivg1lD0iDVC38iGGKz/Cem3EmcoAU4vHjN0qZL
 /mCEr6TC5NeMBNK4m54IGk4wR2u38JKIIsc0SJude+nfOr14ApJuOt3ABVpnV7PZAQ6d
 n/lil4vJLmKPP9XyUDPqGi/vFZv28Ja2N9eR6k0PcX2WCcAt06q53/ECGKmW4mSva2Jl
 3pJg==
X-Gm-Message-State: AOJu0Yx1hhuenByYPoP7I8nKkP8gIssKdIK5v4WXlUuXoTsll+zhoa1f
 pQj43Hia8d5jQBGGbkSpTN4ZK5wqGeWg8Ae2qcx3XDEvxqA1oIuhkhEl1MP2exHZYa5fQU1wgD9
 PkdE=
X-Google-Smtp-Source: AGHT+IEV8QyHUuSedF3nwnuI63g96mKVLVomc35scl8QWFvdcP3JkfvY49iL6P4Hqi5a2iYW4kcHSQ==
X-Received: by 2002:a5d:4451:0:b0:33b:49db:c719 with SMTP id
 x17-20020a5d4451000000b0033b49dbc719mr1438143wrr.39.1707242013375; 
 Tue, 06 Feb 2024 09:53:33 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWDmkTwP30Ld40gvu+FlnOJFDcP8QV9W+bWK1yhAtvyJ0fQqFp6y3Kd/b+0ukZsOOonR7JvWO7FDrtQ/9RcexdimWFAgQYgATqQf/rEiQ3KVVO0l+MLJGILT57q5vMgbmJou0U+
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-17-101-122.retail.telecomitalia.it. [79.17.101.122])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a05640206c100b0055fd90b0556sm1238961edy.90.2024.02.06.09.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 09:53:33 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 18:53:29 +0100
Message-ID: <20240206175330.570115-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206175330.570115-1-dario.binacchi@amarulasolutions.com>
References: <20240206175330.570115-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1707242014; x=1707846814;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bxtNgcRnbYjEva5iy/B5wvYzQk7SqnlJWMKNSwap+MY=;
 b=SXlboLTYqiZvUTKpC8JrbYAiTI3yRoKmuwDZlL8HDfaSogsngeL7ncs29Dvfvuq6a+
 s43cCCwGXUR0kmOHhXDe+CVBS8w1zKhlmh16m/kV26vkoWpz1mVc3UU8pFV1EcwopRbf
 6Nsrx7FRRGPXizJCQN0f7PtVaE3FpoHD8mTgY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=SXlboLTY
Subject: [Buildroot] [PATCH 2/2] package/uuu: bump to version 1.5.165
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
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It requires the host-tinyxml2 package.

The hash of README.md has changed because a reference to the tinyxml2
license has been added:

    + - tinyxml (zlib license) is from https://github.com/leethomason/tinyxml2

Release notes:
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.163
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.165

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 4 ++--
 package/uuu/uuu.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 20816b5081db..c231d5d729f0 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  6972c7a1e76d60a22212913a8867b737104410c2a47ad88c8af460bd4885ec09  uuu_source-uuu_1.5.141.tar.gz
+sha256  6e65fc028afacc94b805ae376e3da3864dcb2570d425037820e716207ab70373  uuu_source-uuu_1.5.165.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
-sha256  2d872c6e5aaea15ec1932bfb378fb62e24ee7ec399fe7f998f03d9b728215335  README.md
+sha256  1b3d030a1824d633f75194743bd92bc1ed2d9a4bf1915bc11e49bf4c0c54012d  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 93c748ee46d8..d1bae61f528e 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.141
+UUU_VERSION = 1.5.165
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
 UUU_LICENSE_FILES = LICENSE README.md
-HOST_UUU_DEPENDENCIES = host-bzip2 host-openssl host-zlib host-libusb host-zstd
+HOST_UUU_DEPENDENCIES = host-bzip2 host-openssl host-zlib host-libusb host-zstd host-tinyxml2
 
 $(eval $(host-cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
