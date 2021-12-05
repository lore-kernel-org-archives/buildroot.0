Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAC2C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 00:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5856882EDB;
	Sun,  5 Dec 2021 00:12:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4SJLYsUPLyEM; Sun,  5 Dec 2021 00:12:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF03D82CFD;
	Sun,  5 Dec 2021 00:12:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86C2F1BF95D
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 00:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76F9582CFD
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 00:12:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EdpdIQvp0-BT for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 00:12:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80A2282C91
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 00:12:02 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id b187so8501164iof.11
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 16:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6WeppuKYbMxC8f4wpm7P9WHuim8fqZsmhF3v0Mv6djg=;
 b=JUOFdizci6wBcJfkw9Nk7b9z92f7zwiZT+GZKdGdB6ZYAAxMgsZnzGgH9eg5rxEJmx
 Q2oAnSO5se4dgWmY/uotkJvxb4+YWfuLiwUgh0XWhId/8eQR5+psX8j5lEMYJlTI39U7
 psPLSCMtS7qQfMzbuSjEu2vq5N2FoJrUAobxpxohx2mbrniZK+iSPLnA6rAwZcMIbX2+
 BZxvFKHdvNwd43H1DyAMNisXvOMP2r4517zYFfnayuTE23/Vf3YUoFLV3p6yTZB8QqzV
 tsk4H9dvGcMEXjYyBfMPE0M8F8+4PdZGtF2YzGGX0whH+0RW6lGnLiAzPVHtAb3VC/qM
 EG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6WeppuKYbMxC8f4wpm7P9WHuim8fqZsmhF3v0Mv6djg=;
 b=RFNScM2yRejcWhpbesaz/Oz5qZK6w9rz1DSGhLqLX2Xm8qEjPVWOxwvxsbDA3GI1Gc
 DwNNo2F2n+b/L7WiF3TvzHf7vjKrjfoLkJyRbO4IJzzTMPoeiJ05eWcGKFC0vZ5HotNb
 WHPqm7dAckSJASXQaQVn+AVSYMljgv5GX8VjtjFsSSDD6GkZQQMKPzjOZvVjeWgscPhI
 UvrKijx7LraSHy+oBGZBGLrjn8kprzK7+OVN/P7LfMVXhER8eCECzkMPb/iR++8aM2Un
 MUlwO2xu/w7S8BAVcbe9MuyhYAW414I78xuMncwAFJgJS/bWRWLopEI6IOhB00FmwUQ0
 uPAA==
X-Gm-Message-State: AOAM531TIrI/+l5tNldZXKrPtUdfvcyCmlsaOPO0czj4QoondgrcuYGr
 Hs3c0DaOKILa9Sz7Anq7Bp5Q4jaNhlw=
X-Google-Smtp-Source: ABdhPJxbA56TKiqOuDH1dTq3gbX574mOQ4DaFS1iCyVllQ1udSfMQR3dFKheiy9RjkM70QUisH/N1Q==
X-Received: by 2002:a05:6638:1115:: with SMTP id
 n21mr32739784jal.143.1638663121385; 
 Sat, 04 Dec 2021 16:12:01 -0800 (PST)
Received: from james-x399.localdomain (71-218-107-26.hlrn.qwest.net.
 [71.218.107.26])
 by smtp.gmail.com with ESMTPSA id b8sm4333309ilj.0.2021.12.04.16.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 16:12:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 17:11:54 -0700
Message-Id: <20211205001156.2402104-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211205001156.2402104-1-james.hilliard1@gmail.com>
References: <20211205001156.2402104-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/4] package/pkg-python: add flit package
 infrastructure
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Due to flit removing the setup.py generation from the default sdist
releases we need to add a hook that generates them before we can do
a build and install using distutils.

Installing flit/flit-core is also a bit tricky since we also need
to generate setup.py's for them as well, we can do this by adding
their build directories to path and calling the internal methods
required to do the setup.py generation.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-python.mk                         | 30 ++++++-
 ...sion-parser-for-multiple-assignments.patch | 80 +++++++++++++++++++
 .../python-flit-core/python-flit-core.hash    |  3 +
 package/python-flit-core/python-flit-core.mk  | 34 ++++++++
 package/python-flit/python-flit.hash          |  5 ++
 package/python-flit/python-flit.mk            | 17 ++++
 6 files changed, 166 insertions(+), 3 deletions(-)
 create mode 100644 package/python-flit-core/0001-Fix-ast-version-parser-for-multiple-assignments.patch
 create mode 100644 package/python-flit-core/python-flit-core.hash
 create mode 100644 package/python-flit-core/python-flit-core.mk
 create mode 100644 package/python-flit/python-flit.hash
 create mode 100644 package/python-flit/python-flit.mk

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index e6b81bdfd3..f50c33a89a 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -120,8 +120,8 @@ ifndef $(2)_SETUP_TYPE
  endif
 endif
 
-# Distutils
-ifeq ($$($(2)_SETUP_TYPE),distutils)
+# Distutils/flit
+ifneq ($$(filter distutils flit,$$($(2)_SETUP_TYPE)),)
 ifeq ($(4),target)
 $(2)_BASE_ENV         = $$(PKG_PYTHON_DISTUTILS_ENV)
 $(2)_BASE_BUILD_TGT   = build
@@ -149,7 +149,7 @@ $(2)_BASE_BUILD_OPTS   =
 $(2)_BASE_INSTALL_OPTS = $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
 endif
 else
-$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils' or 'setuptools'")
+$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools' or 'flit")
 endif
 
 # Target packages need both the python interpreter on the target (for
@@ -212,6 +212,10 @@ $(2)_DEPENDENCIES += $$(if $$(filter host-python-setuptools,$(1)),,host-python-s
 endif
 endif # SETUP_TYPE
 
+ifeq ($$($(2)_SETUP_TYPE),flit)
+$(2)_DEPENDENCIES += $$(if $$(filter host-python-flit host-python-flit-core,$(1)),,host-python-flit-core)
+endif # SETUP_TYPE
+
 # Python interpreter to use for building the package.
 #
 # We may want to specify the python interpreter to be used for building a
@@ -236,12 +240,32 @@ $(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/$$($(2)_NEEDS_HOST_PYTHON)
 endif
 endif
 
+ifeq ($$($(2)_SETUP_TYPE),flit)
+ifndef $(2)_FLIT_GENERATE_SETUP
+define $(2)_FLIT_GENERATE_SETUP
+	(cd $$($$(PKG)_BUILDDIR)/; \
+		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
+		$$($(2)_PYTHON_INTERPRETER) -c \
+		"import sys; \
+		sys.modules['requests'] = False; \
+		from flit.sdist import SdistBuilder; \
+		from pathlib import Path; \
+		cwd=Path.cwd(); \
+		setup=cwd.joinpath('setup.py').open('wb'); \
+		pyproject=cwd.joinpath('pyproject.toml'); \
+		builder=SdistBuilder.from_ini_path(pyproject); \
+		setup.write(builder.make_setup_py())")
+endef
+endif
+endif
+
 #
 # Build step. Only define it if not already defined by the package .mk
 # file.
 #
 ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
+	$$($$(PKG)_FLIT_GENERATE_SETUP)
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
 		$$($(2)_PYTHON_INTERPRETER) setup.py \
diff --git a/package/python-flit-core/0001-Fix-ast-version-parser-for-multiple-assignments.patch b/package/python-flit-core/0001-Fix-ast-version-parser-for-multiple-assignments.patch
new file mode 100644
index 0000000000..5a94e1dcab
--- /dev/null
+++ b/package/python-flit-core/0001-Fix-ast-version-parser-for-multiple-assignments.patch
@@ -0,0 +1,80 @@
+From 2cd8b5708be88b90ea2fa0fb35407a5ec2038c8e Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sat, 27 Nov 2021 02:36:15 -0700
+Subject: [PATCH] Fix ast version parser for multiple assignments
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/takluyver/flit/pull/474]
+---
+ flit_core/common.py                 | 21 +++++++++++--------
+ .../tests/samples/moduleunimportabledouble.py |  8 +++++++
+ flit_core/tests/test_common.py      |  5 +++++
+ 3 files changed, 25 insertions(+), 9 deletions(-)
+ create mode 100644 flit_core/tests/samples/moduleunimportabledouble.py
+
+diff --git a/flit_core/common.py b/flit_core/common.py
+index f1f378f..86bcf4b 100644
+--- a/flit_core/common.py
++++ b/flit_core/common.py
+@@ -132,15 +132,18 @@ def get_docstring_and_version_via_ast(target):
+     for child in node.body:
+         # Only use the version from the given module if it's a simple
+         # string assignment to __version__
+-        is_version_str = (
+-                isinstance(child, ast.Assign)
+-                and len(child.targets) == 1
+-                and isinstance(child.targets[0], ast.Name)
+-                and child.targets[0].id == "__version__"
+-                and isinstance(child.value, ast.Str)
+-        )
+-        if is_version_str:
+-            version = child.value.s
++        if isinstance(child, ast.Assign):
++            for target in child.targets:
++                is_version_str = (
++                    isinstance(target, ast.Name)
++                    and target.id == "__version__"
++                    and isinstance(child.value, ast.Str)
++                )
++                if is_version_str:
++                    version = child.value.s
++                    break
++            else:
++                continue
+             break
+     else:
+         version = None
+diff --git a/flit_core/tests/samples/moduleunimportabledouble.py b/flit_core/tests/samples/moduleunimportabledouble.py
+new file mode 100644
+index 0000000..42d51f3
+--- /dev/null
++++ b/flit_core/tests/samples/moduleunimportabledouble.py
+@@ -0,0 +1,8 @@
++
++"""
++A sample unimportable module with double assignment
++"""
++
++raise ImportError()
++
++VERSION = __version__ = "0.1"
+diff --git a/flit_core/tests/test_common.py b/flit_core/tests/test_common.py
+index 02cfab7..42e230b 100644
+--- a/flit_core/tests/test_common.py
++++ b/flit_core/tests/test_common.py
+@@ -70,6 +70,11 @@ class ModuleTests(TestCase):
+                                 'version': '0.1'}
+                          )
+ 
++        info = get_info_from_module(Module('moduleunimportabledouble', samples_dir))
++        self.assertEqual(info, {'summary': 'A sample unimportable module with double assignment',
++                                'version': '0.1'}
++                         )
++
+         info = get_info_from_module(Module('module1', samples_dir / 'constructed_version'))
+         self.assertEqual(info, {'summary': 'This module has a __version__ that requires runtime interpretation',
+                                 'version': '1.2.3'}
+-- 
+2.33.1
+
diff --git a/package/python-flit-core/python-flit-core.hash b/package/python-flit-core/python-flit-core.hash
new file mode 100644
index 0000000000..e32a05365b
--- /dev/null
+++ b/package/python-flit-core/python-flit-core.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/flit_core/json
+md5  cf656ea7dac7cfa0f714e24bbadfb013  flit_core-3.5.1.tar.gz
+sha256  3083720351a6cb00e0634a1ec0e26eae7b273174c3c6c03d5b597a14203b282e  flit_core-3.5.1.tar.gz
diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
new file mode 100644
index 0000000000..95a215bd39
--- /dev/null
+++ b/package/python-flit-core/python-flit-core.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# python-flit-core
+#
+################################################################################
+
+PYTHON_FLIT_CORE_VERSION = 3.5.1
+PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
+PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/7e/1e/15198966abf00e590ec95fb8aa4ba3d274897fe7b182fce2867f672f6a91
+PYTHON_FLIT_CORE_SETUP_TYPE = flit
+PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
+HOST_PYTHON_FLIT_CORE_NEEDS_HOST_PYTHON = python3
+HOST_PYTHON_FLIT_CORE_DEPENDENCIES = host-python-flit
+HOST_PYTHON_FLIT_CORE_ENV = PYTHONPATH="$(PYTHON3_PATH):$(@D)"
+
+define HOST_PYTHON_FLIT_CORE_FLIT_GENERATE_SETUP
+	cd $(HOST_PYTHON_FLIT_CORE_BUILDDIR)/; \
+		$(HOST_PYTHON_FLIT_CORE_BASE_ENV) $(HOST_PYTHON_FLIT_CORE_ENV) \
+		$(HOST_PYTHON_FLIT_CORE_PYTHON_INTERPRETER) -c \
+		"import sys; \
+		sys.modules['requests'] = False; \
+		from flit.sdist import SdistBuilder; \
+		from flit_core.build_thyself import metadata, Module; \
+		from pathlib import Path; \
+		cwd=Path.cwd(); \
+		module=Module('flit_core', cwd); \
+		reqs_by_extra={'.none': metadata.requires}; \
+		extra_files=['pyproject.toml', 'build_dists.py']; \
+		setup=cwd.joinpath('setup.py').open('wb'); \
+		builder=SdistBuilder(module, metadata, cwd, reqs_by_extra, {}, extra_files); \
+		setup.write(builder.make_setup_py())"
+endef
+
+$(eval $(host-python-package))
diff --git a/package/python-flit/python-flit.hash b/package/python-flit/python-flit.hash
new file mode 100644
index 0000000000..e676b85090
--- /dev/null
+++ b/package/python-flit/python-flit.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/flit/json
+md5  1ff1eb6e71cac6d873808fa12328a8c5  flit-3.5.1.tar.gz
+sha256  2e3b7377714483ecc54b236330d7bf3467b9f5b909b22333b50b6b4324162510  flit-3.5.1.tar.gz
+# Locally computed sha256 checksums
+sha256  35b4f1dec512e617077fd6980dbb43ef8c2887adc5d0185edb4c04da175dd816  LICENSE
diff --git a/package/python-flit/python-flit.mk b/package/python-flit/python-flit.mk
new file mode 100644
index 0000000000..557ee7d8d9
--- /dev/null
+++ b/package/python-flit/python-flit.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-flit
+#
+################################################################################
+
+PYTHON_FLIT_VERSION = 3.5.1
+PYTHON_FLIT_SOURCE = flit-$(PYTHON_FLIT_VERSION).tar.gz
+PYTHON_FLIT_SITE = https://files.pythonhosted.org/packages/a8/bc/4bbb98f1ce0ae4e778f3486c39c487a066d69f5ffe4e762c79664dfd5df8
+PYTHON_FLIT_SETUP_TYPE = flit
+PYTHON_FLIT_LICENSE = BSD-3-Clause
+PYTHON_FLIT_LICENSE_FILES = LICENSE
+HOST_PYTHON_FLIT_NEEDS_HOST_PYTHON = python3
+HOST_PYTHON_FLIT_DEPENDENCIES = host-python-docutils host-python-tomli
+HOST_PYTHON_FLIT_ENV = PYTHONPATH="$(PYTHON3_PATH):$(@D):$(@D)/flit_core"
+
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
