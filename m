Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E68EC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 12:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E26C183096;
	Sat,  4 Dec 2021 12:06:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t-W_F-cOePwD; Sat,  4 Dec 2021 12:06:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22294831F2;
	Sat,  4 Dec 2021 12:06:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 166BA1BF30A
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 12:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03E1A831F2
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 12:06:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l-Cb8BJhxBCO for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 12:05:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25CED83096
 for <buildroot@busybox.net>; Sat,  4 Dec 2021 12:05:58 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j3so11635999wrp.1
 for <buildroot@busybox.net>; Sat, 04 Dec 2021 04:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5KGLi5UBn/Z3GMXk1ThtQV295ypA77rJ6cVkZgKFrio=;
 b=StIGz2rrTByddXh7HkmxSE1xfXcFgG8C1cN8Y8/KZQ/YXq0RgYVRrWiStwc0URYrey
 vF0WQgDFNwoTzEW9lEwRYKxD7WKhuLwqzyUYI8/64RRruKjRetRAz1LOoJpLansodkxF
 ygJpqYb7rQ7EHYZpyKTchi/VNkd3bfzjYKXFTsaiiK9y2nUgAetx1ZXW6kpYSPi38GFM
 vz1PnDkRTDqAe8ZFRAnyLwQvk8XlW0Da6o0Dssb4XexS/eacDLMw6isjTPCtlrdLoBic
 K/kMbi1g9k46IbNTo5kVXydrtoxi32+vGYVtgtZ4HPcOquN2TLBo3K1s6J29L47/0wRF
 +NvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5KGLi5UBn/Z3GMXk1ThtQV295ypA77rJ6cVkZgKFrio=;
 b=6Is47/FiDaxcLLZICbuqQBw4qN+GK3H/nLsfgEZHxaUZqaLxIm9m92jf5KCjqAeJDD
 nqROcxfWIkbupBtNqQKqUx3LbAp0cRPra01MYbKGMjGMdagY95WWNGthGQF+TopGZNdq
 sRECX4vqsN6OG+cj3fEqO4TDHzOEQDZhkNfqovBqobkOg7RzbOUPJnA5uBlRAf1l+JRq
 G4BebMce8JF1ZmLlB0/MLMtJNfKYHNx/uPlYdqk+bTA5Q35OgscOOewIbxmNmVLIN4lk
 cSfay6Lf/rNz2fKbScg9RFUc3AtR+0gYMPAO1Zw0KcyXSbgw5Obc/dnCc8aFr9/l66Cp
 h8FQ==
X-Gm-Message-State: AOAM531rb+ePrLlGEvCdt17Nrkyy6N7iakN4BwZbdp0Q+iWvFMoHGpu1
 K49guix9TtBV5czd2/qFLZZp0s2rWOg=
X-Google-Smtp-Source: ABdhPJyLqWwGDWFG8EwnNDNLOeT8oB+Gbq13u9sCEg21pJt4ovKRQ+uIDPW+YWxUhO18JGYqXYUChw==
X-Received: by 2002:a5d:588b:: with SMTP id n11mr28362451wrf.344.1638619555943; 
 Sat, 04 Dec 2021 04:05:55 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id b10sm5437927wrt.36.2021.12.04.04.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 04:05:55 -0800 (PST)
From: guillaume.bressaix@gmail.com
To: buildroot@busybox.net
Date: Sat,  4 Dec 2021 13:05:47 +0100
Message-Id: <20211204120548.31170-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next v2 1/2]: pybind11: new package
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
Cc: thomas.petazzoni@bootlin.com, yann.morin.1998@free.fr, asafka7@gmail.com,
 "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

fixes http://autobuild.buildroot.net/results/b89f1de64b308dffa73675f1f31ccb0b7be5a10d
fixes http://autobuild.buildroot.net/results/d0287b7f64f206b0f074908c5780a3632e0cb799
fixes http://autobuild.buildroot.net/results/27efb545a5a719a5581c8f746d3a3555ff4216ce
fixes http://autobuild.buildroot.net/results/d2f0a0ad8f6c7178517df109e7d885dac9134c3a
fixes http://autobuild.buildroot.net/results/b57e9a3279260dae4a590f9421238fcabb2f7cab
fixes http://autobuild.buildroot.net/results/515e6f2fc6b5780260d98d6bb52b541ce4bf1afe
fixes http://autobuild.buildroot.net/results/d89c4ecc81222d4f80c951da2232d2e393fa1c69
list goes on..

---
v2: Reviewed by gwen@trabucayre.com,
Removed some non needed empty lines,
force -DFINDPYTHON=OFF when using pybind11 without python,
handle legacy package properly in a seperate patch

v1: python-pybind was not the right approach and is in failure since
it's been upgraded to V2.6.1.

Building with setup.py now requires a cmake build first.
With this new approach we can build the package with cmake
for python bindings in C++ AND we also have the
C++ bindings in python as an option (depending & requiring the first one).

I make this a host-only package, in the sense that other packages will
require it at build time, and I don't forsee any reasons to have
such a package as a target package.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/pybind11/Config.in     | 25 +++++++++++++++++++++
 package/pybind11/pybind11.hash |  3 +++
 package/pybind11/pybind11.mk   | 41 ++++++++++++++++++++++++++++++++++
 5 files changed, 71 insertions(+)
 create mode 100644 package/pybind11/Config.in
 create mode 100644 package/pybind11/pybind11.hash
 create mode 100644 package/pybind11/pybind11.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6f812eb564..8a04efa63f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1105,6 +1105,7 @@ F:	package/libxcrypt/
 F:	package/liquid-dsp/
 F:	package/pixiewps/
 F:	package/python-pybind/
+F:	package/pybind11/
 F:	package/reaver/
 
 N:	Guo Ren <ren_guo@c-sky.com>
diff --git a/package/Config.in b/package/Config.in
index 311004db2c..5749118ee3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2006,6 +2006,7 @@ endif
 	source "package/protobuf/Config.in"
 	source "package/protobuf-c/Config.in"
 	source "package/protozero/Config.in"
+	source "package/pybind11/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
 	source "package/riemann-c-client/Config.in"
diff --git a/package/pybind11/Config.in b/package/pybind11/Config.in
new file mode 100644
index 0000000000..4fc6c5eebc
--- /dev/null
+++ b/package/pybind11/Config.in
@@ -0,0 +1,25 @@
+comment "pybind11 needs a toolchain w/ C++, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+
+config BR2_PACKAGE_PYBIND11
+	bool "pybind11"
+	depends on BR2_USE_WCHAR # boost
+	depends on BR2_INSTALL_LIBSTDCPP # boost
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	select BR2_PACKAGE_BOOST
+	help
+	  Pybind11 is a lightweight header-only library that exposes C++
+	  types in Python and vice versa, mainly to create Python
+	  bindings of existing C++ code.
+
+	  http://pybind11.readthedocs.org/en/master
+
+if BR2_PACKAGE_PYBIND11
+
+config BR2_PACKAGE_PYBIND11_WITH_PYTHON
+	bool "pybind11-python"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Activate support for python
+
+endif
diff --git a/package/pybind11/pybind11.hash b/package/pybind11/pybind11.hash
new file mode 100644
index 0000000000..ab8825bf04
--- /dev/null
+++ b/package/pybind11/pybind11.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 f1bcc07caa568eb312411dde5308b1e250bd0e1bc020fae855bf9f43209940cc  pybind11-2.8.1.tar.gz
+sha256 83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
diff --git a/package/pybind11/pybind11.mk b/package/pybind11/pybind11.mk
new file mode 100644
index 0000000000..a67ce237ea
--- /dev/null
+++ b/package/pybind11/pybind11.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# pybind11
+#
+################################################################################
+
+PYBIND11_VERSION = 2.8.1
+PYBIND11_SITE = $(call github,pybind,pybind11,v$(PYBIND11_VERSION))
+PYBIND11_LICENSE = BSD-3-Clause
+PYBIND11_LICENSE_FILES = LICENSE
+PYBIND11_INSTALL_STAGING = YES
+PYBIND11_SUPPORTS_IN_SOURCE_BUILD = YES
+
+HOST_PYBIND11_CONF_OPTS = \
+	-DBUILD_DOCS=OFF \
+	-DDOWNLOAD_EIGEN=OFF
+
+# pybind11 python support activation
+ifeq ($(BR2_PACKAGE_PYBIND11_WITH_PYTHON),y)
+HOST_PYBIND11_DEPENDENCIES += host-python3
+
+# pybind11 with python requires cmake install in $(@D)
+HOST_PYBIND11_CONF_OPTS += \
+	-DCMAKE_INSTALL_PREFIX=$(@D)/pybind11 \
+	-DPYTHON=$(HOST_DIR)/bin/python3 \
+	-DPYTHON_PREFIX=$(STAGING_DIR)/usr \
+	-DPYBIND_FINDPYTHON=ON \
+	-DPYBIND11_NOPYTHON=OFF
+
+define PYBIND11_PYTHON_BUILD
+	cd $(@D) && $(HOST_DIR)/bin/python setup.py install
+endef
+
+HOST_PYBIND11_POST_INSTALL_HOOKS += PYBIND11_PYTHON_BUILD
+else
+HOST_PYBIND11_CONF_OPTS += \
+	-DPYBIND_FINDPYTHON=OFF \
+	-DPYBIND11_NOPYTHON=ON
+endif
+
+$(eval $(host-cmake-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
