Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EE4C001DF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 13:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C64B81F06;
	Tue, 25 Jul 2023 13:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C64B81F06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pX8rVrSy38vM; Tue, 25 Jul 2023 13:52:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 519D681FC7;
	Tue, 25 Jul 2023 13:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 519D681FC7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69FE91BF84C
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43CFE81FC6
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43CFE81FC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xOsu6aVWCIQv for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 13:51:21 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A5DA81FCE
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 13:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A5DA81FCE
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3144098df56so5225160f8f.2
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 06:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690293079; x=1690897879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LWnybChdS3mnXne6M8VecegH2r2V2gs3uTxUvqBYt6k=;
 b=LgL8b3cYqoL1QnHZ8mzaGo0HLnFVUc+zwWoh21Hu/mq+UEA1SOWi49c6h2kQijzEIY
 KlIwHWve7fQPDi07Ji4BVf3h5dwU6HYWs+kWnbdgABoN0danbX4ozQJVMM0norA7l4t5
 dhryRSyB0ejCAhM9AbQQPo472xOSx7me7pZImMJv0ZjA1Dbh/xEIx+j8o6SiqN5XIrHc
 uHN+y9orlax7j/tbpq8fOaSAtoLV7Mu1NwH5/aMELJZ/19b/uNaCD+kTSABwuodEp3CY
 b5m0Cnc2G/VblMxkF9PDp6tXn5lajMZJHtW0fpjkzmF0isDW/3uYp+V0YL3GJUHe8a4g
 fOuA==
X-Gm-Message-State: ABy/qLaEwsI2YDPj6W/LblcQjBGz1o70CZuMf2/MbAk6Kya5oLlJ0lfx
 MUt5OIahRxk6TyCPJ4jZFfWU2d/ugDfVc1YDTPQ=
X-Google-Smtp-Source: APBJJlH7DtBOZOpVOhy/kqc6103CXB8P6+GSJjgd5oD9Y9rIcbLsAjt380hH1hYNKfzhFASIC1ohPg==
X-Received: by 2002:adf:d4ce:0:b0:317:3b13:94c3 with SMTP id
 w14-20020adfd4ce000000b003173b1394c3mr8987122wrk.41.1690293078973; 
 Tue, 25 Jul 2023 06:51:18 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:e537:2825:8aee:d1db])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a5d6150000000b00313e59cb371sm16604581wrt.12.2023.07.25.06.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 06:51:18 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 15:51:00 +0200
Message-Id: <20230725135105.536310-6-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230725135105.536310-1-sebastian.weyer@smile.fr>
References: <20230725135105.536310-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690293079; x=1690897879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LWnybChdS3mnXne6M8VecegH2r2V2gs3uTxUvqBYt6k=;
 b=Afa7tMw8epctYklDH1mAqk7LRhDajvnUKz8qBHtNZ4vWlptK88Bit8IZXxG0yh9pZH
 gqY7Ghm2IB2JvhJ3bAIB2jdoz4exHAmkkPX5Lf7vSjUhc8+j3s//3o6ebWYaUZdPkAgF
 QzDAOjbLhPA8xoXJBd2dXaWRRaeJg8ZRiBoroMuqVrErGil5CCjWmgO03O1eK/T+Fj6P
 LrXY2hqfd7U76y2OxDbeQfIWugToZbhyurxbf7FxLIly4DKsBjtjgf+SRc4XI2dOmO2O
 X/OikKwcKssZ9yyuEU+/puF9dgUvjKIKNBxQrTsktD0teQ+bDllzTLWUz2OIa4euqlVa
 yn3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=Afa7tMw8
Subject: [Buildroot] [PATCH 5/9] package/spirv-tools: new package
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
Cc: Romain Naour <romain.naour@smile.fr>, Samuel Martin <s.martin49@gmail.com>,
 Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Romain Naour <romain.naour@smile.fr>

This package is required by mesa3d for building rusticl:

https://docs.mesa3d.org/rusticl.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 package/Config.in                    |  1 +
 package/spirv-tools/Config.in        | 12 ++++++++++++
 package/spirv-tools/spirv-tools.hash |  2 ++
 package/spirv-tools/spirv-tools.mk   | 22 ++++++++++++++++++++++
 4 files changed, 37 insertions(+)
 create mode 100644 package/spirv-tools/Config.in
 create mode 100644 package/spirv-tools/spirv-tools.hash
 create mode 100644 package/spirv-tools/spirv-tools.mk

diff --git a/package/Config.in b/package/Config.in
index 931b0cc21e..aa917264d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -327,6 +327,7 @@ comment "Graphic applications"
 	source "package/qt5cinex/Config.in"
 	source "package/rrdtool/Config.in"
 	source "package/spirv-headers/Config.in"
+	source "package/spirv-tools/Config.in"
 	source "package/stellarium/Config.in"
 	source "package/sway/Config.in"
 	source "package/tesseract-ocr/Config.in"
diff --git a/package/spirv-tools/Config.in b/package/spirv-tools/Config.in
new file mode 100644
index 0000000000..21b3852779
--- /dev/null
+++ b/package/spirv-tools/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_SPIRV_TOOLS
+	bool "spirv-tools"
+	depends on BR2_USE_WCHAR # python3
+	depends on BR2_USE_MMU # python3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
+	depends on !BR2_STATIC_LIBS # python3
+	select BR2_PACKAGE_PYTHON3
+	help
+	  The SPIR-V Tools project provides an API and commands for
+	  processing SPIR-V modules.
+
+	  https://github.com/KhronosGroup/SPIRV-Tools
diff --git a/package/spirv-tools/spirv-tools.hash b/package/spirv-tools/spirv-tools.hash
new file mode 100644
index 0000000000..6861f543ea
--- /dev/null
+++ b/package/spirv-tools/spirv-tools.hash
@@ -0,0 +1,2 @@
+sha256  645c4585c207cbdfda81a09f8ab180773c18df50fad9644d2d9a53b4464c692b  spirv-tools-1.3.246.1.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/spirv-tools/spirv-tools.mk b/package/spirv-tools/spirv-tools.mk
new file mode 100644
index 0000000000..758c01343c
--- /dev/null
+++ b/package/spirv-tools/spirv-tools.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# spirv-tools
+#
+################################################################################
+
+SPIRV_TOOLS_VERSION = 1.3.246.1
+SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,sdk-$(SPIRV_TOOLS_VERSION))
+SPIRV_TOOLS_LICENSE = Apache-2.0
+SPIRV_TOOLS_LICENSE_FILES = LICENSE
+
+SPIRV_TOOLS_DEPENDENCIES = python3 spirv-headers
+
+SPIRV_TOOLS_INSTALL_STAGING = YES
+
+SPIRV_TOOLS_CONF_OPTS = \
+    -DSPIRV-Headers_SOURCE_DIR=${STAGING_DIR}/usr \
+    -DSPIRV_TOOLS_BUILD_STATIC=OFF \
+    -DBUILD_SHARED_LIBS=ON \
+    -DSPIRV_SKIP_TESTS=ON \
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
