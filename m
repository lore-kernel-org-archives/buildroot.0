Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB79D5B17D
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 14:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0CA0606AE;
	Tue, 29 Oct 2024 14:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qL0WGkLODVUT; Tue, 29 Oct 2024 14:11:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF9EC608D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF9EC608D7;
	Tue, 29 Oct 2024 14:11:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A4DCEAEE
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 14:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85E9C40AC1
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 14:11:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nl9YA_Nz3XRS for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 14:11:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8708C40A8E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8708C40A8E
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8708C40A8E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 14:11:33 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-20c693b68f5so58959555ad.1
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 07:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730211092; x=1730815892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gTTdEsqsqDghfVg/VjnQkGEohom+aNuatTM5GljFql8=;
 b=Yl8eOCFge3VZIi6BGy5EKrPhj+pI/0feVQosJ0y9eT0LWgBzqFcTD2fVXiz5EqGl08
 qcAcHoo6dsEaCqRFd3NXi7XR5zyA3zVHnMGQj4IE1XLtF/3gdvtRXa2eyv6a9CPS/Cb0
 Hv+OWwFkYGnctF9YVZgppsoS3TuR4QWhzAdFtPMNu224RsvQ8aoC9KQ21IE+tFH5Zd4F
 y+qQOj2eyZpgeb2Z4lfVqLRlNGyhC4zK85588YeKCriGYkOyaZ6NoVV4h/JSq3pv3gAW
 pfbHqNvXI0AH65R0iEZTlqXfcG1SPijSRhEMoRTWui/ADmVrrHXoxC3xn0IgLOgWlbXr
 c/rg==
X-Gm-Message-State: AOJu0YxnCyH4xSMbTGC4Obz/uUt0cYhyht2dP/L98M1vZTI3zeoVXfbZ
 wApRY/HvZ8nIGwLBUohh0eK84Rz1FyLoKr+nH81d9fkYYs++0hpCkwoHnTKh
X-Google-Smtp-Source: AGHT+IFBOWEAUuG0XN+s9Y/ttyAOyC8Qnfm726CW6SnfUc7P+dh/xmKWHQf9CCF+2b1kG6mbimK3Ug==
X-Received: by 2002:a17:902:f549:b0:20c:d2d9:765c with SMTP id
 d9443c01a7336-210c68995c1mr140962665ad.15.1730211090760; 
 Tue, 29 Oct 2024 07:11:30 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bc02ee2dsm66317585ad.218.2024.10.29.07.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 07:11:30 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>
Date: Tue, 29 Oct 2024 22:11:24 +0800
Message-ID: <20241029141125.1065482-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241029135851.1063521-1-fancp2007@gmail.com>
References: <20241029135851.1063521-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730211092; x=1730815892; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gTTdEsqsqDghfVg/VjnQkGEohom+aNuatTM5GljFql8=;
 b=M81bjI8sgKhc00Bpx4b/f2qm9I123zq6/CgsVgE5e9B5MXkuSsC7Yrze2FXu2zVnx/
 EffXIVw6Y+bIgOwzv8ancA3Qcb2oCmT42Z6kDCY4uTA5k29tuXdkEyIOCkTJm2Pg2ocu
 nDvXcgW3vZPSbHImIWQ0y+Zwi+FqNiXoiu+bxmSmUw7gpt1o+bBYa4kYlr0DvV/Xc93i
 qb1STFesDIHtlclQwnfDo1YWgn8JCAqKd6vqS6ua6jG7l+OTSCCiGhSEVAyKeP2f6wZV
 Wx3p5dQkxMQSqH+Tm0gg9v8cvO9pzalAf6iyfRTd2by8ab7qDmwY20GDBQ5Fonpwyy5G
 RmsQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=M81bjI8s
Subject: [Buildroot] [PATCH v3] package/procps-ng: fix typos in config
 option and help text
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The option has been renamed, so add an entry in the
Config.in.legacy file for the old option name.

Signed-off-by: Scott Fan <fancp2007@gmail.com>

---
Changes v1 -> v2:
  - add an entry in the Config.in.legacy file

Changes v2 -> v3:
  - update the entry in the Config.in.legacy file
---
 Config.in.legacy               | 8 ++++++++
 package/procps-ng/Config.in    | 4 ++--
 package/procps-ng/procps-ng.mk | 2 +-
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a041d4da42..30179add23 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2024.11"
 
+config BR2_PACKAGE_PROCPS_NS_ORIGINAL_TOP
+	bool "BR2_PACKAGE_PROCPS_NS_ORIGINAL_TOP has been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_PROCPS_NG_ORIGINAL_TOP
+	help
+	  The option has been renamed to
+	  BR2_PACKAGE_PROCPS_NG_ORIGINAL_TOP.
+
 config BR2_PACKAGE_QEMU_TARGET_NIOS2
 	bool "qemu nios2 support has been removed"
 	select BR2_LEGACY
diff --git a/package/procps-ng/Config.in b/package/procps-ng/Config.in
index 4afd01699b..7af0e97fb4 100644
--- a/package/procps-ng/Config.in
+++ b/package/procps-ng/Config.in
@@ -11,10 +11,10 @@ config BR2_PACKAGE_PROCPS_NG
 
 if BR2_PACKAGE_PROCPS_NG
 
-config BR2_PACKAGE_PROCPS_NS_ORIGINAL_TOP
+config BR2_PACKAGE_PROCPS_NG_ORIGINAL_TOP
 	bool "Use original top layout"
 	help
 	  Disable modern top layout, return to original top with
-	  detail cpu usage.
+	  detailed cpu usage.
 
 endif
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 4ac82cf6f9..c5185c2c8a 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -56,7 +56,7 @@ else
 PROCPS_NG_CONF_OPTS += --enable-w
 endif
 
-ifeq ($(BR2_PACKAGE_PROCPS_NS_ORIGINAL_TOP),y)
+ifeq ($(BR2_PACKAGE_PROCPS_NG_ORIGINAL_TOP),y)
 PROCPS_NG_CONF_OPTS += --disable-modern-top
 endif
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
