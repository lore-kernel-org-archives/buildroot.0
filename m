Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C93CC433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 19:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E052460B6C;
	Sat,  1 Jan 2022 19:31:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kHWghsGqg28l; Sat,  1 Jan 2022 19:31:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FC1F60B95;
	Sat,  1 Jan 2022 19:31:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3684D1BF389
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 19:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 330C460A78
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 19:30:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y_OUUNaO3BMH for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 19:30:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37F2760A76
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 19:30:27 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id q5so36033004ioj.7
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 11:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gMwYiV+Yw71AALhhcn9l0PJAxE48bNZRvmcZ/9Op0B8=;
 b=ipR12oDbnjxziwUkpplUdt6TGwpdrVWb9K52vAQLEapa0G+fUDGLfrMnpa7XEH48WK
 R35Smy4Unsxcgv/c2dFHfI3p8Xb9HjRnfH3nDBmMS817FR14nuUyM5b6fkVpFN83y4aN
 8CE50rZ7bDgLvC2+9Q0MGRVt+9qc4zaNrnuZzxYNIPLQJh5KmU5+tQEVuRKu8b0n5c1K
 rTZwfLKozUtrpRwpUTqup14JjUbihm2+CxRgdPlVYEX1PjVNgak94lVi+rPCr5t+kNl8
 x0caERIedX7leS1qHpKOayBIfgnhFGoNCepLvDe4SFnhUrGc/F4j6VqyvJ1YDwsCUF07
 4PSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gMwYiV+Yw71AALhhcn9l0PJAxE48bNZRvmcZ/9Op0B8=;
 b=CzM0YjOBAuEOYf6XzFujs26l6DhCsJxs3XBxdezXyVFBtPjS0Muf9Kgkua302F8k8b
 PWHYRGNMli0nPdtzQo5DmT0NNS+CWddUMhePl5PwwffFBxy/EfJfjJ8n+grfIUga0XLs
 xSpYbPg5fwWcxK3lsvzIbUQNjHDEX/XtNkhZpY6Cl8IjNSZ9MagNFrDwqfBBS4Zi0M5O
 uulBgPEcbulAiPbV7eZ775+nqtMA2c8DahiFWN4M5j2xQR0ocv8kJeY077x/aIaL4fCd
 Nv3R63C3yhgGWKlN9ipfL/Qbvq3mpbwQJEK8cmc9cHsn7iSYHif3nKKQ09rvtdTdeaa6
 oM/A==
X-Gm-Message-State: AOAM533Ue/wMirsPgAjNaxsLVkvIvIm9axosrsRyQMu5Ioi19lKo8E31
 iJ31ZSOAdIBftXUcEnUkV9NLPNkeiFs=
X-Google-Smtp-Source: ABdhPJy3/poct0+VDUIIkNoT1K8o03p0JKCwh4vh0KwM/q7lPnEPI2pr35WHEsfD23LwmakTKAeiCw==
X-Received: by 2002:a05:6602:1604:: with SMTP id
 x4mr18114233iow.84.1641065426185; 
 Sat, 01 Jan 2022 11:30:26 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id n5sm18046974ilm.87.2022.01.01.11.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 11:30:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 12:30:18 -0700
Message-Id: <20220101193018.404937-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220101193018.404937-1-james.hilliard1@gmail.com>
References: <20220101193018.404937-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/5] package/python-argon2-cffi-bindings: new
 package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/python-argon2-cffi-bindings/Config.in | 11 ++++++++
 .../python-argon2-cffi-bindings.hash          |  5 ++++
 .../python-argon2-cffi-bindings.mk            | 25 +++++++++++++++++++
 5 files changed, 43 insertions(+)
 create mode 100644 package/python-argon2-cffi-bindings/Config.in
 create mode 100644 package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.hash
 create mode 100644 package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e14842575a..1f9516da87 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1270,6 +1270,7 @@ F:	package/python-aiorwlock/
 F:	package/python-aiosignal/
 F:	package/python-aiozipkin/
 F:	package/python-argon2-cffi/
+F:	package/python-argon2-cffi-bindings/
 F:	package/python-async-lru/
 F:	package/python-async-timeout/
 F:	package/python-bidict/
diff --git a/package/Config.in b/package/Config.in
index a34323175d..f5c4c23e27 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -917,6 +917,7 @@ menu "External python modules"
 	source "package/python-ansicolors/Config.in"
 	source "package/python-argh/Config.in"
 	source "package/python-argon2-cffi/Config.in"
+	source "package/python-argon2-cffi-bindings/Config.in"
 	source "package/python-arrow/Config.in"
 	source "package/python-asgiref/Config.in"
 	source "package/python-asn1crypto/Config.in"
diff --git a/package/python-argon2-cffi-bindings/Config.in b/package/python-argon2-cffi-bindings/Config.in
new file mode 100644
index 0000000000..3d409759e0
--- /dev/null
+++ b/package/python-argon2-cffi-bindings/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_ARGON2_CFFI_BINDINGS
+	bool "python-argon2-cffi-bindings"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_USE_MMU # libargon2
+	depends on !BR2_STATIC_LIBS # libargon2
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	select BR2_PACKAGE_LIBARGON2
+	help
+	  Low-level CFFI bindings for Argon2.
+
+	  https://github.com/hynek/argon2-cffi-bindings
diff --git a/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.hash b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.hash
new file mode 100644
index 0000000000..e088d3dad1
--- /dev/null
+++ b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/argon2-cffi-bindings/json
+md5  f1591e1af7dea9ef3e5b982e2c196c1d  argon2-cffi-bindings-21.2.0.tar.gz
+sha256  bb89ceffa6c791807d1305ceb77dbfacc5aa499891d2c55661c6459651fc39e3  argon2-cffi-bindings-21.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  9c158d4f433627f48ac24b6b4d37970afe4172514673c5318014d7cca157c6df  LICENSE
diff --git a/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
new file mode 100644
index 0000000000..f0d71e803a
--- /dev/null
+++ b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# python-argon2-cffi-bindings
+#
+################################################################################
+
+PYTHON_ARGON2_CFFI_BINDINGS_VERSION = 21.2.0
+PYTHON_ARGON2_CFFI_BINDINGS_SOURCE = argon2-cffi-bindings-$(PYTHON_ARGON2_CFFI_BINDINGS_VERSION).tar.gz
+PYTHON_ARGON2_CFFI_BINDINGS_SITE = https://files.pythonhosted.org/packages/b9/e9/184b8ccce6683b0aa2fbb7ba5683ea4b9c5763f1356347f1312c32e3c66e
+PYTHON_ARGON2_CFFI_BINDINGS_SETUP_TYPE = setuptools
+PYTHON_ARGON2_CFFI_BINDINGS_LICENSE = MIT
+PYTHON_ARGON2_CFFI_BINDINGS_LICENSE_FILES = LICENSE
+PYTHON_ARGON2_CFFI_BINDINGS_DEPENDENCIES = \
+	host-python-cffi \
+	host-python-setuptools-scm \
+	libargon2
+PYTHON_ARGON2_CFFI_BINDINGS_ENV = ARGON2_CFFI_USE_SYSTEM=1
+
+ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
+PYTHON_ARGON2_CFFI_BINDINGS_ENV += ARGON2_CFFI_USE_SSE2=1
+else
+PYTHON_ARGON2_CFFI_BINDINGS_ENV += ARGON2_CFFI_USE_SSE2=0
+endif
+
+$(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
