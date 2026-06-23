Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1BDCDB471
	for <buildroot@archiver.kernel.org>; Tue, 23 Jun 2026 20:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 534316088F;
	Tue, 23 Jun 2026 20:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VEGMce-J5clX; Tue, 23 Jun 2026 20:49:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FF7E6083C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782247786;
	bh=47lXmEINNTA2neVYket4Vw+tlzqzRTJaqswtI8boOrI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ncHS+ZfSDDevyS0LVAcCdPypphX4WZZxR6ydfu7P4JhlYynFgo+/eeGHd1nCy8+Bs
	 i7JElhXq8mt5zBM8dtmVUlU4lTD7j427xXshPnWwNPc8a9gTxtutIoQgOQEf1Jyvp8
	 iHCSo7Z9jeXYUerrT76/HA9WiB6VPcAZQnnceWljxUa0BTLXrsWZ/75PKC3G0uVg/q
	 M7w0XaOdmJ4CpfZU4v0Ss6fH73Ax+rZjd4HZk9+Rig79tjt+CxF5A6T4AwoHvwdUPX
	 4oZpCVc/tE1h0JLRNcXcvwMKbniWie/Cb4ZKBnPfOz+clHtIg/gPMEgr815LM8nYdE
	 xsSwWlsMnkP5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FF7E6083C;
	Tue, 23 Jun 2026 20:49:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 444BE363
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 20:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29FC14038E
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 20:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWdYFgJPnyB1 for <buildroot@buildroot.org>;
 Tue, 23 Jun 2026 20:49:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f41; helo=mail-qv1-xf41.google.com;
 envelope-from=frcomdev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DAC9340336
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAC9340336
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DAC9340336
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 20:49:43 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id
 6a1803df08f44-8de7bfa323bso2906316d6.1
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 13:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782247782; x=1782852582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HkWbZmBsHvxvoKCsCvHBMyKKQ0/DFh7WQYQmy33z3g4=;
 b=II6AR1Eb9xM0WysLuSFMt6FamB6i6cLtAgSznPpPpeO8zfWb7WJwH9pr77bmhfxm8L
 xAxpq0/gHCx8fB0tuXFaqeyv9nqdAWTX0cmIF89NEF1rSEY8xM3ZbuRQCupgJZeOiCVm
 qOe5z44S0z4cd0OkA+6+V0/pg2ZqTY/Ve47ZfD9FbfZ4trsgpZY1sKDZScY09gCR6wkC
 bexSNHgvardbonFzab1SngSjLXPABIJ+8HWFkAPXO05mupTN2xzkcZg0wPOa9rNpHgaW
 dton2TO0PGKOuNV16x+hGydCUIFkqik2wfw2ysgQJPfp77Yw0mzYNSJIbuA93DjMOo1U
 cu1g==
X-Gm-Message-State: AOJu0Yx7qFOAQfdrnnHYdGDE8U7z5nS975TpKVm8sWshjSItswv/HB7I
 /3zlgRzppBKlzuHXKPa0sDDqVLDd7Bi0cSkxAKnWE/W1aHGBJOVYkg/g8aHqnwkL
X-Gm-Gg: AfdE7cnILSuPRr7Rd+MKz7YF+ODjD6yNvwgkp6zarPGhMwz97Q1uZuddlJqF9LeAN6t
 OdHb7NA0JBtqkap356VnJ64hS3iwGpoIxV7Zk4Pf326f00z+YhABoz+wlT+mEZUonwqDHUgBHDf
 lAweBZhkVojAKImKEnH9jHDEM0Rd7eogWtFfJZ2k8iC0SHEXjf3uevmOSnzaQO8tYw1ESHYCnP6
 BTqdEk1jASKrDrV+oeFfcVDM32mwuqEGnkODaVaxvp+2dGZ8zQBrq/aIOOPVvVqkYyEe08Y+Zvv
 lqMVwc8pTxyT6kMjoCM1N5RRlrVa7YTUsAW1DozWoIulFBMdxjHkUs+2gHb9Wem23ZLyQFdSXjI
 jxCF62qnqoPr9IJI/ZfXyczZG/tJv64uhOmmEoLzVGAg7fHuma4ZlRJVtMZ5913N6VwGO1GD47M
 Mb9VUDJ7YVHHjXFRml8uULveecR//xe1uvkwsQGwLmWKzHr1Gj/mS82o/7Hg==
X-Received: by 2002:a05:6214:29e9:b0:8d1:8cfd:b00c with SMTP id
 6a1803df08f44-8e535df618amr12521066d6.31.1782247782426; 
 Tue, 23 Jun 2026 13:49:42 -0700 (PDT)
Received: from precialexwin (24-226-155-142.static.cgocable.ca.
 [24.226.155.142]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8df82692405sm134588966d6.39.2026.06.23.13.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 13:49:41 -0700 (PDT)
From: Alexandre Ondet <frcomdev@gmail.com>
To: buildroot@buildroot.org
Cc: buildroot@bubu1.eu, james.hilliard1@gmail.com, thomas.petazzoni@bootlin.com
Date: Tue, 23 Jun 2026 15:49:33 -0500
Message-ID: <20260623204933.1251-1-frcomdev@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
In-Reply-To: <4392c04e-203a-447a-9160-370717fe6099@bubu1.eu>
References: <4392c04e-203a-447a-9160-370717fe6099@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782247782; x=1782852582; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HkWbZmBsHvxvoKCsCvHBMyKKQ0/DFh7WQYQmy33z3g4=;
 b=D4ZKgN8U2+ezKZE1RkVXG1Rf63MwAvbWcj63XvJWMGHd7PMfm+NMmTs82OncCaere9
 FUXPC2Y0gx/ItO40n8LP3bj3unLApzwTGvBoRpPawdd7m2BglhvbUkDOmhu7eUgsIX2q
 fOif5uaH2kEX3lCDK+xuW6CRvf0qQ84Q6xxx+mu5aQxqIlqWeizpat6nz8Tu9+DsiU+y
 9Zd27WwTuRQ4MwUunfHOUwi+6UJv8ePjOtcrsBst2IaAz66sjApQEQwaVzxgU0ngDfP5
 UUJKQzmhhausArtVWo6QiFFCGxO0VKisEOtQqSm3ufgcW8rcK/AwlTFTUKmO+l3PP+p/
 Wmdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=D4ZKgN8U
Subject: [Buildroot] [PATCH v2 06/13] package/python-nmcli: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alexandre Ondet <frcomdev@gmail.com>
---
Changes v1 -> v2:
- depend on network-manager and select nmcli support
- add a runtime test for the python nmcli module
- add DEVELOPERS entries for the package and runtime test
- fix missing trailing newlines in package files

 DEVELOPERS                                    |  5 ++++
 package/Config.in                             |  1 +
 package/python-nmcli/Config.in                |  8 +++++++
 package/python-nmcli/python-nmcli.hash        |  3 +++
 package/python-nmcli/python-nmcli.mk          | 14 +++++++++++
 .../tests/package/sample_python_nmcli.py      |  8 +++++++
 .../tests/package/test_python_nmcli.py        | 24 +++++++++++++++++++
 7 files changed, 63 insertions(+)
 create mode 100644 package/python-nmcli/Config.in
 create mode 100644 package/python-nmcli/python-nmcli.hash
 create mode 100644 package/python-nmcli/python-nmcli.mk
 create mode 100644 support/testing/tests/package/sample_python_nmcli.py
 create mode 100644 support/testing/tests/package/test_python_nmcli.py

diff --git a/DEVELOPERS b/DEVELOPERS
index c6c228ae91..fb26c25928 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -147,6 +147,11 @@ N:	Alexandre Esse <alexandre.esse.dev@gmail.com>
 F:	package/kvazaar/
 F:	package/v4l2loopback/
 
+N:	Alexandre Ondet <frcomdev@gmail.com>
+F:	package/python-nmcli/
+F:	support/testing/tests/package/sample_python_nmcli.py
+F:	support/testing/tests/package/test_python_nmcli.py
+
 N:	Alexey Brodkin <alexey.brodkin@synopsys.com>
 F:	board/cubietech/cubieboard2/
 F:	configs/cubieboard2_defconfig
diff --git a/package/Config.in b/package/Config.in
index 754bdee9f4..83c9e0809c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1261,6 +1261,7 @@ menu "External python modules"
 	source "package/python-netifaces/Config.in"
 	source "package/python-networkmanager/Config.in"
 	source "package/python-networkx/Config.in"
+	source "package/python-nmcli/Config.in"
 	source "package/python-numpy/Config.in"
 	source "package/python-oauthlib/Config.in"
 	source "package/python-opcua-asyncio/Config.in"
diff --git a/package/python-nmcli/Config.in b/package/python-nmcli/Config.in
new file mode 100644
index 0000000000..a860f511c4
--- /dev/null
+++ b/package/python-nmcli/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_NMCLI
+	bool "python-nmcli"
+	depends on BR2_PACKAGE_NETWORK_MANAGER # runtime
+	select BR2_PACKAGE_NETWORK_MANAGER_CLI # runtime
+	help
+	  Python wrapper for nmcli (NetworkManager).
+
+	  https://github.com/ushiboy/nmcli
diff --git a/package/python-nmcli/python-nmcli.hash b/package/python-nmcli/python-nmcli.hash
new file mode 100644
index 0000000000..a93e026dce
--- /dev/null
+++ b/package/python-nmcli/python-nmcli.hash
@@ -0,0 +1,3 @@
+# From https://pypi.org/pypi/nmcli/1.7.0/json
+sha256  4fb17b6c33d276a264a27b7109fa1d70987570536fa8852b51830f9f7732f982  nmcli-1.7.0.tar.gz
+sha256  9dbbc4debacc85f5f5f074614cd9cadd61da09eaa19f98f6bbb5463c34133820  LICENSE.txt
diff --git a/package/python-nmcli/python-nmcli.mk b/package/python-nmcli/python-nmcli.mk
new file mode 100644
index 0000000000..005519f0c1
--- /dev/null
+++ b/package/python-nmcli/python-nmcli.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-nmcli
+#
+################################################################################
+
+PYTHON_NMCLI_VERSION = 1.7.0
+PYTHON_NMCLI_SOURCE = nmcli-$(PYTHON_NMCLI_VERSION).tar.gz
+PYTHON_NMCLI_SITE = https://files.pythonhosted.org/packages/source/n/nmcli
+PYTHON_NMCLI_SETUP_TYPE = setuptools
+PYTHON_NMCLI_LICENSE = MIT
+PYTHON_NMCLI_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_nmcli.py b/support/testing/tests/package/sample_python_nmcli.py
new file mode 100644
index 0000000000..5fa8dee0c4
--- /dev/null
+++ b/support/testing/tests/package/sample_python_nmcli.py
@@ -0,0 +1,8 @@
+#!/usr/bin/env python3
+
+import nmcli
+
+general = nmcli.general.status()
+print(general)
+
+assert general.state is not None
diff --git a/support/testing/tests/package/test_python_nmcli.py b/support/testing/tests/package/test_python_nmcli.py
new file mode 100644
index 0000000000..20fffa2356
--- /dev/null
+++ b/support/testing/tests/package/test_python_nmcli.py
@@ -0,0 +1,24 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Nmcli(TestPythonPackageBase):
+    __test__ = True
+    # Can't use TestPythonPackageBase.config because we need headers
+    # >= 5.4 for network-manager, so we have to use the bleeding-edge
+    # toolchain.
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_INIT_SYSTEMD=y
+        BR2_PACKAGE_NETWORK_MANAGER=y
+        BR2_PACKAGE_PYTHON_NMCLI=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    sample_scripts = ["tests/package/sample_python_nmcli.py"]
+
+    timeout = 30
-- 
2.53.0.windows.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
