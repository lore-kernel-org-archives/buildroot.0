Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08C1606A330
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 21:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qyXTiGza;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wfvPBU6a
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7939281067;
	Mon, 16 Nov 2026 21:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V2wEyV2RLMnF; Mon, 16 Nov 2026 21:36:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2C96D810AA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794864985;
	b=KUPAMMBdhXLOyxCNnk6lAbmWVS8PWCrpQmzwXnJi8Leu9zq3WZKejW/a9Uulin96FVTq
	 41vz+4WSkFFW46JasIPnGucUd9oVYQgceQ0B26An39UWkh4/RtnVyme8jY7z4N1jd76Iz
	 CxMHGNCPHr2NqYFhUF758nD6d7ngEu8zKj83I+aJd6X4Z6MT8tuV+30iuPg9JQ5M4WU5J
	 TXDg3lDRbHYu/UnEltYHG+T3iLVbeAc7GAPiVjQ1x14q2Y4OldYO6wZf1scm4PxHCju1w
	 LSNVYXI5n2JCpNLXPFyXeKrUqgg8y8voeYMAzJZSRLgBZsifc8LcUMWhg6cdCJ3ExPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794864985;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=BNjFvU/dFumXvdYkI8PtXcWJz8c7L2ybvAw8eoGCOs4=;
	b=sO3us/OlGxamqYZINuCtL+R6q8BPlEnpkMd0gw5IT/Oq7fZBk1RVEbn+n458Emvh/COK
	 pfQOKrwYAjbg1RSCQAUpPNt4VCiC9cNqGwVZnWlDxaLuBlZ9YVdS/VDyNz2ZxQ+hceg2t
	 Tpqv8+mNuyFykBWXultxqMLse5Am/zAXg5HGKIP+dXYrdSJRdZ4i9d8s0SYGwifowTJU7
	 jhtT4o0bIhj7mNNDN+kpjpAutncn1qCvetB5aro5ooavPNpz7QXyLLsEyQjrn6GePN8ij
	 3MslS3Tyhtwud1TZqAhop7BT52J0cM1g/S1jF0C53amsIVaEj7dKl8fD4Dj8mAOVnnw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794864985;
	bh=BNjFvU/dFumXvdYkI8PtXcWJz8c7L2ybvAw8eoGCOs4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qyXTiGza/wo4CNQ0ZWhKvNp3EYrldU80TCfgDQbZrib7XuZuIUrTkLvxWE8TnkXIa
	 PDTw7GAGxJpPKa5I5Ew/Vq9+wKGAls+ik+zFejhsZ6FL68h/QEe6IEVQXYfO6PiAqU
	 nm2lqblxVT7YzB5E5B3flito/2LkNRo0Ldincqa3F9JsuIKstljKNxFzXYobjOJn4+
	 1XC4f4Bfh6hwhtoGhatnRz8hVdCUNNaMmAIVBf+g69q7xQNgCHqpGLJFUEJR/FFdm+
	 iDRyP/wzZXyx7NZVwKO+ucqoNcqwyvnCqrUn2BMjz/lOd+fIR21LcaRg1tUtyQanxo
	 1s9KNoBj/9ZJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C96D810AA;
	Mon, 16 Nov 2026 21:36:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 414BE1A6
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 331F160774
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p98zaWMe311H for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 21:36:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B79D06073B
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=wfvPBU6a
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B79D06073B
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:36:21 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4a32576da88so281172f8f.3
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 13:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794864979; x=1795469779; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TXGs6BzkrBNtLell1szBL3z5oZ8ktGGUeZcGlcGfXrA=;
 b=wfvPBU6a8+yNr/eyQVoUYo7HOhjey+FuAHYmVi96QCLWMr5395VjOQqRDf1hIQhEDf
 wLcqbWtE7n3qs6YvrI/N0FcuXg3fXxqXiNl+lIK4R0mXKARhAtVcldiQzOw494xvdEvD
 FEmwtuirmaJ6iavtnRSag7Uf9MLUq6f24v7dtjIsPCn7ifk4zwKCPaqWhftLnr0mb2Hs
 ds46Rs0zdmR50gpLO54+aYnOIzNEsngsZ9LY/YVT5F8Olz6jNscVmYZ6M1JbfbNymIw6
 RldzUuitiCfj6osn6TjthuGYF/nwsO84Eufars3lSEuaxNYCl0o8T1a8N7cTjVvnQlti
 SOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794864979; x=1795469779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TXGs6BzkrBNtLell1szBL3z5oZ8ktGGUeZcGlcGfXrA=;
 b=uwGAA91xWs3pM/dsVsDZvN7znj+it5GfTFWE8DHtx2A94XJmy/oAuppL584oQKe3nw
 cULtWWYyjh5Wqwktbffav8Pqjmhd1FqAcoaGMEvyrvbx1tfvA+wukUgQck0Nek5BQUs9
 Pnsgy8BKPndYj6NjlfAI3kWR/nuEDuV/eUwqigWIfdRjE0qes+3If8+Ccr2eKsa1KYJF
 JpuJxXGVRTxRnA7pxkK2ImpVrYCKn8LZ+h2Oq96jYaZO8vT7SYrBkO0rYIZFiVvE/q0l
 N95VwnHsbwzYJeMYX2q1lBBijdc3MUsNCJmG3GYwDBxaYfntBs7P0tX4qTQZoweCEW0/
 nMKA==
X-Gm-Message-State: APuU4Z/AtM4vGSSkfHALHwNz2+rsdT7a2klCZiYQZ2mowgAW2GmNo2Qk
 zNuLqDF4nYFLFIjF8vtyHB0kLXpmvKaJy1X0YWoVPUWRoh+SkIERGShAMgt36oQp
X-Gm-Gg: AZFdTZcfDbZpXlPJggmjWuhjsesiUoitngplLIwzQ00CYDa6KT0T0jq57GdIWQnqvtH
 IVMJUQmxCZYSFSLMP5cuHDglvgPMmrIg+x6cxngMPnHtRUT5HaOVDgFQcAYNfW7ODpXkYDxrH2y
 ejBoGn305OLgkVUt6rlltEIlDn9lURpi4ut2/qEgYnMzn1O4mtmaHpaHVN7SFMv6fL78zE4HIgv
 Yn+O5gV10BXMnAJG/C4yhG+168eE8frxUWTbOAj/QM8+mx3xjHSJ4LNi8alZcnUZ1KHOvRSWlns
 giiD0Y8NC6gBbEb6A5vbNrBYW9NMz0jCeYuQSd7VqgDa43wi3XYQInrQS2QnNcnacjaZDI2jJRw
 KH+rDygSWQ+HmYG3IAwCi1PW3JJSB6zHI4yJKKmZtGjAbBayPPA4ITCik7R+HkW9k1VvCB/azQh
 w7A6TPkv9kCoy9T654x5gU1p1MWlYjzixNigobGvMNwg3Az+FEdQvAw78dUJJ+o0ha3n4yogHJw
 O0tf0lZXjnaBRkJxUoxjygLMyKku+e8RMFVFqtOTXt4iVHm+BxJnGVMF28b9fBL3ggRTrDWEvQE
 MtrVSsVXbAlZUoR42qvp74sZQeh4OpWj4PjrFH1OqkPUWk0mx4fD
X-Received: by 2002:a05:6000:2dc3:b0:491:f77d:47e4 with SMTP id
 ffacd0b85a97d-49c72f7b7ffmr23246080f8f.49.1794864979380; 
 Mon, 16 Nov 2026 13:36:19 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c18b9sm20248008f8f.20.2026.11.16.13.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 13:36:18 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Nov 2026 22:36:09 +0100
Message-ID: <20261116213612.873856-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116213612.873856-1-angelo.compagnucci@gmail.com>
References: <20261116212913.863975-1-angelo.compagnucci@gmail.com>
 <20261116213612.873856-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 2/5] package/python-pyside6: new package
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
Changes v4 -> v5:
  - No change

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
