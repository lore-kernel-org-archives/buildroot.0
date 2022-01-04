Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981A6C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 12:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59161409A9;
	Tue,  4 Jan 2022 12:40:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uJxkhMjDA9R0; Tue,  4 Jan 2022 12:40:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F5A5409B4;
	Tue,  4 Jan 2022 12:40:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A14011BF288
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 12:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 902F682881
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 12:39:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id psYYU3bHbIGT for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 12:39:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29397818D0
 for <buildroot@busybox.net>; Tue,  4 Jan 2022 12:39:52 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id o3so17708104wrh.10
 for <buildroot@busybox.net>; Tue, 04 Jan 2022 04:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gOKwggmzs3ys+4qxBj5ogDOwZ04VRiaRGE1C858jtmA=;
 b=Trrg2VkcBuZz+MExyaFglzk+dqMqBhEmToQYfnhWlAvNLAJBdq0mB1RRRk96deRMwN
 MvotOck/z2nUWsfFsO4n6q5SpaCkxSc4ytmfSCB8d345I0/cTKN5CtooDmN4T9AkAQUC
 jNFUMFAwLjYBT/x8+4ULQsU6TIL4G5U95cwzb6HMqz0nkivYlxw5+NX6HwWQqgAt26DR
 gYHUBUhunqJZ1RS+BvdXSSjsR4VuVUkLLS+CofDNLD651FR2b5Xpxbr1ER+GVNJKH9np
 IcSC/jjw5tkG/ClccuNy6x5i4fhoQ/Q8yUO/1EalU+/pCGc+ptEpGupnQ6DJextlWMZP
 dY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gOKwggmzs3ys+4qxBj5ogDOwZ04VRiaRGE1C858jtmA=;
 b=EnwVQ05fAashnEZ4b7bWWcZyKr5P1r1xH3HcWsVva9seQ49m4DOgGGfI1cyw8FXkiY
 plaZfLFHdZUo10S1bqh6el+GAAvgIcNTZ2LgYYYQOaKVudij98K0GcqHVPcOKQv1JeGh
 HgzSgJofnnWlNZpGrJ29Owq05OdK/f2RSyjoRLEeCZ5W9DeP8fGPhyWyMysw+r+6KOVG
 GPvJ1jVlHkLKii8vv5AjNPIhbkHHeRf+IFMINVmU4eaEAJ/2Rgux+WfOkMmbdeXYqKBD
 EWWx9V2jAv3GmLfPu35LAxXXo1GBXWXVCDODED4OVhoKvFL4vmhouqoZTVk2fiEYzAFZ
 gzfA==
X-Gm-Message-State: AOAM531abutdt9EG2aEcWv5CuIOhkGfOadvVNoqpxkldDWtkkK0fzO4i
 WLCol4ZuUKKmxjZLAZfV9YQacGpehRQ=
X-Google-Smtp-Source: ABdhPJy1b2gWJqruEnaTCUzcfxf1LP44/c+YAnCLNmNTwX7N5Ip65Jmwm2RvOzljKg8rq11Hf2/SiA==
X-Received: by 2002:a05:6000:18aa:: with SMTP id
 b10mr42539282wri.305.1641299990241; 
 Tue, 04 Jan 2022 04:39:50 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id g7sm38712303wrx.104.2022.01.04.04.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 04:39:50 -0800 (PST)
From: guillaume.bressaix@gmail.com
To: buildroot@busybox.net
Date: Tue,  4 Jan 2022 13:39:01 +0100
Message-Id: <20220104123901.23929-3-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220104123901.23929-1-guillaume.bressaix@gmail.com>
References: <cae0c1b2-34bb-b1a9-f02a-9e98ddd9fbe5@ideasonboard.com>
 <20220104123901.23929-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/3] support/testing: add test for
 python-pybind
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
Cc: tomi.valkeinen@ideasonboard.com, yann.morin.1998@free.fr,
 "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

python-pybind is a header only library, most of the time used as a host-package,
to customize the host/usr/python interpreter capacity (at build time) with C++ based features.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
This test case enhances the /host/usr/python interpreter with a C++ macro.

The test delivers a C++ macro contained in its br-external/example.cpp.
We compile it against the host context.
We install it to $(HOST_DIR)/usr/lib/python3.9 as it is natively contained
in the host-python system path (import is easy).
The macro is an integer adder, written in C++ that we can now call in host-python.

The test infrastructure should actually be declared "host-generic-package"
instead of "generic-package", to be consistent with Buildroot infrastructure.
But I am not able to get this to actually do anything, if I declare this package
as a host-generic and "Config.in.host" instead of "Config.in". To me, this is
not too important

* TestPythonPybind allows testing for both Py2 and Py3 like it is done
in many other packages

* TestPythonPybind does not inherit from TestPythonPackageBase as usually done
  (1) because I need the br2-external feature to ship the example.cpp containing the custom macro
  (2) because TestPythonPackageBase always involves the emulator, which we do not want in our context

* Although TestPythonPybind does have a TestPythonBase.config base at the same time,
as it is most convenient to have a valid python context

* TestPythonPybind uses subprocess, as similarly done in 'core' on 'infra' test cases,
because we do not involve the emulator

* TestPythonPybind tests (1+2)=3 written in C++, used in Python 2/3
* TestPythonPybind tests a custom module attribute, written in C++, used in Python 2/3

---
 DEVELOPERS                                    |  3 ++
 .../br2-external/python-pybind/Config.in      |  1 +
 .../br2-external/python-pybind/external.desc  |  1 +
 .../br2-external/python-pybind/external.mk    |  1 +
 .../package/python-pybind-example/Config.in   |  5 ++
 .../package/python-pybind-example/example.cpp | 16 +++++++
 .../python-pybind-example.mk                  | 47 ++++++++++++++++++
 .../tests/package/sample_python_pybind.py     |  4 ++
 .../tests/package/test_python_pybind.py       | 48 +++++++++++++++++++
 9 files changed, 126 insertions(+)
 create mode 100644 support/testing/tests/package/br2-external/python-pybind/Config.in
 create mode 100644 support/testing/tests/package/br2-external/python-pybind/external.desc
 create mode 100644 support/testing/tests/package/br2-external/python-pybind/external.mk
 create mode 100644 support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/Config.in
 create mode 100644 support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/example.cpp
 create mode 100644 support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/python-pybind-example.mk
 create mode 100644 support/testing/tests/package/sample_python_pybind.py
 create mode 100644 support/testing/tests/package/test_python_pybind.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 21e4f2a84c..130ac3db73 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1120,6 +1120,9 @@ F:	package/liquid-dsp/
 F:	package/pixiewps/
 F:	package/python-pybind/
 F:	package/reaver/
+F:	support/testing/tests/package/br2-external/python-pybind
+F:	support/testing/tests/package/sample_python_pybind.py
+F:	support/testing/tests/package/test_python_pybind.py
 
 N:	Guo Ren <ren_guo@c-sky.com>
 F:	arch/Config.in.csky
diff --git a/support/testing/tests/package/br2-external/python-pybind/Config.in b/support/testing/tests/package/br2-external/python-pybind/Config.in
new file mode 100644
index 0000000000..70c77157b3
--- /dev/null
+++ b/support/testing/tests/package/br2-external/python-pybind/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_PYTHON_PYBIND_PATH/package/python-pybind-example/Config.in"
diff --git a/support/testing/tests/package/br2-external/python-pybind/external.desc b/support/testing/tests/package/br2-external/python-pybind/external.desc
new file mode 100644
index 0000000000..eef5e0f5a0
--- /dev/null
+++ b/support/testing/tests/package/br2-external/python-pybind/external.desc
@@ -0,0 +1 @@
+name: PYTHON_PYBIND
diff --git a/support/testing/tests/package/br2-external/python-pybind/external.mk b/support/testing/tests/package/br2-external/python-pybind/external.mk
new file mode 100644
index 0000000000..3501f3135e
--- /dev/null
+++ b/support/testing/tests/package/br2-external/python-pybind/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_PYTHON_PYBIND_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/Config.in b/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/Config.in
new file mode 100644
index 0000000000..773d021a53
--- /dev/null
+++ b/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_PYTHON_PYBIND_EXAMPLE
+	bool "python-pybind-example"
+	depends on BR2_PACKAGE_PYTHON_PYBIND
+	help
+	  This test creates a cpp macro later used on target in python
diff --git a/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/example.cpp b/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/example.cpp
new file mode 100644
index 0000000000..f2eea8e48d
--- /dev/null
+++ b/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/example.cpp
@@ -0,0 +1,16 @@
+#include <pybind11/pybind11.h>
+namespace py = pybind11;
+
+int add (int i, int j) {
+    return i + j;
+}
+
+PYBIND11_MODULE (example, m) {
+    // optional module description
+    m.doc() = "pybind11 example plugin";
+    // test a module method
+    m.def("add", &add, "example::add adds two integer numbers");
+    // test a module attribute
+    py::object hello = py::cast("Hello World");
+    m.attr("says") = hello;
+}
diff --git a/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/python-pybind-example.mk b/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/python-pybind-example.mk
new file mode 100644
index 0000000000..85dd09d93f
--- /dev/null
+++ b/support/testing/tests/package/br2-external/python-pybind/package/python-pybind-example/python-pybind-example.mk
@@ -0,0 +1,47 @@
+################################################################################
+#
+# python-pybind-example
+#
+################################################################################
+
+# this builds a C++ macro "add(a,b)"
+# that we expose to host-python with a custom install
+# and that the python test script will later use
+PYTHON_PYBIND_EXAMPLE_DEPENDENCIES = host-python-pybind
+
+PYTHON_PYBIND_EXAMPLE_CXX_FLAGS = $(HOST_CXXFLAGS)
+PYTHON_PYBIND_EXAMPLE_CXX_FLAGS += -Wall -shared
+PYTHON_PYBIND_EXAMPLE_CXX_FLAGS += -std=c++11 -fPIC
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+PYTHON_PYBIND_PYVER = python$(PYTHON3_VERSION_MAJOR)
+PYTHON_PYBIND_PYTHON = $(HOST_DIR)/usr/bin/python3
+else
+PYTHON_PYBIND_PYVER = python$(PYTHON_VERSION_MAJOR)
+PYTHON_PYBIND_PYTHON = $(HOST_DIR)/usr/bin/python2
+endif
+
+# retrieve pybind11 include paths
+PYTHON_PYBIND_EXAMPLE_CXX_FLAGS += \
+	$(shell $(PYTHON_PYBIND_PYTHON) -m pybind11 --includes)
+
+# .so to be installed must have exact suffix
+# otherwise import() in python will not work
+HOST_LIB_BINARY_SUFFIX = \
+	$(shell $(PYTHON_PYBIND_PYTHON)-config --extension-suffix)
+
+define PYTHON_PYBIND_EXAMPLE_BUILD_CMDS
+	$(INSTALL) $(PYTHON_PYBIND_EXAMPLE_PKGDIR)/example.cpp $(@D)
+	cd $(@D); \
+			$(HOSTCXX) $(PYTHON_PYBIND_EXAMPLE_CXX_FLAGS) \
+				example.cpp -o example$(HOST_LIB_BINARY_SUFFIX)
+endef
+
+# installs into host/python sys.path
+# so the new macro is naturally known
+define PYTHON_PYBIND_EXAMPLE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/example$(HOST_LIB_BINARY_SUFFIX) \
+		$(HOST_DIR)/usr/lib/$(PYTHON_PYBIND_PYVER)/example$(HOST_LIB_BINARY_SUFFIX)
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/sample_python_pybind.py b/support/testing/tests/package/sample_python_pybind.py
new file mode 100644
index 0000000000..605c0bab15
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pybind.py
@@ -0,0 +1,4 @@
+#!/usr/bin/env python
+import example
+print(example.add(1, 2))
+print(example.says)
diff --git a/support/testing/tests/package/test_python_pybind.py b/support/testing/tests/package/test_python_pybind.py
new file mode 100644
index 0000000000..7a68d6512a
--- /dev/null
+++ b/support/testing/tests/package/test_python_pybind.py
@@ -0,0 +1,48 @@
+import os
+import infra
+import subprocess
+from tests.package.test_python import TestPythonPackageBase
+
+class TestPythonPybind (infra.basetest.BRTest):
+	config = TestPythonPackageBase.config # python minimal requirements
+	sample_script = "tests/package/sample_python_pybind.py"
+	# ship examples macro & installs it to host
+	br2_external = [infra.filepath("tests/package/br2-external/python-pybind")]
+
+class TestPythonPy2Pybind (TestPythonPybind):
+	__test__ = True
+	config = TestPythonPybind.config + \
+		"""
+		BR2_PACKAGE_PYTHON=y
+		BR2_PACKAGE_PYTHON_PYBIND=y
+		BR2_PACKAGE_PYTHON_PYBIND_EXAMPLE=y
+		"""
+
+	def test_run(self):
+		host_interpreter = os.path.join(self.builddir,"host","usr","bin","python")
+		# test new c++->py macro exposed to host interpreter
+		cmd = [host_interpreter, infra.filepath(self.sample_script)]
+		output = subprocess.check_output(cmd)
+		result = int(output.splitlines()[0])
+		attribute = output.splitlines()[1].decode("utf-8")
+		self.assertEqual(result,3) # 2+1 using '+' macro from cpp
+		self.assertEqual(attribute,"Hello World") # macro special attribute
+
+class TestPythonPy3Pybind (TestPythonPybind):
+	__test__ = True
+	config = TestPythonPybind.config + \
+		"""
+		BR2_PACKAGE_PYTHON3=y
+		BR2_PACKAGE_PYTHON_PYBIND=y
+		BR2_PACKAGE_PYTHON_PYBIND_EXAMPLE=y
+		"""
+
+	def test_run(self):
+		host_interpreter = os.path.join(self.builddir,"host","usr","bin","python")
+		# test new c++->py macro exposed to host interpreter
+		cmd = [host_interpreter, infra.filepath(self.sample_script)]
+		output = subprocess.check_output(cmd)
+		result = int(output.splitlines()[0])
+		attribute = output.splitlines()[1].decode("utf-8")
+		self.assertEqual(result,3) # 2+1 using '+' macro from cpp
+		self.assertEqual(attribute,"Hello World") # macro special attribute
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
