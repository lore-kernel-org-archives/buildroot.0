Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D641606A31C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=j7VtEH3L;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ianAkMS
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F22C580F82;
	Mon, 16 Nov 2026 15:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7CzcUXd02gRJ; Mon, 16 Nov 2026 15:57:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D6A1580F83
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794844624;
	b=D+Ok8IET21JFTYeshF/sDEet6jQYukgS+I6388xUnc6T7kqOUFv15dmh4V0S4PF5B4FG
	 tKo9brd+HC/ESsp/WJwYsASuVZdi3D7rcUeJGwNjZ+puXKAaBSqVZypgSffnDWpeAgUqO
	 ocjDg/be8F46BzwEqjY4c9Sb23ApqnAF7cPz983PQjhsMnSE7pHW5NphnjYzTBllmGS+O
	 uV9eHEnY/ZxK/Ei8IcA7zi8Itf89n3xchkyYjPugv6gWsMeGTWQONnwXnzOXeXjnF+dja
	 u0lwVPVkibOUhpqvu6gYX8y4HbJf2FIseWi6ufjJ/7bGHTp8qM6KW5zsAsWbMTRONcg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794844624;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=M0SOzqWGb+3alO24VDzCblyGoZP5CAtIMW5jYVKPGF8=;
	b=gnvJ6I1c4MA5VDlDpvqKPzqDerSW4+Ug5B5HAZhaeqUJ5Vvjn8s6LCvaGY88KTMTKsc9
	 2Uk9u0k2N0OUsBUzzG6FCZ8NDGGivLDqN3wlXC1rBiVZu564joHX8ZTh8OuTBQQY4MfBL
	 YO2Jv+YV5FLz+K4eXVTKM9fm5UfyBTYooindDx4t43tMoWiUWZU/Ak4xBkLRdTd/MKINh
	 tQTE0zbeU5WTUTWBJLC1ay3kLachNPtJTu+VRga+I4cd6OuGvt5tt1a26y9D7kdmJskX7
	 4S+MsHi/x8Ym5nwxqGBvJj6x0MWhVWBl8lKfkloTSiatAcljfKUsUHFmOJf4PWm0lQQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794844623;
	bh=M0SOzqWGb+3alO24VDzCblyGoZP5CAtIMW5jYVKPGF8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j7VtEH3La4tInKPU65FXY9weFsJm7ZWk4DTQnFzh2kmg10u5FNZGaqnSb0rVKsAaQ
	 8hRRWJ9yTknd5JFc6ih3BZfF7pcE9DwS9VHVnD4IGQc0ip8XBpxM3kGFA/RK8RcXAI
	 tjzbUltbB2CuUPjprxKbud2Nkko/N5cZiO4tajhuxtqrlKzJdJ9iCvBhcdDAUOBm1u
	 r11RsL6oQpqt30VmObsTB5pjQTUR4IqR6ekzBqf6xcZ9IPKGKurlu3mDrJ3FZC7vAf
	 3yIRndo8RmRxHI0GcCNLoHnnAvbdruyzeq9eZ7omVElgRLYWsX7OUJOYmt/GRq+Zmu
	 2WC5hirXptzxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6A1580F83;
	Mon, 16 Nov 2026 15:57:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1433A2FE
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06021607CE
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:57:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0QqLuOwDYBHD for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:57:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A2A4360793
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=0ianAkMS
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2A4360793
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:56:59 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4bb64ef5a00so12077885e9.3
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794844617; x=1795449417; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4f23LIzh8HVm/vTdAJtYUv5W3vqDXLKwZ82FKPPWdog=;
 b=0ianAkMSh0IcJpZumWcvUFwHQTviRQJQOQMWFODIi9aDuT8nJSX+iC0x+TbnLPfIOL
 R9yLvuS139nrWfOyuROQoANL7Y1a8LjvN+WI+aAeu5AwBXFkxZNWSxKhQkQQxTvu92Ej
 /n/cUkKJRop+DSRB6nC/mKXsSBu64HGBc06O9SYJ8a2TdamvIgyrAdYbXwWbJCD6+Euv
 1Jc1ocKVBed+s9u18kpHexcs1Mb37ybtoT52kdW3OkXYi+0W70T0x6bO9HfUuwVAvh6r
 3wplatyqw7Wh9FaWEUCmmERzfLtdSz0YaMRC+IWLBwzQCLFQo1ZxxqhYCuEMHV7xvHQ7
 OSBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794844617; x=1795449417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4f23LIzh8HVm/vTdAJtYUv5W3vqDXLKwZ82FKPPWdog=;
 b=i5Y+CppgTfACrtuC14dThu6B1StwcLqDUJxMh09ztF+XSwqnaCn2SjM+11tDXu2+i/
 SBI8PMu3r2EClnJh2Tll3BDdFRmCmcpGsN5OJJjmzhAFIqKREvpc3hNED0IhN5kA3scx
 CyA2TdQLEXrexjhXQC2veyb2MC1cvL8TAUGP7i8SCn3y16ML7NgiL/U5jZloC3IX+bhy
 X1Kv/ufiU1+s+KVhUgPIgqRGBLeQh9Jq8Df9YlKZB+jbaXk0Ok1erqeBCSLcKFcCaAQp
 n64GAFatBXz7mrV+wGlB5l3nP7zmZAyTD8Z8WgXgbdqVxTlCo8qEq+WbqeF2UqGZgeDE
 rD0g==
X-Gm-Message-State: APuU4Z/TS2mXrYXuLBdwbniOdzRtNpc0dtt2VZDd/ElbqvuDlvlqZs/4
 BKTo1cKVcojRUq3AU2/wwGUUkek4A9bxdj7OBMolCEvqTev7OLVTI+jXyVs8kuN0
X-Gm-Gg: AYBFou02rgcwylPN565xa2/Uswt7Nmlbg+JEHyKgfCY/uMFvX2qKHoDFv6ydDqcS7KN
 7gof5i9ms9tXMNR4x0h9XljxiOkrzx2ZmPXLFxXEkk/ipVM/8Jfbq1YvCwn+3PUu3VfAP3Wd2nL
 TpNzOXxssDUzYcnEmnc8AKjJl31F7hjf1CLLkhHVzgFVQB8NgpCcy4sbg1Ozr21NRGOG5lCMhxp
 P9XdRteMgdfUrFUuw3sgtSIN1Iz8u2BOMUJi8Ng6mF7NV8gpXH8x/EXPv13Ea0NOEermGE+WJ3h
 6h/jnzw+CLuJ+bYKz88nTlkDYnrAyKPIJ7Nj+h/nN9Q+COe5jt5Rwu2By6imdtQtdfHoYC8bZRr
 JacVG9tgzHdjDMkvBu8TOCdKVKmZKlE0XnqUkKXiBuQk5epP6lQh/rSxlL7oSdzBjcTQHqFQQ58
 xz2DnBtcE7/PuRMcbkU3wOABMs/pu5HBkxw2bYw/2H05dD9QnApDL9inLWEgE/rYfCLXtmaJYWx
 47ACHFDD4iS52b5b2Zatp40kKZoN1v8Mo/754i5MRbLTKeaF2ATKskZAQwMDeY/PKN8m8rvWX25
 02KAqOkyo3UTXvk162BQWby83a35/gM2qPWuCewri53sq1RIBZnF
X-Received: by 2002:a05:600c:1389:b0:4b7:dc0:89c with SMTP id
 5b1f17b1804b1-4bb55ae7737mr228838165e9.32.1794844617186; 
 Mon, 16 Nov 2026 07:56:57 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c1968sm23357063f8f.10.2026.11.16.07.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:56:56 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Dylan Bespalko <dylan.bespalko@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 16 Nov 2026 16:56:50 +0100
Message-ID: <20261116155652.4181839-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116155652.4181839-1-angelo.compagnucci@gmail.com>
References: <20240812080307.553359-1-dylan.bespalko@gmail.com>
 <20261116155652.4181839-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 1/3] package/python-shiboken6: new package
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
