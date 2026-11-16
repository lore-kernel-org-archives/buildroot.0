Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41979606A32C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=E3vUrpOQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dpBY5uL6
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3155480F83;
	Mon, 16 Nov 2026 15:57:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I7rGPhhZ5xfq; Mon, 16 Nov 2026 15:57:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3AB7780F8D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794844625;
	b=GsS7NRKDL7YJc8KBSnTYW147FDO0jceEm7ifYxYt1EwRAYrXnOz/c0Ox93cyN2J53Mw2
	 svkvKoOtoSYYXlZ9n68ZLYJW8ZhrSe4m38sN/P7H/DDD0eJRT6Jnncp3O0yQQRpY+ZyAC
	 EOYSugvJplpMOgHcsiju/E59hr8jcn4e9+FK4kv5f0RyBibZ7Ea5fFD2GeU4jKmwuRSTF
	 smp8IHa7r1ezvU+Veu8RT95rij418EKVDwofHiwW38mFbu9dhqW5ELqd3BWJAkcpIbN+k
	 0jn6uqZiHm1L50tgMK8KZv/AV8h1RZl9LMy4PWv+phNFXJURFkbeCE4Ic9/ZewjTl4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794844625;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=BW7AhJ6g5L/bSES9d3syRekKV5aPM/YrdonKWFQBlOM=;
	b=q/uULkdlyMaUPIbRaj8gq9sNxpBa83Y6lsRn4KZZNwja/uMyaT+GdDVnox4xJEJ0WN76
	 LHzckBPcE07BBQBnTXl1NrocIzD0WvoF8aU7YvSH6nOADu1Qfi+MzCbJdZgGEqeyY67TK
	 uk2zWyC74gbS27LXHo0SyHYM99MgaqKsfdAIxtS7y/hxkgzDcpnZWakfLnLaj7hgYe6AP
	 CNZkH0ndere9WjOUbZHP2kIlNC/JBzzAESoF9+3Q5zgQsPljs0hjrR254O5i5dZ1kg4a7
	 LX2mQEnNSZwdlmcKDufgUBbKW1Gknbtchuw7XKsImSR4HlrdN/YhJn35gIqHNvlNNig==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dpBY5uL6;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794844625;
	bh=BW7AhJ6g5L/bSES9d3syRekKV5aPM/YrdonKWFQBlOM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E3vUrpOQ1bO28b7lqkP32p8y+O3BCcuK4kVfkP/B2bya8vcaUaSQnz3oRGMYMTDDz
	 zy4IrpiNm+9MxT5HcjJwCA05TuexSYva7tmEZpWQ0QFPuBM839TziapLIatbs2JfGy
	 whTyMB+FfP09/Ap9Qaw6uKN3LDHDwhVFM11b7LgsZcp3jBr5hThYytnirzyIg923jq
	 C/fCTARRN0Y9CbIH3JTmNXfWP8moupnLBkTbMev6X6LoaeXAfKV4OIvD+cBETL8Bsb
	 wwHusM5N2uA9lVgIYjnWZi62jdt8GSqMubHanuuW7AJP3aBxob/kb/Acp8Gjkn3Zow
	 aF6FZ4hO1eFzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AB7780F8D;
	Mon, 16 Nov 2026 15:57:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DEB2169
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4320980F83
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3zCIyNXhepQ5 for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:57:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DAABD80F82
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=dpBY5uL6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DAABD80F82
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:57:00 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4bb64ef5a14so17847995e9.1
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794844619; x=1795449419; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eQxpLC2kUaJfbFlpbJZNfb/P1aTtMCyfzoh1YAIkl7Q=;
 b=dpBY5uL6NHqjV/VGnZtRGBY5pvjyOa0ZbCplt4t4sDPWFT24Zzk3THN7SXXKpfyJRi
 td7t51UOP8cnbifa5CxGwqyST11UFDlRERZzl9jmS5rcW+npWrRZyVz+UvtQ2FjU45m+
 aZ+2l1km0Hxt7y0TYKrm4s2UjBc7b3+SWzwpduvnywawrzCoHzBD5Ku/EX8DJEZket76
 FnYetvfBkfjo4vz5iBJisU/aBiQi0Tm11QEnSqtAKfuTI2x/jSANVI71MpbSVLoYAuHj
 5hp7IHbWShr3ic97gvb3Mg/SiCi5Uzajr+bJ4qgt6FDbFTBqmaQTq/1VzwMHD3DDLmwx
 x/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794844619; x=1795449419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=eQxpLC2kUaJfbFlpbJZNfb/P1aTtMCyfzoh1YAIkl7Q=;
 b=WUC1k4u2Ky2iHzNtBolZpSa1DAEO1tC/D0l2pmY07DrVApIxgce3ygSNoSRGlmcTFt
 3cT1hFQceN+Agu8+QexUvYX0JUOC0Jewz9Ul0m7CNwEMkx8VKh9T2hXXJWXYXRs3XyOx
 dYkWw68pkppa6CecxtJnnzQ344EC42oi0jOjBRxZE0I4si3wCF0OyXsAwoDQIJULijG0
 lQ16+xOJ+VdxwxIuwfr4TuKGhT57sMwHLC81fU0zYJ+EIlMstzaupyfibuAu06CXLmcx
 pF051j3wSO4Jnf9dAPXmaT1VKUwSIYx2eU162zxpjc/Yf5IZiUQhqM7lCQSTD3sQbcwm
 j5Pw==
X-Gm-Message-State: APuU4Z8/dcTli7scytiUcZOLSMnsPc0AyITwd0G3xVQ8737XiL0n+520
 v3k5AMwyk2x/3OEiTO4zcc70+uvi4pSPFx4vihOV/g1FgIs2/7fuAhNKwmr07xj5
X-Gm-Gg: AYBFou2bHHtaKAsBHeq5fgnFGJ35RWOfH9dzAcMPYn6rRaBfxYQJiVcMIPrM5J2bDOi
 suNJq8rin4RccHvIsaiXFoarWHaM0fLmlEtRB1M5E0xklmkn2D4IKuY8YssW5FfA4qmYc/JKEqd
 +SEWdgzxayFA00bx8owzAwt6bn5k+prqAXlnIfU/ePiJqCDvJh4Q8VGYSnUHqMjood+59nFsviz
 1NGQY94VKzZ0ZQqN3WApsTUV7m9/Yr/eDo1a2PAQAonW06w6b+9Waffi8lfyViWnnsoWRR7kzVJ
 K1lXg9Ia7WUFr67G5njzYPEhLKqF0dlP702oj2eFj5Llpb+Jetjbt4v43Z/tg8CKYuNzetfNzLE
 bxXrRLGkfxLhFwcF4Y3nc8FRG/oP9Vd6VZ/9E9tx8QqAX6OyTWrGCTizWyPdq1PzVujtazVlfEg
 2RMXPXJPrIdnYyuTxKcsarRm4p/1ZlmN3w2tosfRJM4Qp5iLUQS5rC8nuP0430aOGZlABcaXNdW
 NoqfZLf7J4KIilGQ0FYZr2wXuNDsrf/wmEyfvp/xAR3VhAIwH2hYjJRuwvoxEUCq7fZChRlnLR2
 oKTprOfB5MDEkle7I4ymFMNt7uYpxlT97Bk3ZekcirS2RHD/bZmz
X-Received: by 2002:a05:600c:4f90:b0:4b7:6c16:7b43 with SMTP id
 5b1f17b1804b1-4bb55a47602mr228698925e9.10.1794844618502; 
 Mon, 16 Nov 2026 07:56:58 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c1968sm23357063f8f.10.2026.11.16.07.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:56:57 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Dylan Bespalko <dylan.bespalko@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 16 Nov 2026 16:56:51 +0100
Message-ID: <20261116155652.4181839-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116155652.4181839-1-angelo.compagnucci@gmail.com>
References: <20240812080307.553359-1-dylan.bespalko@gmail.com>
 <20261116155652.4181839-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 2/3] package/python-pyside6: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Dylan Bespalko <dylan.bespalko@gmail.com>

PySide6 is the official Python binding of Qt6, from the Qt for Python
project. It is built with the Shiboken6 generator, from the same
release tarball.

The bindings are built only for the Qt6 modules that are enabled in
the configuration.

A PySide6 program needs a Qt platform plugin. Select one with
BR2_PACKAGE_QT6BASE_DEFAULT_QPA at build time, or with the
QT_QPA_PLATFORM environment variable at run time.

pyside-tools is not packaged. It holds pyside6-uic and pyside6-rcc,
but the Qt host tools do the same job and write Python code:

  $(HOST_DIR)/libexec/uic -g python
  $(HOST_DIR)/libexec/rcc -g python

Buildroot has Python bindings for Qt5 only, in python-pyqt5. This
package adds the bindings for Qt6.

Signed-off-by: Dylan Bespalko <dylan.bespalko@gmail.com>
Co-authored-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v3 -> v4:
  - Split from the python-shiboken6 patch
  - Bump to 6.11.3. The package moves to package/qt6/, follows
    QT6_VERSION and uses the tarball of python-shiboken6
  - Depend on BR2_PACKAGE_QT6_GL_SUPPORTS instead of selecting it: it
    is a blind option. Depend on BR2_PACKAGE_LLVM_ARCH_SUPPORTS too
  - Drop --compiler-path=$(HOST_DIR)/bin/clang: shiboken already uses
    the cross compiler in a cross build. Drop STANDALONE=ON: it is for
    wheels that bundle Qt
  - Fix the condition of OpenGLWidgets. Add the Quick modules only when
    qt6declarative has Quick support
  - Keep the upstream order of the modules in MODULES: they are built
    in that order
  - Help text: point to "uic -g python" and "rcc -g python" instead of
    pyside-tools [Dylan Bespalko]
  - DEVELOPERS: v3 added an entry for Dylan. v4 does not: the packages
    are now in package/qt6/, which already has maintainers. Dylan, tell
    me if you want to be listed

 package/qt6/Config.in                         |  1 +
 package/qt6/python-pyside6/Config.in          | 32 +++++++
 .../qt6/python-pyside6/python-pyside6.hash    |  9 ++
 package/qt6/python-pyside6/python-pyside6.mk  | 86 +++++++++++++++++++
 4 files changed, 128 insertions(+)
 create mode 100644 package/qt6/python-pyside6/Config.in
 create mode 100644 package/qt6/python-pyside6/python-pyside6.hash
 create mode 100644 package/qt6/python-pyside6/python-pyside6.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 42a24f0c0a..b6295ed295 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -43,6 +43,7 @@ menuconfig BR2_PACKAGE_QT6
 
 if BR2_PACKAGE_QT6
 
+source "package/qt6/python-pyside6/Config.in"
 source "package/qt6/python-shiboken6/Config.in"
 source "package/qt6/qt6base/Config.in"
 source "package/qt6/qt6charts/Config.in"
diff --git a/package/qt6/python-pyside6/Config.in b/package/qt6/python-pyside6/Config.in
new file mode 100644
index 0000000000..1b1a2ecc04
--- /dev/null
+++ b/package/qt6/python-pyside6/Config.in
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_PYTHON_PYSIDE6
+	bool "python-pyside6"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_QT6
+	depends on BR2_PACKAGE_QT6_GL_SUPPORTS # QtGui OpenGL classes
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # python-shiboken6
+	select BR2_PACKAGE_PYTHON_SHIBOKEN6
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_QT6BASE_OPENGL
+	select BR2_PACKAGE_QT6BASE_WIDGETS
+	select BR2_PACKAGE_OPENSSL if BR2_PACKAGE_QT6BASE_NETWORK # QtNetwork SSL classes
+	help
+	  Qt for Python: the official Python bindings of Qt6.
+
+	  The bindings cover the Qt6 modules that are enabled.
+
+	  A PySide6 program needs a Qt platform plugin. Select one
+	  with BR2_PACKAGE_QT6BASE_DEFAULT_QPA at build time, or with
+	  the QT_QPA_PLATFORM environment variable at run time.
+
+	  pyside6-uic and pyside6-rcc are not installed. To convert
+	  .ui and .qrc files to Python, use the Qt tools:
+	  "$(HOST_DIR)/libexec/uic -g python" and
+	  "$(HOST_DIR)/libexec/rcc -g python".
+
+	  https://doc.qt.io/qtforpython-6/
+
+comment "python-pyside6 needs an OpenGL-capable backend"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_QT6
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_QT6_GL_SUPPORTS
diff --git a/package/qt6/python-pyside6/python-pyside6.hash b/package/qt6/python-pyside6/python-pyside6.hash
new file mode 100644
index 0000000000..739dc15ea9
--- /dev/null
+++ b/package/qt6/python-pyside6/python-pyside6.hash
@@ -0,0 +1,9 @@
+# From https://download.qt.io/official_releases/QtForPython/pyside6/PySide6-6.11.3-src/pyside-setup-everywhere-src-6.11.3.tar.xz.sha256
+sha256  050819cb05e14d6689f42b56e4fa9c8ff63be2bb339e0c094c45b990b7cabde1  pyside-setup-everywhere-src-6.11.3.tar.xz
+
+# Hash for license files
+sha256  62803a6fcceef9091a129d7293d2469ea332b35d30f5e1bc4c628a9f35f3d29c  LICENSES/BSD-3-Clause.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/python-pyside6/python-pyside6.mk b/package/qt6/python-pyside6/python-pyside6.mk
new file mode 100644
index 0000000000..28656d8f18
--- /dev/null
+++ b/package/qt6/python-pyside6/python-pyside6.mk
@@ -0,0 +1,86 @@
+################################################################################
+#
+# python-pyside6
+#
+################################################################################
+
+# Qt for Python must have the same version as Qt6
+PYTHON_PYSIDE6_VERSION = $(QT6_VERSION)
+PYTHON_PYSIDE6_SITE = https://download.qt.io/official_releases/QtForPython/pyside6/PySide6-$(PYTHON_PYSIDE6_VERSION)-src
+PYTHON_PYSIDE6_SOURCE = pyside-setup-everywhere-src-$(PYTHON_PYSIDE6_VERSION).tar.xz
+PYTHON_PYSIDE6_DL_SUBDIR = python-shiboken6
+PYTHON_PYSIDE6_SUBDIR = sources/pyside6
+PYTHON_PYSIDE6_LICENSE = \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 (bindings), \
+	GPL-3.0 with Qt-GPL-exception-1.0 (tools), \
+	BSD-3-Clause (examples, cmake)
+PYTHON_PYSIDE6_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
+PYTHON_PYSIDE6_CPE_ID_VENDOR = qt
+PYTHON_PYSIDE6_CPE_ID_PRODUCT = pyside
+PYTHON_PYSIDE6_SUPPORTS_IN_SOURCE_BUILD = NO
+PYTHON_PYSIDE6_INSTALL_STAGING = YES
+
+PYTHON_PYSIDE6_DEPENDENCIES = \
+	host-python-shiboken6 \
+	python-shiboken6 \
+	qt6base
+
+# The modules are built in the order of this list, and a module needs
+# the ones before it. Keep the order of ALL_ESSENTIAL_MODULES and
+# ALL_OPTIONAL_MODULES in sources/pyside6/cmake/PySideHelpers.cmake.
+PYTHON_PYSIDE6_MODULES = \
+	Core \
+	Gui \
+	Widgets \
+	$(if $(BR2_PACKAGE_QT6BASE_PRINTSUPPORT),PrintSupport) \
+	$(if $(BR2_PACKAGE_QT6BASE_SQL),Sql) \
+	$(if $(BR2_PACKAGE_QT6BASE_NETWORK),Network) \
+	$(if $(BR2_PACKAGE_QT6BASE_TEST),Test) \
+	$(if $(BR2_PACKAGE_QT6BASE_CONCURRENT),Concurrent) \
+	$(if $(BR2_PACKAGE_QT6BASE_DBUS),DBus) \
+	$(if $(BR2_PACKAGE_QT6BASE_XML),Xml) \
+	OpenGL \
+	OpenGLWidgets
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+PYTHON_PYSIDE6_DEPENDENCIES += qt6declarative
+PYTHON_PYSIDE6_MODULES += Qml
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE_QUICK),y)
+PYTHON_PYSIDE6_MODULES += \
+	Quick \
+	QuickControls2 \
+	$(if $(BR2_PACKAGE_QT6BASE_TEST),QuickTest) \
+	QuickWidgets
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_QT6SERIALPORT),y)
+PYTHON_PYSIDE6_DEPENDENCIES += qt6serialport
+PYTHON_PYSIDE6_MODULES += SerialPort
+ifeq ($(BR2_PACKAGE_QT6SERIALBUS),y)
+PYTHON_PYSIDE6_DEPENDENCIES += qt6serialbus
+PYTHON_PYSIDE6_MODULES += SerialBus
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_QT6SVG),y)
+PYTHON_PYSIDE6_DEPENDENCIES += qt6svg
+PYTHON_PYSIDE6_MODULES += Svg SvgWidgets
+endif
+
+# The Qt headers are in the sysroot, so shiboken takes them for system
+# headers and skips them. PYSIDE_TREAT_QT_INCLUDE_DIRS_AS_NON_SYSTEM
+# makes it process them.
+PYTHON_PYSIDE6_CONF_OPTS = \
+	-DBUILD_TESTS=OFF \
+	-DMODULES="$(subst $(space),;,$(strip $(PYTHON_PYSIDE6_MODULES)))" \
+	-DPYSIDE_TREAT_QT_INCLUDE_DIRS_AS_NON_SYSTEM=ON \
+	-DQFP_SHIBOKEN_HOST_PATH=$(HOST_DIR) \
+	-DQFP_PYTHON_HOST_PATH=$(HOST_DIR)/bin/python3
+
+$(eval $(cmake-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
