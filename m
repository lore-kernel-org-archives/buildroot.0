Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AC8606A323
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 21:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bXvAAmRP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UiKO5SP6
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 377C980C43;
	Mon, 16 Nov 2026 21:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpeucsp9XUHI; Mon, 16 Nov 2026 21:29:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4AEE180E17
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794864565;
	b=h5w+TTjxTfkY2Nw/vMBdr0BxSU3Hw2uGo0qYOMcBKKhcC+MNauire+SsYQtwo7XRbk11
	 QKOEN9AIJ0HoznPs63+iyefzQqocHWO9oweiUmChQtqrhE4QhqXHehHDU2j9xiWlNXT2M
	 KcyUO3oA9ZWx0mCyyq9mbCpHbgin3G5syCzo13cg5pusRxFQDq4NdFHTcZwMUg5RQ2IF5
	 pktk/8YuvKq/lh04yAlUy6R+tJ/l8ljVM9XOlO6WoC5Ge7wblnwE1sl/sDayJJvr5AJoI
	 jRO462Hn9mRtJsMGV+Kb35Oen2FkArRNwS7m639l63E6hR6GWc9nK/ePn8t+b7/bM5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794864565;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=BW7AhJ6g5L/bSES9d3syRekKV5aPM/YrdonKWFQBlOM=;
	b=eKVDfxMbvBpFGFv5ViC5jA0zhW8Vyzh+ASz4KCkTZbQRDHWGEoWtDNXg8wAHqdhs+X4D
	 WDCehGqGwsWXMaOO+1e8pWIVmBHIkwMrvAsxX/YzizMxoHPwYZUW8jR6vB6DfjymkmA5Z
	 M6jxXWhLqg3VP+PaJOTAh1XDSoMOyHIqfcWCGNZOnB5BbTWJeMEh9hPaah5mYw1LBTSyJ
	 mhWJRRELUe7Z9ym8XgfVY/29AQcOROY5lB4Kab2cFLg3g8BwOLdgw0rCqy571mhkf/cWz
	 MwSPEKDqxxOjfomzA6EbjjaZMX/yoozAxpB+R0YEkGafH1mlF/7T2IvxmNvHv8x+WeA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794864565;
	bh=BW7AhJ6g5L/bSES9d3syRekKV5aPM/YrdonKWFQBlOM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bXvAAmRPD/WtbjEIsDz24ZTmnvQ4eH1bPXe6tmKTnlHY0LRKp8qSLJVwAFJPV+1Dz
	 gcJz1SKz+AYwOSLpuZeI/5M8gNaXM3PGJi6riY/fK9TFWq0iqvLorEgGRYmfpOAwIm
	 O4uN2We09KyHGpx+fmn2j3aWKMKUOplQ6LqfQ7RgbRVHSgDTVgYxh7ZofUc9/QToXx
	 3Q0o7/qxtKW3cyfLslswhv9Gkf4QPbTVzJ8x4tr/6Z9t+Z+Gd7Ld+996keP7SU2ShE
	 ZwqCfHEOWh0C9a7PsT6LYTED8SXyCLj4sg2v8EcC6//T4s5Lc01zxGqkkMyKgjpqbu
	 NSYhSNDx1dupA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AEE180E17;
	Mon, 16 Nov 2026 21:29:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95218109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BCD5402EE
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BDdojAoK2Dmr for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 21:29:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 09304402CA
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=UiKO5SP6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09304402CA
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:29:22 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4bb666304fdso2334375e9.0
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 13:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794864561; x=1795469361; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eQxpLC2kUaJfbFlpbJZNfb/P1aTtMCyfzoh1YAIkl7Q=;
 b=UiKO5SP61mFHGk1s6QJhrS6YJJt30OplJ5xxVC8kJ71UTYpKURnwdaAACF6SDTPNuj
 qibzusYrr9/xtJBzttnfgcgF1MNpZaGkkFyW6BBx8ywi2OxonxPhND8VT5tk3fj7/7dG
 g0h4BLZAmyTd0Zhl9uVx8s5jzyfnLJDHEsiVnDdiArAxmfn37agurCUkll+4V8yKytle
 jczIud5aQGuG/ArWQ4jGcODdQy9tjyQYKudV+buRrzQHrrd3R4aHuwneu8hGGAL08QTm
 RhAtuOPlu9erTPuVWEONcr5inGeay11VuGldnOR7FGy4YRzwwlUeVh0unk6jRpBzq1VM
 GYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794864561; x=1795469361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=eQxpLC2kUaJfbFlpbJZNfb/P1aTtMCyfzoh1YAIkl7Q=;
 b=uYjOWbeAhHRqHifFfj0qgfqdCWR+pNEqxqJjLSQXTZiOvagCTnhCeBlpEmMlFCuzDw
 QrxIyfL9J3MS34cVXx7SD2XTaTN+vhl06fgEBBXGg9bO9Ma6SSOCCofnYl9gJQmybEJg
 qZF6y/Cv8Yr3orUdTB0SmtWfxti4l3S5Skka5JtWCkZz/PgJoKFNJBK4Tn08ainpTArd
 YFmqtaT73s52qSaGdoMKpnjpd3DFMeSvl1WkItkqamsz/NeetKFaXlSFIPxgJBb27iQa
 eCF8qyq++rvVzqyypscYM3rY9cfCxVFFtUt4rMghJgtp2kT5AXMjHWbnl0B8T17O1B5X
 Bwdg==
X-Gm-Message-State: APuU4Z/2hzdlRQ6XF5Fq/fS/bcBNbc8PbgVB5pdn7UX7luEO9/KxdUZR
 t14A+5u09gqBjmNC//ranN+SFJpdJw0E71qgyf/6DiHAU+aRwcovL8Nx216J7tCb
X-Gm-Gg: AYBFou18xZDQnP208iKN86kS4BlRFdG+QYb/odRgI8SXmL/6DJ5tRmQmRLcupOZOctX
 40VEQWJRtaOLO9kNbLw4yI05UnVGfQcl5D5stq7qbagCM3dFBKWBn4lQTwr8rE9ujJZJPNXf+IW
 DIam+glPfia9EiFuuWcdbdcSlgV3V2GgxFeDIY6uN/PHe9mIRtmMlJqGitcXHgGjW29X50Co5Cp
 niHDgQ5H711NDXSniCv1E357j1eLw/AqBC2CiTFzq/UVYHIszt6PIRP0i42LOjwzOWLiwqa0MAL
 Ax38yc/RY3eogqzKhZ6x2sshOdq5/ZTJ0JyyWt+8HAWGJ7YjlVtaBeZFdXPQ5sqRtdVEFp05sSj
 GDYI2lxOKk4WyhhOoFkmsKMUVigw/qaSZje7B6FNEX4w7W+3omXpXBJ5Ob6PXmomHneF9b49m2q
 0b6iVEGPlGSOB0OL0lHOTlcYbUYd6hVPH4ToylxxLAnVBegf5xKGDLJyJnSPgdN0IPtcGD75cWX
 FBC8hUjPejws8lEpu/kN5M2b1GkkZIm/YnvNLjmifSoIAJxLCEx1ynOC4g/k/zjN3PROETE2Odo
 aEzIdIFrGIL6wp1PI1QHgrWYm+3TyDBc4nQxOPThRRPTqUJ0MDbY
X-Received: by 2002:a05:600c:4793:b0:4a2:f58:9a82 with SMTP id
 5b1f17b1804b1-4bb783f38eamr11114595e9.13.1794864560503; 
 Mon, 16 Nov 2026 13:29:20 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5d223a29sm24918708f8f.8.2026.11.16.13.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 13:29:19 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Nov 2026 22:29:10 +0100
Message-ID: <20261116212913.863975-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116212913.863975-1-angelo.compagnucci@gmail.com>
References: <20240812080307.553359-1-dylan.bespalko@gmail.com>
 <20261116212913.863975-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 2/5] package/python-pyside6: new package
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
