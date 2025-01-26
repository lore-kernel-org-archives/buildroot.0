Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239CFC02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 15:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB56B408E2;
	Sun, 26 Jan 2025 15:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id woRC0kJmusM0; Sun, 26 Jan 2025 15:47:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2AFB405AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2AFB405AA;
	Sun, 26 Jan 2025 15:47:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E2DB0941
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0F546072B
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t8qzSf5IBbXd for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 15:47:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 653A760C2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 653A760C2E
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 653A760C2E
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:47:45 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a9caa3726fso10000755ab.1
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 07:47:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737906464; x=1738511264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0tdZgcnYWv5xvY/BAAn18zaAF/kFuzXNxdyGuCjoM+8=;
 b=ZBr4XVhMuD6LbFmb53q9p4b/MLPOFURWDbCD/1DPRKcBKVM+Xr00uao+h6gmvzpuG8
 2r2IMG0+qGgIAyLF5A8tAjHxxE+q29wMGrWPkChfyneWojGZZkMy7uSAxNuyf6X25JSR
 mJBP91AsQzFDGKcSTSdk7joi2pbtzOJ67StGiGPDVO59vvUHuBI/+Bh8LM1DS/ksNa/k
 /QR+i06FtRxsXK3kjcX3eNLTABbMqdmtAZnFL6LSgzDrvl4VZ5lIbes+zKnCprDvgHef
 LebTzZ+XUYp03WliODvGD+P3aH0lR6y+4FGCtiUK9ob8lJ3TArw8ovu86EbhSmwFfSMe
 JV3w==
X-Gm-Message-State: AOJu0Yyv8NJeFk7XsrjR0cCzWiAyGRkJ06oBgPWYzZTyLbgGoLHB84Sp
 oXpaQq7F7PFGcDfcZ9IeKbxn4dItTDcLHCXkziDXz4ldlTpBlHldle5MHdL8
X-Gm-Gg: ASbGncurNJexSaG878Yk5umFCrihOCJhpJPV2GuPVSsoKr7hopFegFW8y2jmCF5CU8m
 K44fEY4UbwR0nveXRo9eALa2kESbZJSOHpjz+KgZEybSVeK4EZ0hRFNOm274kdxYETPBhA++cnt
 2NYUiiaBI4WHSFDXe2u9GGR1pTvzXQ0Q+QeXVu1NQgNI93tjJgT+qIk7OH+000ckiybll1ts7ZO
 HNmhCXtxtnwxiDBJKBho6Cx/ZKq7Ja8BD05nB1aW+bsn/CSdKf/aYdPMvgo5IO9647/rtUjd6bx
 ai9LgoRTLO6jSVlM1zk/ByqBK9Ic5wMQ6IiLjpJQqrZGXbaG4zCRhcA=
X-Google-Smtp-Source: AGHT+IGbPM5/Z7z2B97BZgmFOhx24OvXvR47AJpQYTkZx64J1x2LEdV1ku/+LJs53DR1rAoQoVPQKw==
X-Received: by 2002:a05:6e02:148a:b0:3cf:b2ca:39b7 with SMTP id
 e9e14a558f8ab-3cfbc12fc2cmr118283415ab.3.1737906464086; 
 Sun, 26 Jan 2025 07:47:44 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3cfc74ea0afsm20900715ab.47.2025.01.26.07.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 07:47:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 26 Jan 2025 08:47:25 -0700
Message-Id: <20250126154732.405055-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250126154732.405055-1-james.hilliard1@gmail.com>
References: <20250126154732.405055-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737906464; x=1738511264; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0tdZgcnYWv5xvY/BAAn18zaAF/kFuzXNxdyGuCjoM+8=;
 b=dZ01Ji57CkrSaawTqfwIgm9o5O7ZrwrutLHU6VgSnIEGi1lNgyqMbN+nIXwqdJBzsU
 8ev59tAnMyBoh+3wHGIi86MWHS87WYKR4hk+2s2dpoM4Ok/8jrmYxt0+yhpNc214Mlba
 mK/oQiRuYZWwk5+9Qh1FK1HNyG46vUWSFv0MHbKQE1NydL1QpLY0PAuDXm9ic/XAjDOk
 Q71JhN+Tc5B59SNAp3SKB+FVuH0FiDzjNRmV+2KnEUz9rXliBf+7tF8nDiyjkS1wVcHP
 Ohpa872WweUwLR/EZLJtHfZTgdrGYjaesxFzFS4EiavuSsU/gf606JYAW7yThxW5aXle
 VTbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dZ01Ji57
Subject: [Buildroot] [PATCH v7 03/10] package/gemmlowp: new package
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

From: Stefan Hager <stefan.hager@ginzinger.com>

This package is required by tensorflow-lite.

Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v6 -> v7:
  - update to latest version
Changes v4 -> v5:
  - add comment indicating library is header only
Changes v2 -> v3:
  - add C++11 dependency
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/gemmlowp/Config.in     | 12 ++++++++++++
 package/gemmlowp/gemmlowp.hash |  4 ++++
 package/gemmlowp/gemmlowp.mk   | 16 ++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/gemmlowp/Config.in
 create mode 100644 package/gemmlowp/gemmlowp.hash
 create mode 100644 package/gemmlowp/gemmlowp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 75c4ce2990..461582c62f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3034,6 +3034,7 @@ F:	package/ti-gfx/
 
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
+F:	package/gemmlowp/
 F:	package/ruy/
 
 N:	Stefan Nickl <Stefan.Nickl@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index f982b7332a..594ee41d06 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2190,6 +2190,7 @@ menu "Other"
 	source "package/fxdiv/Config.in"
 	source "package/gconf/Config.in"
 	source "package/gdal/Config.in"
+	source "package/gemmlowp/Config.in"
 	source "package/gflags/Config.in"
 	source "package/gli/Config.in"
 	source "package/glibmm/Config.in"
diff --git a/package/gemmlowp/Config.in b/package/gemmlowp/Config.in
new file mode 100644
index 0000000000..379450d1b0
--- /dev/null
+++ b/package/gemmlowp/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_GEMMLOWP
+	bool "gemmlowp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	help
+	  Low-precision matrix multiplication.
+
+	  https://github.com/google/gemmlowp
+
+comment "gemmlowp needs a toolchain w/ C++11"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/gemmlowp/gemmlowp.hash b/package/gemmlowp/gemmlowp.hash
new file mode 100644
index 0000000000..07b15e0e5f
--- /dev/null
+++ b/package/gemmlowp/gemmlowp.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  c3feb896a1b42595cf9a508ed64ed0dc3cd84fffdb8eed790d02d0534ab322ce  gemmlowp-16e8662c34917be0065110bfcd9cc27d30f52fdf.tar.gz
+# License files, locally calculated
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/gemmlowp/gemmlowp.mk b/package/gemmlowp/gemmlowp.mk
new file mode 100644
index 0000000000..708a82169a
--- /dev/null
+++ b/package/gemmlowp/gemmlowp.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# gemmlowp
+#
+################################################################################
+
+GEMMLOWP_VERSION = 16e8662c34917be0065110bfcd9cc27d30f52fdf
+GEMMLOWP_SITE = $(call github,google,gemmlowp,$(GEMMLOWP_VERSION))
+GEMMLOWP_LICENSE = Apache-2.0
+GEMMLOWP_LICENSE_FILES = LICENSE
+GEMMLOWP_INSTALL_STAGING = YES
+# Only installs a header
+GEMMLOWP_INSTALL_TARGET = NO
+GEMMLOWP_SUBDIR = contrib
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
