Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C7B606A330
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 21:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aQPh9sae;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PEhgPfBn
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8932180DBD;
	Mon, 16 Nov 2026 21:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GAL9VuZwhz-W; Mon, 16 Nov 2026 21:36:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CB9C58101A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794864981;
	b=jVQ7ZgwhZ1eu4JQuxD4bOZzb48KYAwkeZJe7ZuELzK0JNoIjgysEivk5KAP4A5OuJIJW
	 qzzRzQ+cwYnHic/oyiIpdf8qUMcAhSa4RtybjX7SXedvL1QK0lloweGx2IS1kFIIlECHa
	 CQ97JGgUD6Vo09/Nz6vgiHaej6YYj177tu/k23dzuk1J3fvNUk/A1+Dov4JYyuJv7CB0W
	 eagZxMSe7DSZT7NINdNP6L1TrJfqASZVOHS5Y0fGM/K+l9EdwlW8suKcyIC70TNEdc1ug
	 43PpeGoUuiLxPlrU80FgUv+IugiiferOcrZyYhn/DpfF8udATIgWD/6B4wzc13oKp5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794864981;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Z9V5Ms8/SasVFqtcCbWONik7ygC3U1lT1ExfSc9VAXo=;
	b=ZuiZpVzIMjXlPNiWnJpxzARtIuIlESacfZgfZXOCltsTBe5Emxk9SGnKe0zBKxBoXxXv
	 SM0W45duwcScioElCvi+u4EbgR0zTPI6v8GiRj8EByzUJQYW2jFKi9ypegpTue2Ougmyy
	 BxAAbO7H7GiM+Hh7kWPLU7TQHY76IF8TFhJue8vFWe6cv2FzxEfl1DK/RtS9Rw9U/1ZBN
	 mV6ogQQbSZjS8jvPOx4f0aPeF/k4TPF7AZNxZB1OoefVNsXQ6HHVIISDx/L28bqOkogaw
	 8NkVEwtjKQsluDvR4+uH9XQAFP5vizXyGL/6WdX0HC+1hLtmmevU1FmqM0h/oDXnm7Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794864981;
	bh=Z9V5Ms8/SasVFqtcCbWONik7ygC3U1lT1ExfSc9VAXo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aQPh9saezgC/qJwxNcdAVW8eCmkFogGyZBSllDa1EyDldbb+L8c3WmIs4Q5YYqLUD
	 AEc56/zh+cpfZJucmSVWbrHCOvWbjZT7D5oNtj2XEzTEhLdlevvtQlmnI855PLSAti
	 gDwSdgeg8dRG6nKlyp0II55s54GBx7HRWIAY9Sse5xbWemg0W51wrYHpGZK6ZRJYoU
	 NIOewE8FZZqZBh8BizsxsEsOPsnsMFgJvGbvRn9WbfjHoK+md06RsfcnPjOzZ/P/ZJ
	 8ph41vlZ8cqyNwDjOc0wbxzF6WApn6WJlXaMaZbdDLlgjrFWZNRgeevRcdxinQhB1k
	 45iwem/OuuMeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB9C58101A;
	Mon, 16 Nov 2026 21:36:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4650A1A6
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37B78402CD
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OAcLGhpLv9O2 for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 21:36:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D5835402CA
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=PEhgPfBn
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5835402CA
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:36:18 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-49134c8509fso3839191f8f.1
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 13:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794864976; x=1795469776; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=N/RUVQTqVh0+HGU/AIfcnrcmHUxczqCl1HPZACM6HwU=;
 b=PEhgPfBnyKPqCEgdD42w9rODmvfkQR2vptA1iARvZBEH7XoZ0Y3heNEaVXSjGQX8Ne
 t9qA/Xf3T1ogRuul0EV+aq9cSfVfdyLq9G5EvUHS0D4z7djVUJaK5zwFxilxYFN0IczP
 2y3m2cTMz2vrfSx8BvR24KDjxc6Eqz/v8vYh1HJROHRn21pnx+zGhVQqMfaZf3Py/2CC
 P+3xAFKoC6JpyOg811/zUb9tGoczTEq38rBQXiK1oNH8/PtqtOBKztnWNTlpWoltuih5
 /zddZGc1rZoGkFbvgB6+dQE7EObQtcVHPSZurbL8zb0gXOPMHs/KUxCJH94YtieJ66YW
 kBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794864976; x=1795469776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=N/RUVQTqVh0+HGU/AIfcnrcmHUxczqCl1HPZACM6HwU=;
 b=gBtsIzxqrYjXwUNdVbP3oy+V6vIciXMGL1QvZfiGZs4TYtoNp9ghahUTeplmeB3zH1
 /2PehzjQJck9605mznSaUJo6sQst2Br/VGgZNJLOsEshakuC6h5C+VWufI8xUJCxrbqf
 lf1FffgVxFnX2KZrcY5uDayfLVtxv28JGeagvVIEVXKL8QcDvZDFXzrapPy7MTHG1Vys
 jkkqamcis7cIyCv67uZLhu03i/BstDigfKA7RT+AMUVDxMM65Ge1SP3TPTMkpxjhHNQ+
 fbZLOuayk59Udjfi48H27kT9jBNTvxgoYYIlhXYHI64Xc4oKYzHFNgdtEpoAay3lDoES
 aqSw==
X-Gm-Message-State: APuU4Z8D19P9eYaoG57/WDwt232Rb/PEJq2rMOVfaELTXMpcNeIx5In+
 WkB7JIVogXVCfahTGRNJ0AJ5FefkJ25QWBfpftxTtR2/OWRvUogvm7mG7jGEEJqz
X-Gm-Gg: AZFdTZf3kvTbbh/d7XDhwONrsWOgNrR700TvHje01YOnYCtH54M5ulLn5f5TtltuWlk
 56rpeWmt3EdsPHU1bIye4FWWzjGb+YWK0YbUYsVjJlP1xSREEXNQ4vs639UCmlcTElLlZSHyHx3
 a7h4E6Vx1JsJjyp9LV2qrsAyT/MZjVWxun1IuMmMvHa5Pdm70cQwV6vSkoJ4UC30S+d/5ibiODE
 kUEvYVJfl/a7W7vQ2ZXsUckYmyieWNO03Eat891E5LTcnWmI1/pmyiAPzb5GWBeX3slVbYb8Lfx
 XJftuujDiFDSCdt1TIUJ9jAAc4ZMlBN9K2bp2/w0v7FBg78qfIwtMUHSllu8iU3uZTP3oueGD9p
 9KSoMGAv9PdwwR4G/z1ZBoztiF0cHU+ycgu/kz0KIkrtDtMvC1dcRr1lKcvvdrOwv3lD8CQvGO9
 Z5zmIKGs1lxcVhsCReQ1hyguoFutlrWMNxc0uvUL86SbysvpZWIdyHhTo0ysyuFzXXUaqsr3PpX
 Gq4Z0KFDTEYktfeN3mcTdVRdjmZPB0C/08QXl8o0bkID/IcZ2s9iTY+ldyMPGTARe53eAOEcvAa
 /rjKwajIXrBr/bVh8dOQEUGfC9d1MvjdcVQkreod3MBA4Ply1OJV
X-Received: by 2002:a05:6000:188c:b0:48c:4442:54e with SMTP id
 ffacd0b85a97d-49c727d1bfdmr25510214f8f.30.1794864976525; 
 Mon, 16 Nov 2026 13:36:16 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c18b9sm20248008f8f.20.2026.11.16.13.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 13:36:16 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Nov 2026 22:36:08 +0100
Message-ID: <20261116213612.873856-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116213612.873856-1-angelo.compagnucci@gmail.com>
References: <20261116212913.863975-1-angelo.compagnucci@gmail.com>
 <20261116213612.873856-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 1/5] package/python-shiboken6: new package
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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
Changes v4 -> v5:
  - No change

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
