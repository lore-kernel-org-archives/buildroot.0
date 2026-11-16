Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD5F606A323
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 21:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HMshBIr7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mWUmApXm
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B36A281046;
	Mon, 16 Nov 2026 21:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9vdLuHhtPg6; Mon, 16 Nov 2026 21:29:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 717D580E17
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794864563;
	b=n/LnI16q3K1Ole/0CWcxac2ooxbeF/ttoCKNaQr6rbNXgEr6G0AdzyFp9srl0Mfw1kEL
	 cXHhFRu0N37cOnzePvegTE7swFWNVh+P1p8ynAJzLn8O1GZ4S36+Mlxqp0XRL4/0MEKH2
	 Ptbc4zKvGreECnW9ONooEDTv5TtnHa/G6Vwy5w0xSoKaIp2Ewo4yaNYY1+aNTDKNhQd7D
	 1dwuNzxEv/yMkYjoQRYnHs/9uxwd+KhijMuEd786YiBVX+zq651ItJpndTwoiyykKgLiM
	 /jHw8JvR2M0Y7Vq8Ovk+bAcGJ0Ox5L9WGau5CCtUTIoXrqfW2f+YIY+u9fFkl5uInig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794864563;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=M0SOzqWGb+3alO24VDzCblyGoZP5CAtIMW5jYVKPGF8=;
	b=EAbHPVthPe7E8iuaUP5m89QqFCJjRE1x8zgug/joGr75O/2VHXp/hzhzI6FTlTPBSss4
	 PIXryzEhqNJElrV6YKfw9FnHr8rC/c/GnQKdkKlNxXp8K8TboEw0cezsdvlLxnMxmJeFM
	 f07tGp7fB6mtQql9RWj847o5TOtSSPWZgbNxaq8NBOZTpOIyxqhAdbTAMlBN0pQ5BwqQU
	 ocahBoZAWkPC6LnFnkNYAOUMqGT3C4Esf86gMjeNAPhBt302HXxXQ8onOlnjcJ2gg3ZLg
	 twzJR6swnFIO02GjcHYzk2o+wnHlXMoiDgIvIpjjOyUPjapBSR5ZVkApEF1KR33fwXA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mWUmApXm;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794864563;
	bh=M0SOzqWGb+3alO24VDzCblyGoZP5CAtIMW5jYVKPGF8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HMshBIr7QhH90ezQ/sKo+B2TUGDWHG28wQjc848owC8V0s8uxBaCzYKzWkf7knO0Z
	 jA1UycQHnZcDqGhQuC7jU5o2hTIbUadg1kbiHmmq2BLFkPzkkUHDww6xTicAWO8GkU
	 yIXW2IMDAw5ztbeBc2Bx79wwnKP5N8fOhTq6tFFTBwL3rgqk4HSotMY3CUAPZnXsOp
	 D3oommZ5vJqayXIG5sNldMt/P6nwPCC8JpTbR8JPqT2udUypGpxJzRsGv2y31LU+fp
	 mhSg8qLiUOOYxEG8//7joewyMzSphUiJo0toeFOkkw9xMgoaZmm8eyAJGvxCEt1fYH
	 OznKQGuKC1RWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 717D580E17;
	Mon, 16 Nov 2026 21:29:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A2CF109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8074680E95
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMXuuae9CZUp for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 21:29:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0F07680DE7
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=mWUmApXm
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F07680DE7
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:29:20 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a207b02a2cso23356235e9.1
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 13:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794864558; x=1795469358; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4f23LIzh8HVm/vTdAJtYUv5W3vqDXLKwZ82FKPPWdog=;
 b=mWUmApXm04efxTSIMkIf3qv1G6mDh7eLWsyLxllc6KyksUpYKfYAvJnMLnigmYx3bM
 Ru0endzy7RL4WuD9xsH3fUcyrvjDJO5ScyyMHbuuxYZ8hf/OTFQp7EYr5CEXd3y0nlBK
 lR7ya8+YP8KI5SVwqxBwv0nPC4FScs8c88BdPY3CeG0nD4kg9Nu2k+44a+d8sIIkCoHK
 Lqtq3A1N5uOn0EgEwrliS35a/tSPEfu00O4MKY+HjSFpwlZS+eMI4CnOGHEDXioI8Gr5
 db95siiCkrhMYTjjpD3Ar1W2UDti6bwOK9DuAM8CTgC5tmZWXPNELR+AIjwTQemPle7p
 zLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794864558; x=1795469358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4f23LIzh8HVm/vTdAJtYUv5W3vqDXLKwZ82FKPPWdog=;
 b=xh/sYUknUBME6/pIWtLcv4OeGzQubB4G5hbUJcJvpfTTkMe09Vlg825CuV2lorojDk
 UIcAbVm4o7DCoqcVC85KrgbZZGNOOFetPQRPAy2Us0wsi9OpDgsjiuNIMn6pKR9lBiNh
 DJoMvamo7NnOKabOfPWZi+f3WerQZiuyCqt0flgryvRj8I1HZY5UNnHZm2CgAD6EhXVn
 7DMTMH8qjkZ4gfRH8iycag3ZUTZeOqjT3HAoWUO5481VlboWQ9TPttbBGfGvE0Yo/2aF
 i0oOQ5FPapA3EgRQ1LjQG5skK02fCeQIT6Ztsyr815mtI/UwULiJpupHOrxHkEcKbjso
 zPAw==
X-Gm-Message-State: APuU4Z+NWxJEuc3Pqk7LOsTU6PXkRtFexl686taOVQoq5pUtKVD0nkG5
 g4UYXdYVVegA9CNUNVUYTDeTel991slMg05PH3E8Gj6wcsEjKRxQuCcOjRJJPckg
X-Gm-Gg: AYBFou3tPosqorHYHwCwEIp2cQre+DqJtXSj163b3tH0jJjz5vEQEsZBNDQhIwZRnEz
 RXSZUzu9bEX+2wEpAeakg2PD8qht8lJirBi2NMbDu2NsiZK9XRnCCwMYXr2a9Co9rPmFw1WD1bO
 LDqAxI/6TwL3GLbuyStotBFp73rbohRxaOnc+B9pxXNeFUXLP8UY++mEal9jNNPmRnBA3VO1R4w
 EVZ+oW/L99hikWn/Pm+rON2iYsMTk15+1r75jZDmpEu6dYbpgggeXIJksJeUie0et9qfIV9XkuC
 kMydir3u7FDWf288vl4M5wQ8HGe2RzJPs6tftbZfa+ioyShAJZC8LTEN3Ff2nF/fag6WNLFpikr
 CLeSSXw8V8aO6JvK66+p4PyGWFjYcYXtOfpb5HwxQS/u5Js/CLB7vFgmUpU6U2FhmsOu3h5bscR
 bIHuxKCpdFK6hvAA8qI1VDMyv9+mUQaEBoh/cEgP830+Uu7ZwYEWaX+G7vvkcBjxQXBDuFzvrxv
 Txoa3nSCeKH9rkVIEGAk4oGogKXmegGYswFsAhrwpUwQ3gfx5K6sxfeYbZ6mNS625QGyyWtNCij
 m4jZLUpKgH6yrlcuCIrbyE27cQOg3+bLRGb6EKvG2BgWq41sj/1j
X-Received: by 2002:a05:600c:4585:b0:4a1:cf60:dcc3 with SMTP id
 5b1f17b1804b1-4bb55a8ccaemr260633785e9.29.1794864558371; 
 Mon, 16 Nov 2026 13:29:18 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5d223a29sm24918708f8f.8.2026.11.16.13.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 13:29:17 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Nov 2026 22:29:09 +0100
Message-ID: <20261116212913.863975-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116212913.863975-1-angelo.compagnucci@gmail.com>
References: <20240812080307.553359-1-dylan.bespalko@gmail.com>
 <20261116212913.863975-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 1/5] package/python-shiboken6: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Dylan Bespalko <dylan.bespalko@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Dylan Bespalko <dylan.bespalko@gmail.com>

There are actually three projects combined in the PySide6 repo:
  - Shiboken6 (package/python-shiboken6): A C++/Python Binding Generator
  - PySide6 (package/python-pyside6): A C++/Python binding of Qt6
  - pyside-tools (Not Included): which contains pyside6-uic/pyside6-rcc

This package builds Shiboken6 from the release tarball:

- The host package builds the binding generator. The generator uses
  libclang, from host-clang, to read the C++ headers of the target.
- The target package builds the shiboken6 library and its Python
  module. The generated bindings need them at run time.

Qt for Python has the same version as Qt6. So the package is in
package/qt6/ and follows QT6_VERSION, like the other Qt6 modules.

Signed-off-by: Dylan Bespalko <dylan.bespalko@gmail.com>
Co-authored-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v3 -> v4:
  - Split the patch in three: python-shiboken6, python-pyside6 and the
    runtime test
  - Bump to 6.11.3. The package moves to package/qt6/ and follows
    QT6_VERSION, like the other Qt6 modules
  - Download the release tarball from download.qt.io, not the git
    repository. It has an upstream hash, and python-pyside6 uses the
    same file
  - In 6.11 the generator is in sources/shiboken6_generator. The host
    package builds it. The target package builds only the library and
    the Python module
  - Drop the selects of host packages: a host package cannot be
    selected. Drop the select of BR2_PACKAGE_QT6_GL_SUPPORTS: it is a
    blind option
  - Depend on BR2_PACKAGE_LLVM_ARCH_SUPPORTS, for host-clang
  - DEVELOPERS: v3 added an entry for Dylan. v4 does not: the packages
    are now in package/qt6/, which already has maintainers. Dylan, tell
    me if you want to be listed

 package/qt6/Config.in                         |  1 +
 package/qt6/python-shiboken6/Config.in        | 12 ++++
 .../python-shiboken6/python-shiboken6.hash    |  9 +++
 .../qt6/python-shiboken6/python-shiboken6.mk  | 57 +++++++++++++++++++
 4 files changed, 79 insertions(+)
 create mode 100644 package/qt6/python-shiboken6/Config.in
 create mode 100644 package/qt6/python-shiboken6/python-shiboken6.hash
 create mode 100644 package/qt6/python-shiboken6/python-shiboken6.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index f3a540e9f8..42a24f0c0a 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -43,6 +43,7 @@ menuconfig BR2_PACKAGE_QT6
 
 if BR2_PACKAGE_QT6
 
+source "package/qt6/python-shiboken6/Config.in"
 source "package/qt6/qt6base/Config.in"
 source "package/qt6/qt6charts/Config.in"
 source "package/qt6/qt6coap/Config.in"
diff --git a/package/qt6/python-shiboken6/Config.in b/package/qt6/python-shiboken6/Config.in
new file mode 100644
index 0000000000..6ded490baf
--- /dev/null
+++ b/package/qt6/python-shiboken6/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_SHIBOKEN6
+	bool "python-shiboken6"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_QT6
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-clang
+	select BR2_PACKAGE_PYTHON3_ZLIB # embedded signature support
+	help
+	  Shiboken6 generates the Python bindings of PySide6. This
+	  package installs its library and its Python module, which
+	  the bindings need at run time.
+
+	  https://doc.qt.io/qtforpython-6/shiboken6/index.html
diff --git a/package/qt6/python-shiboken6/python-shiboken6.hash b/package/qt6/python-shiboken6/python-shiboken6.hash
new file mode 100644
index 0000000000..739dc15ea9
--- /dev/null
+++ b/package/qt6/python-shiboken6/python-shiboken6.hash
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
diff --git a/package/qt6/python-shiboken6/python-shiboken6.mk b/package/qt6/python-shiboken6/python-shiboken6.mk
new file mode 100644
index 0000000000..6433678d71
--- /dev/null
+++ b/package/qt6/python-shiboken6/python-shiboken6.mk
@@ -0,0 +1,57 @@
+################################################################################
+#
+# python-shiboken6
+#
+################################################################################
+
+# Qt for Python must have the same version as Qt6
+PYTHON_SHIBOKEN6_VERSION = $(QT6_VERSION)
+PYTHON_SHIBOKEN6_SITE = https://download.qt.io/official_releases/QtForPython/pyside6/PySide6-$(PYTHON_SHIBOKEN6_VERSION)-src
+PYTHON_SHIBOKEN6_SOURCE = pyside-setup-everywhere-src-$(PYTHON_SHIBOKEN6_VERSION).tar.xz
+PYTHON_SHIBOKEN6_LICENSE = \
+	LGPL-3.0 or GPL-2.0 or GPL-3.0 (library, module), \
+	GPL-3.0 with Qt-GPL-exception-1.0 (generator), \
+	BSD-3-Clause (cmake)
+PYTHON_SHIBOKEN6_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
+PYTHON_SHIBOKEN6_CPE_ID_VENDOR = qt
+PYTHON_SHIBOKEN6_CPE_ID_PRODUCT = shiboken
+PYTHON_SHIBOKEN6_SUPPORTS_IN_SOURCE_BUILD = NO
+PYTHON_SHIBOKEN6_INSTALL_STAGING = YES
+
+# The target package builds the shiboken6 library and its Python
+# module. The host package builds the binding generator, which the
+# target package and python-pyside6 need at build time.
+PYTHON_SHIBOKEN6_SUBDIR = sources/shiboken6
+HOST_PYTHON_SHIBOKEN6_SUBDIR = sources/shiboken6_generator
+
+PYTHON_SHIBOKEN6_DEPENDENCIES = \
+	host-python-shiboken6 \
+	python3 \
+	qt6base
+
+PYTHON_SHIBOKEN6_CONF_OPTS = \
+	-DBUILD_TESTS=OFF \
+	-DQFP_SHIBOKEN_HOST_PATH=$(HOST_DIR) \
+	-DQFP_PYTHON_HOST_PATH=$(HOST_DIR)/bin/python3
+
+HOST_PYTHON_SHIBOKEN6_DEPENDENCIES = \
+	host-clang \
+	host-llvm \
+	host-python3 \
+	host-qt6base
+
+HOST_PYTHON_SHIBOKEN6_CONF_ENV = \
+	LLVM_INSTALL_DIR=$(HOST_DIR)
+
+# libxslt is only used to extract the documentation
+HOST_PYTHON_SHIBOKEN6_CONF_OPTS = \
+	-DBUILD_TESTS=OFF \
+	-DCMAKE_DISABLE_FIND_PACKAGE_LibXslt=ON
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
