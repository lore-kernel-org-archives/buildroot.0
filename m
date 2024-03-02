Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DBBC54798
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 19:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C63BC822BE;
	Sat,  2 Mar 2024 19:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gUdNmQgHuDvE; Sat,  2 Mar 2024 19:12:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2CC5822DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2CC5822DB;
	Sat,  2 Mar 2024 19:12:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B79021BF313
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 19:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A54A9822DB
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 19:12:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9i-_rWacYFqm for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 19:12:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=kazemi.ms@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8F0A9822BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F0A9822BE
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F0A9822BE
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 19:12:22 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a43dba50bb7so460279766b.0
 for <buildroot@buildroot.org>; Sat, 02 Mar 2024 11:12:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709406740; x=1710011540;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pRnWbz3rhFHUy9TNImo5lrPCUKlzm79SpImefdyUhk8=;
 b=cBIXAvWhtfReDQIKzfIUCEGj6n4aCV8lCCPJy87rLJSUF6mLxibFeJJtEQOhqRkTW7
 2HV10c73GVOor4PsRaBoN9reBYUX4wj9phBXAjYDYGa5uawTGBdrZGC5DL92vJDt8ZFV
 iw2ejeXtb783s+35FUFdsLfB9EOxlbtxpVOSViteKgnkgLWhYTs7obppEoZar+bC92yE
 CrClXyrNEPHX/ZkUOIEfhVZvNN/37EnkGy8VEsNWRwz8Gnp8g/sG8Ql+F5x8p3loHjm6
 nPuPcRxO1ancRYbKjK94qH16BObt3myXVKLYQiCkUklVn9xXrM1dscuKMpOwjvZNRxR/
 ZZGA==
X-Gm-Message-State: AOJu0YzpqDTWC6jEJfCAdLh62pO7LlEbBKM4nitJz08TG0jDujK2xZdK
 8mL01+aCi1QcB1obzHL9cV5IpLfxqqzFuKoaw+kfHxEiqiSI98QWfuo9Vnha
X-Google-Smtp-Source: AGHT+IEMUAN97gnmFjbTXBHykhsVBuyHZHUAsvqcKaBtemSu/0Zi/ThMFmEv/cujWq78JaGDFNiCVA==
X-Received: by 2002:a17:906:184e:b0:a44:b90a:8459 with SMTP id
 w14-20020a170906184e00b00a44b90a8459mr2488778eje.53.1709406739777; 
 Sat, 02 Mar 2024 11:12:19 -0800 (PST)
Received: from saeedkazemi-ThinkPad.abbrnd.local
 (2001-1c00-0b13-1d00-8bad-04cc-4d26-e259.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:b13:1d00:8bad:4cc:4d26:e259])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a170906131900b00a44bd00ed4csm1281158ejb.0.2024.03.02.11.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Mar 2024 11:12:19 -0800 (PST)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Mar 2024 20:12:15 +0100
Message-Id: <20240302191215.2743208-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709406740; x=1710011540; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pRnWbz3rhFHUy9TNImo5lrPCUKlzm79SpImefdyUhk8=;
 b=LYkFLCzlsUYaI6opglcsC92Xq7wVzfuSrReEPtgBaHkaRXt+kZZXccsuCRcul/zTl7
 03pKO2vcqW8VSl6BmlsYNhoGMgQGZBuN0h7dHNWfjzwK4X/PkuEXsu4Ayh0vZ0pN8iq+
 T1Tk+pnqZ96n03blxMmOyNdlWvVJpqsOb8uxEC090ePZfj2CHk1O0luW8SvP/ooQ/Hqq
 iPb0gchubNuQd2e35rc2R1t13bkleaF58KdaZs3g+i5RQ2V0J9126+tVmKzR4qe4B5nD
 h04G7rt3zA2uOg4Yo/keb4jrA8bieMoGrdhj3BmMhlNucseiErqsCJ8qiIFXTFHP3+3M
 sMOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LYkFLCzl
Subject: [Buildroot] [PATCH 1/1] package/zoxide: new package
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
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A smarter cd command. Supports all major shells.

https://github.com/ajeetdsouza/zoxide.git

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/zoxide/Config.in   | 11 +++++++++++
 package/zoxide/zoxide.hash |  3 +++
 package/zoxide/zoxide.mk   | 12 ++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/zoxide/Config.in
 create mode 100644 package/zoxide/zoxide.hash
 create mode 100644 package/zoxide/zoxide.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0bfe91f064..60a2544ef5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2733,6 +2733,7 @@ F:	package/biosdevname/
 N:	Saeed Kazemi <kazemi.ms@gmail.com>
 F:	package/eza/
 F:	package/procs/
+F:	package/zoxide/
 
 N:	Sam Lancia <sam@gpsm.co.uk>
 F:	package/lrzip/
diff --git a/package/Config.in b/package/Config.in
index bf0fe078b9..d39d6ec1c2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2707,6 +2707,7 @@ comment "Utilities"
 	source "package/xmlstarlet/Config.in"
 	source "package/xxhash/Config.in"
 	source "package/ytree/Config.in"
+	source "package/zoxide/Config.in"
 endmenu
 
 menu "System tools"
diff --git a/package/zoxide/Config.in b/package/zoxide/Config.in
new file mode 100644
index 0000000000..b2567dad0b
--- /dev/null
+++ b/package/zoxide/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_ZOXIDE
+	bool "zoxide"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  zoxide is a smarter cd command, inspired by z and autojump.
+	  It remembers which directories you use most frequently, so
+	  you can "jump" to them in just a few keystrokes.
+	  zoxide works on all major shells.
+
+	  https://github.com/ajeetdsouza/zoxide.git
diff --git a/package/zoxide/zoxide.hash b/package/zoxide/zoxide.hash
new file mode 100644
index 0000000000..d1a765e3bd
--- /dev/null
+++ b/package/zoxide/zoxide.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  792e66d35bc770609e1dd3858a41f5ba66af24d9801c88a5d117e63d95ef6672  zoxide-0.9.4.tar.gz
+sha256  23aa3b08366e4ed6050f3d9950070201802aadbe5675fa1c19f24f4de91cf294  LICENSE
diff --git a/package/zoxide/zoxide.mk b/package/zoxide/zoxide.mk
new file mode 100644
index 0000000000..92b4395a87
--- /dev/null
+++ b/package/zoxide/zoxide.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# zoxide
+#
+################################################################################
+
+ZOXIDE_VERSION = 0.9.4
+ZOXIDE_SITE = $(call github,ajeetdsouza,zoxide,v$(ZOXIDE_VERSION))
+ZOXIDE_LICENSE = MIT
+ZOXIDE_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
