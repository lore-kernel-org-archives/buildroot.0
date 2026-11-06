Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD82606A32C
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 14:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=liGApqMJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xvVLAIyl
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B735A8124A;
	Fri,  6 Nov 2026 14:34:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KV0XFpPrS7Ph; Fri,  6 Nov 2026 14:34:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7CC4E81275
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793975659;
	b=eKJP9qGx44UiRYtFlUePG2gwcCZtsaZ9uDvTgJZjW+V3Ow1/ZPJsxYIBtWRwImPPUOxz
	 I/Ld6PLzW7/N4OEpBw9d/F58ewzoGDBG2sVAI+4ej8vTnatsHdNb6nvOVJCbxYk4c3O6F
	 YoJJbFbH/abVXOvFWqQ/nijsEMJkpxfy95a5BRI83suUtUWTWwhlWb1MJ9OyKL4yvwHen
	 Edn5UAzT8Z3T3/BPupHBMFB6GMv6pq9s0gKiaazqXGGPdPtYtMqkjY8CJzRNjAj5prGaI
	 Ter00ClkcN9OzJ3I93fgbrpJYZA132BJzPKY4AWzwEYnNLeeyWc178rBN8DjegP8erQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793975659;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=/NVEs0q8dr8nht3ZJpDQS1aE0FJt7vuHXfmROslfg7M=;
	b=kq7K+XTS4mbtt3eoHVx0TQONCEnIKiKkp0KErNmaqCShKXAg6tLRoDPJvvRwX5k70lKR
	 TMy41C5jpGkFYiFc4gT+sdRztheqwa/3NVHr3X2Ju8ytc317SIRuzaeQBJln/g5Urf13c
	 CQrX8EsRhTlO1n8Q6KQ9/msIwX1wdrGJB6Na4ZYDMK7MDt+PxN0nlmG7dkTfYI3wR5Fp7
	 ydZktV4elIXuCLFFsT41pAYasii2v41avdFtxqV/oIixTZ3AqO9Eog21pWihhiR1waYnX
	 N86urhghmWV/nkcfLPePNRvDF3S39hgzouEOvTTLnoX0R24+qvGohTEtbXJbLznvd1Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793975659;
	bh=/NVEs0q8dr8nht3ZJpDQS1aE0FJt7vuHXfmROslfg7M=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=liGApqMJJKDVFj5Tz7KIfaF4gsRbusMDGbSxOljclrawSM6p+CM13HEcfkFM9v1Qq
	 9tot2xiLnTuOyaL6fwHYopq7DeLecg2Jlfv5w0h4oRNT+ovwr8IackBR/tey2qMeJ2
	 Dk0v4Z+XHuA16ARGH9OslULAHjq+WGnPJuFcWacozt3QAZ1TQbaMrnZDFB+409MTsP
	 ifrZLelMKkAC8AtxpSrM0HAbh1WAVkfjG4EdUaxSH+pQxYRTlAJjQIdiB9rOXRRGDg
	 tv4Wd85NMvxUy/lgTgZAuuAndg6j77F0au+SKhww1RHJL8R8Y1B2ITR6Ap0vFCvGPB
	 jyBj75DFB0Zdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CC4E81275;
	Fri,  6 Nov 2026 14:34:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 26405362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 14:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C8A4400FF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 14:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qXXHZPFe881E for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 14:34:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 928EC400CD
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=xvVLAIyl
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 928EC400CD
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 14:34:15 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a215e64962so8070265e9.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 06:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793975654; x=1794580454; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=X310brKHODb7OYhrgYtv70fSKYYDzXTqGZRKqiFavbk=;
 b=xvVLAIylbd2aJC87tcFnwQsoK/pzeCyaDhFCr8Q54zlG4lRk5ecrUQb1Yn1LSkKE5J
 /QIREz/dzhIaDFYqRkqlUBiKftZoZyWQha+flfhv+o3ynZuoN5qT7WK8vsYD/wSBTKnt
 p7vDXWYQN+dj/GbBL4eRmrkeso0ZQMgwKfeTzr2/2SCTcPK0Q8fZv/yGavjsBp6MRhv5
 WYXDKH9g+CtUFw1WZu2lADpQuyzmmzRpWBx6OX28wADyk62b2xl13XHy3zfFZtSoIi76
 yfZaDiljlHE0Pst1fJfcBbbriqdtUyG7poyEq/jjPPN77v3Whs932h6tvlz8UEYRMUQj
 +JdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793975654; x=1794580454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=X310brKHODb7OYhrgYtv70fSKYYDzXTqGZRKqiFavbk=;
 b=I8lT0bq03aGR87e74ZiK5shVXqiDb9dX2ozlkt0GyKz31C/JWIZqjQludkcTHcEk5v
 3BMj1F/ORenu6IRPPBI1X+5YchKg9lTQudmq4PpfLN8EhrDdLqreS30TNO5jW/1H/XVh
 3dnI19J3Z8ZlMdMoFprMeXK132i+5zED2+L1LNXGugUSBa0Ez6JLG+8++SjBmqzPYGg+
 YhBEcmhMRDZbFfB2QxYAFwKoRUUtrGpDQsgc8e7Kli+7CQoSzvWCVDnptzwv2kmRjT39
 6BL44tpHaVIoJacWWVvocIlwX4UvdZtjoM/B0MyH1xvQIHpiqxv/yAtlfasRe2P7ZpQb
 U/KA==
X-Gm-Message-State: APuU4Z/u1xlLCLWZahfjO4W0VYSftC9F7nQd6AFrG8b/HurJ5BDIXzZ8
 UfoaOEEw9tQ6Y52HBICYVv6M+QQm7op46Pb9ZOqAjk65uVzN/bBjGoVQc/ONmSP4
X-Gm-Gg: AYBFou2kV0bAhgyf6izeslXOQGI6GgYfMTZ9o3LCXG3ugQiGGG+VYLVdUIpGGd533dA
 AtoSzV0EUvFWS4f3GwYVxxLFhoWUchS3eMVNbeUBXb/btwA42TOn4xjI//DgZzGERLu4+xIYQuJ
 w5lITBllLUCk2NtesBnMsv/JgvLAWusuC9oiXIShnqxFyY2Y2rfdn+fje6Dc8dppcdbsWSleJA5
 E5LfT00TNme+g5PMwR9EdiMYW6iQofTae94IFnXGeN8MTQIAIuBdY9Bc3m4+/N+Myi9jcDmTdcd
 imn+rWKohXcukYtlWDQQIhGQvL6atZWL0qSn6/8w1wGGeOqU+Y2MqQGL2j0+bnb5XCvT2pclynh
 +iM1JFAtknvCJTH/6UuE27OUNYXKaagYUbPeuExIqgWX8ikIYl37ZHRkd2PydlOp1pq6Bcb82To
 NWK/D2ED8qJtGNXk6adpMOU5QQcgjdyxokvxABq+1RX0xKiVsLMuBp8J01l+/+JmbYZyAkyROow
 nDCc2sOuhLWpJoXt6WeHiodX7h5wDx49HpzbRO6QoVCBLj+KkmFF3bdbxhQkgSfMctu4LQCsYEM
 N04g93DsIsmxuMfxcM2hfgxpG+0VaZcTX6fthsoV7QRgUzEccGo0D0ntk6JbG65y+0bhvVymf5s
 =
X-Received: by 2002:a05:600c:3111:b0:4b1:2026:6b41 with SMTP id
 5b1f17b1804b1-4b6dff87640mr46415185e9.30.1793975653509; 
 Fri, 06 Nov 2026 06:34:13 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b6e2028d9bsm122714665e9.9.2026.11.06.06.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 06:34:12 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Paul Louvel <paul.louvel@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Ballasi <thomas.ballasi@savoirfairelinux.com>,
 Nico Orlando <nico.orlando@dave.eu>, Roberto Zelbi <roberto.zelbi@dave.eu>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri,  6 Nov 2026 15:34:09 +0100
Message-Id: <20261106143409.2581133-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106143409.2581133-1-angelo.compagnucci@gmail.com>
References: <20260605111256.107837-1-paul.louvel@bootlin.com>
 <20261106143409.2581133-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] package/qt5/qt5webkit: fix
 QMake-generated artifacts location and content
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Paul Louvel <paul.louvel@bootlin.com>

Building qt-webkit-kiosk fails because of several issues in the
configuration and installation process of the qt5webkit package.

A previous patch from Thomas Ballasi attempted to fix the issue [1].

Packages depending on QtWebKit and using QMake as their build system
initially fail with the following error (qt-webkit-kiosk):

Project MESSAGE: Settings:
Project MESSAGE: - QT : core gui network webkit widgets webkitwidgets printsupport multimedia testlib
Project MESSAGE: - PREFIX : /usr
Project MESSAGE: - TARGET : qt-webkit-kiosk
Project MESSAGE: - VERSION: 1.99.6
Project ERROR: Unknown module(s) in QT: webkit webkitwidgets

When resolving dependencies, the host qmake searches for module pri
files in:

 $(HOST_DIR)/mkspecs/modules

However, the qt5webkit package incorrectly installs its pri files into:

 $(STAGING_DIR)/usr/mkspecs/modules

As a result, qmake cannot locate the required module definitions.

Additionally, the generated pri files contain hardcoded include and
library paths instead of using the appropriate qmake variables:

 $$QT_MODULE_LIB_BASE for library paths
 $$QT_MODULE_INCLUDE_BASE for include paths

Using hardcoded paths leads to a build failure even if the module
definitions are correctly located:

 cpu-vendor-os-g++: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'

The header files are also installed in
$(STAGING_DIR)/usr/include instead of
$(STAGING_DIR)/usr/include/qt5, which is the expected location for Qt
headers.

These problems can be fixed by using QMake system paths retrieved by CMake at
configure time with the qmake -query command. qt5webkit provides a
KDE_INSTALL_USE_QT_SYS_PATHS option that must be set to ON for the build system
to correctly use QMake configuration properties and install headers and module
definitions in the proper locations.

The patch from Thomas Ballasi used the
CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT configuration option to set
CMAKE_INSTALL_PREFIX to the correct Qt installation prefix.
Projects may check this variable to set CMAKE_INSTALL_PREFIX to a value other than
the default "/usr/local" on UNIX platforms.
However, CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT is not intended to be set
by users. It is implicitly set to ON when CMAKE_INSTALL_PREFIX is unset, and to
OFF otherwise, regardless of whether it was explicitly set by the user. In
Buildroot, CMAKE_INSTALL_PREFIX is set to "/usr" by the default CMake
configuration command, rendering this fix ineffective because as a result,
CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT is set to OFF.

Adding -DKDE_INSTALL_USE_QT_SYS_PATHS=ON fixes the header installation location,
but the pri files are still installed in the wrong location. This is caused by
the conditional in OptionsQt.cmake that sets KDE_INSTALL_USE_QT_SYS_PATHS to OFF
when CMAKE_INSTALL_PREFIX differs from the Qt installation prefix directory,
which is the case because Buildroot sets it to "/usr" by default.

Removing this check fixes the pri file content issue, but the build then fails
with another error:

 qt5webkit: installs files in $(STAGING_DIR)/$(HOST_DIR)

Because the DESTDIR parameter used by the default CMake _INSTALL_STAGING_CMDS is
set to $(STAGING_DIR), it gets prepended to the absolute installation path of
the module definitions:

 $(HOST_DIR)/mkspecs/modules

The resulting installation path is wrong:

 $(STAGING_DIR)/$(HOST_DIR)/mkspecs/modules

Defining custom QT5WEBKIT_INSTALL_{STAGING,TARGET}_CMDS commands that do not use
the DESTDIR variable fixes this issue. Instead, an alternative installation
prefix is specified with:

 --prefix=$(STAGING_DIR)/usr for staging --prefix=$(TARGET_DIR)/usr for target

With KDE_INSTALL_USE_QT_SYS_PATHS=ON, the QML directory is also taken from
qmake, as an absolute path in the staging directory: with the OpenGL support
of qt5base, which enables the WebKit2 QML API, the QtWebKit QML module would
be installed in $(STAGING_DIR)/usr/qml also by the target installation, and
never in $(TARGET_DIR). Set KDE_INSTALL_QMLDIR to "qml", relative to the
installation prefix, so that it follows --prefix.

Tested with a QEMU x86_64 target. qt-webkit-kiosk builds and runs successfully.

Please take into account that Qt WebKit is an old, deprecated project intended
to be replaced by Qt WebEngine [2] [3].

In addition, there has been no release since March 10, 2020, apart from
security-fix releases [4].

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20220929181350.1026033-1-thomas.ballasi@savoirfairelinux.com/

Note: Thomas refers to 'DATADIR' in his patch, but I believe he means
'DESTDIR' instead.

[2] https://forum.qt.io/topic/65982/now-that-qwebkit-has-been-deprecated-what-can-i-do
[3] https://lists.buildroot.org/pipermail/buildroot/2015-July/496272.html
[4] https://github.com/qtwebkit/qtwebkit/releases/tag/qtwebkit-5.212.0-alpha4

Fixes: https://lists.buildroot.org/pipermail/buildroot/2022-February/323066.html
Signed-off-by: Paul Louvel (DAVE.eu) <paul.louvel@bootlin.com>
Co-authored-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v2:
  - rename the qtwebkit patch to 0015, 0014 is now taken by
    0014-gcc16.patch;
  - set KDE_INSTALL_QMLDIR to "qml": with KDE_INSTALL_USE_QT_SYS_PATHS=ON
    the QML directory is the absolute staging path from qmake, so the
    QtWebKit QML module was only installed in staging, never in the
    target.

Tested: Bootlin x86_64 glibc stable toolchain, qt5base with OpenGL ES2
(mesa3d softpipe, EGL) and eglfs, qt5declarative, qt5webkit (WebKit2 ON) and
qt-webkit-kiosk: everything builds, Qt reports "Qt OpenGL libraries:
Qt5::Gui_GLESv2" and "Qt EGL libraries: Qt5::Gui_EGL", libWebCore links
libGLESv2/libEGL, the qt_lib_webkit*.pri files are in
$(HOST_DIR)/mkspecs/modules, the headers in $(STAGING_DIR)/usr/include/qt5,
and the QtWebKit QML module in both $(STAGING_DIR)/usr/qml and
$(TARGET_DIR)/usr/qml. Not run-time tested.

 ...-conditional-on-CMAKE_INSTALL_PREFIX.patch | 32 +++++++++++++++++++
 package/qt5/qt5webkit/qt5webkit.mk            | 20 ++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 package/qt5/qt5webkit/0015-remove-conditional-on-CMAKE_INSTALL_PREFIX.patch

diff --git a/package/qt5/qt5webkit/0015-remove-conditional-on-CMAKE_INSTALL_PREFIX.patch b/package/qt5/qt5webkit/0015-remove-conditional-on-CMAKE_INSTALL_PREFIX.patch
new file mode 100644
index 0000000000..ccfbaa5b10
--- /dev/null
+++ b/package/qt5/qt5webkit/0015-remove-conditional-on-CMAKE_INSTALL_PREFIX.patch
@@ -0,0 +1,32 @@
+From 38e96676cda9e555b4c55102a57e29c2073c30c2 Mon Sep 17 00:00:00 2001
+From: Paul Louvel <paul.louvel@bootlin.com>
+Date: Fri, 22 May 2026 15:47:43 +0200
+Subject: [PATCH] remove conditional on CMAKE_INSTALL_PREFIX.
+
+Remove a conditional on CMAKE_INSTALL_PREFIX, since Buildroot sets it to "/usr"
+by default. Prevent setting KDE_INSTALL_USE_QT_SYS_PATHS to OFF, which would
+cause the project to ignore QMake installation properties and install the module
+mkspecs in the wrong location with wrong values.
+
+Upstream: N/A QtWebkit is not maintained anymore, and this patch is only
+relevant for Buildroot.
+Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
+---
+ Source/cmake/OptionsQt.cmake | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/Source/cmake/OptionsQt.cmake b/Source/cmake/OptionsQt.cmake
+index 71f9afa01..fd52e8eab 100644
+--- a/Source/cmake/OptionsQt.cmake
++++ b/Source/cmake/OptionsQt.cmake
+@@ -1008,10 +1008,6 @@ endif ()
+
+ include(KDEInstallDirs)
+
+-if (NOT qt_install_prefix_dir STREQUAL "${CMAKE_INSTALL_PREFIX}")
+-    set(KDE_INSTALL_USE_QT_SYS_PATHS OFF)
+-endif ()
+-
+ # We split all installed files into 2 components: Code and Data. This is different from
+ # traditional approach with Runtime and Devel, but we need it to fix concurrent installation of
+ # debug and release builds in qmake-based build
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 6912359674..961dbd8daf 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -51,10 +51,30 @@ QT5WEBKIT_CONF_OPTS += -DENABLE_SAMPLING_PROFILER=OFF
 endif
 
 QT5WEBKIT_CONF_OPTS += \
+	-DKDE_INSTALL_QMLDIR=qml \
+	-DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
 	-DENABLE_TOOLS=OFF \
 	-DPORT=Qt \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
 	-DSHARED_CORE=ON \
 	-DUSE_LIBHYPHEN=OFF
 
+# Remove the DESTDIR from the install command install so that the .pri files in
+# the correct location: $(HOST_DIR)/mkspecs/modules instead of
+# $(STAGING_DIR)$(HOST_DIR)/usr/mkspecs/modules.
+define QT5WEBKIT_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(QT5WEBKIT_BUILD_ENV) \
+		$(BR2_CMAKE) --install $(QT5WEBKIT_BUILDDIR) \
+		--prefix $(STAGING_DIR)/usr
+endef
+
+# Remove the DESTDIR from the install command install so that the .pri files in
+# the correct location: $(HOST_DIR)/mkspecs/modules instead of
+# $(TARGET_DIR)$(HOST_DIR)/usr/mkspecs/modules.
+define QT5WEBKIT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(QT5WEBKIT_BUILD_ENV) \
+		$(BR2_CMAKE) --install $(QT5WEBKIT_BUILDDIR) \
+		--prefix $(TARGET_DIR)/usr
+endef
+
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
