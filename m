Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D373606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=I0Dkr6su
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCB6D816FE;
	Fri, 30 Oct 2026 14:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qpWs7nrrCdyY; Fri, 30 Oct 2026 14:20:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A1F9781750
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370004;
	b=fGNtFthPkz2PqwJOCeS/i32kQQlaYudz5ndbxuufMxLs6WQ4ksht56yrFRYS7MtGYunN
	 aQwbbFEF0mx3TeYELAoWZHR0EsXH0xU3ZW8ZYxM2W925N3GAC5ev6VK2zO+y82C+rtFj7
	 a/yY44cQlUGMoqaYYl3mZEq8fRmt6DwF96FXUxx3vsdFYshTGWj+wB37+M64PlBfuIVsf
	 ZBmT4cH+9nyVT7WCWrdGfWB/3AnPsYpdQ21HpaOjgF1zWgyID+63gXnIo0F96jOyiOCcy
	 qxnkUk8v+4Nk5tWa/Ebv1Hj3izE775Ae8hX2YzqYs3Uxz1XSwKiQAU8Vzqn8T9BBbsQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370004;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=sIAndx5+C2GBpBAXSnwRR8RCr0Pd7MluRAn53LGluNU=;
	b=l37UadVmGy66WTAsCCjdw70ZJelytlODWuDO8dfyDefS3EQngIaR1SvXL9yl9yxx+tPe
	 Uh7qmKj5dh4wZpypenS55A5JQVFArhojKXQCf86V9cOL9ACbJUcDu0xP0FqkF5W9Lw20+
	 CBtfvQa5xZ3aG1cPNwHdTfcw8n1BHTxY6Y2X7KVUfkJVfNHbS+hDM1KZIhGlGOnGRfNrK
	 bZAJVQG1fm25KR3FZmaB4zC6QDMqJSzXBmY6EPFiXHor/pV+nTTwIqgwQDUCzK0aL+Nzk
	 0yc1VpAJ8BBaIt3lrR47mzzyskBWPLeWiaH4ZwDsQnt/lbw1GwMHTNhrS8Cs1bRNFiQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370004;
	bh=sIAndx5+C2GBpBAXSnwRR8RCr0Pd7MluRAn53LGluNU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I0Dkr6suVMYCOwVfC4prRaSpjJmPH3uumN66dWzSzJXBul8TpOGNNbStydrCXfB5S
	 mnKoEweAslR8Pyllj/xMCh/QQX62NsVprfRE6yvyGrFPJIxOZu+xXgbqWkKipwFPAQ
	 QZUKheKsoJyUOZsI7JrUf92MBAbdnI9hXOpCXx0Ok+8qC8QVU+7TsVyoj6+mqtDykJ
	 J/5iBxM7hqOGZgu81gMpdZYs/oMZ9R04zniDJ5xSF5iP4WMt2vl/8tplIhB9hNBbwC
	 Tem7j/UonJgtyZ7c7F0CFFpiN1WBC5XAi1rEPkhuzLKrtXe7xlrBDOj0bruMnK33K+
	 SMq+lpfDkygjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1F9781750;
	Fri, 30 Oct 2026 14:20:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C4D51362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B53AF4053E
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ecu3E05aCTfM for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C904E40243
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369894;
 b=LGJxzDjUTXeen34fJiu7V0Qq7Ys0z+2KEPiNH8cCqELPtuji9Hrib0WXKWyw3UIqoOdH
 8Sx7BBLiGfiJQZCqpb/tXSw5YriLI0V1JUGS9tc/BUVQ+sqNlu5Se44H40lpPnUW3kQp6
 Qmsh9mWlZdPya1y4Qoyfwum7DHuS6OtdoclQF0EExqOJPOvbnfiihoq6s9zJ5JM7JpiK8
 7aBpxyPHivfGlR9+42lbLRI0x5mHtne4hiUMJQZnSTFsuRko2zLlm069dSVPZDLb+Rkyj
 2tHIoceL5gGzR5Fb//DYyTXABLbV3sJ4dzYjtXXwjuinTfWjoZqnF2LZd+7Hr3SRgCA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369894;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=EEVYo2e8o8Tf5e/p9LiDbRd0YCoBi8BSLMUwHNLHVw4=;
 b=YpwoUO4rXoDTBgyTYm6/U1fIU7yuGN2miCYMbUMh00xUtG2nfV/3AA+v1tLs+/aFWvqY
 XnIvDkztzxg44P109i5IcN+BN/25ZrUHXzndgWigJSDcIjhOqGeNQ93SXnjjZclINB0fw
 cPTvLVnvq7tYAZwh2Gxe7EDwGBUPJSheCT9atwwSqeNB60pMyR5o8oAWFkoYoQzgh2F5u
 sKX20CzdarzPOTyOSx/EP4TM5RF75p4IZEz6LjgIb8HG4v2t4gQSMDYk6fTQN7abGS5Zd
 8hU+yvraBHjQVnA8j2xOOf3/XLrsEsgrWjobkzbWfQv6y0LcrPWhN0byY0+RvCKhK1g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C904E40243
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7A0A9D389; Fri, 30 Oct 2026 14:16:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:10 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 38f10e4b9e7b85b429199d9a49bf8f12c71c4be4
X-Git-Newrev: c58cbe478ace0e51e66f1bd68e1302f6cab06001
X-Patchwork-Hint: ignore
Message-Id: <20261030141646.E7A0A9D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/python-pkg-resources: new host package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0969970697556100790=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0969970697556100790==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c58cbe478ace0e51e66f1bd68e1302f6cab06001
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Setuptools 82 removed pkg_resources, but older U-Boot Binman versions
still use it. Package the standalone PyPA snapshot so these consumers
can keep working when setuptools is updated.

Add a small setuptools pyproject.toml to build the module from its
repository-root layout, and include the license addition proposed
upstream. Supply packaging, jaraco.text and platformdirs explicitly,
as the standalone module imports all three at runtime.

Add a host runtime test covering resource access, dependency resolution
and cache lookup.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 93ad9e63ddfe7492ab51931185e2294f5a845aef)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .../0001-LICENSE-copy-from-setuptools.patch        | 39 ++++++++++++++++++++++
 ...build-metadata-for-the-standalone-package.patch | 39 ++++++++++++++++++++++
 .../python-pkg-resources/python-pkg-resources.hash |  3 ++
 .../python-pkg-resources/python-pkg-resources.mk   | 17 ++++++++++
 .../tests/package/test_python_pkg_resources.py     | 14 ++++++++
 5 files changed, 112 insertions(+)

diff --git a/package/python-pkg-resources/0001-LICENSE-copy-from-setuptools.patch b/package/python-pkg-resources/0001-LICENSE-copy-from-setuptools.patch
new file mode 100644
index 0000000000..3ecd63fc8c
--- /dev/null
+++ b/package/python-pkg-resources/0001-LICENSE-copy-from-setuptools.patch
@@ -0,0 +1,39 @@
+From a5315eb2caffc9b4a43439df81e6a0d7f7647352 Mon Sep 17 00:00:00 2001
+From: Achill Gilgenast <achill@achill.org>
+Date: Sun, 15 Feb 2026 15:58:35 +0100
+Subject: [PATCH] LICENSE: copy from setuptools
+
+Copy the same MIT license from setuptools, just like the rest of
+pkg_resources that is compied from that repository.
+
+Upstream: https://github.com/pypa/pkg_resources/pull/20
+Signed-off-by: Achill Gilgenast <achill@achill.org>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ LICENSE | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+ create mode 100644 LICENSE
+
+diff --git a/LICENSE b/LICENSE
+new file mode 100644
+index 0000000..1bb5a44
+--- /dev/null
++++ b/LICENSE
+@@ -0,0 +1,17 @@
++Permission is hereby granted, free of charge, to any person obtaining a copy
++of this software and associated documentation files (the "Software"), to
++deal in the Software without restriction, including without limitation the
++rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
++sell copies of the Software, and to permit persons to whom the Software is
++furnished to do so, subject to the following conditions:
++
++The above copyright notice and this permission notice shall be included in
++all copies or substantial portions of the Software.
++
++THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
++IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
++AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
++LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
++IN THE SOFTWARE.
diff --git a/package/python-pkg-resources/0002-Add-build-metadata-for-the-standalone-package.patch b/package/python-pkg-resources/0002-Add-build-metadata-for-the-standalone-package.patch
new file mode 100644
index 0000000000..e9982cd1a0
--- /dev/null
+++ b/package/python-pkg-resources/0002-Add-build-metadata-for-the-standalone-package.patch
@@ -0,0 +1,39 @@
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 13 Oct 2026 16:36:30 -0600
+Subject: [PATCH] Add build metadata for the standalone package
+
+Build the extracted pkg_resources module as a standalone wheel, mapping
+the package to the repository root. Use a static version for this snapshot
+so building an archive does not need setuptools-scm or Git metadata.
+
+Upstream: Not applicable [Buildroot snapshot metadata]
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ pyproject.toml | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+ create mode 100644 pyproject.toml
+
+diff --git a/pyproject.toml b/pyproject.toml
+new file mode 100644
+--- /dev/null
++++ b/pyproject.toml
+@@ -0,0 +1,19 @@
++[build-system]
++requires = ["setuptools>=77"]
++build-backend = "setuptools.build_meta"
++
++[project]
++name = "pkg_resources"
++version = "0.0.0+git.7fa76c17"
++requires-python = ">=3.9"
++license = "MIT"
++license-files = ["LICENSE"]
++dependencies = [
++    "packaging>=24.2",
++    "jaraco.text>=3.7",
++    "platformdirs>=4.2.2",
++]
++
++[tool.setuptools]
++packages = ["pkg_resources"]
++package-dir = {pkg_resources = "."}
diff --git a/package/python-pkg-resources/python-pkg-resources.hash b/package/python-pkg-resources/python-pkg-resources.hash
new file mode 100644
index 0000000000..e80a20de6f
--- /dev/null
+++ b/package/python-pkg-resources/python-pkg-resources.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  5fc3f3fd8e23438a83d366897ce4389d2983d977b4339303359a0ffa0a33c15e  python-pkg-resources-7fa76c17eacf8a67c6932c9c2dd97861f42439cf.tar.gz
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-pkg-resources/python-pkg-resources.mk b/package/python-pkg-resources/python-pkg-resources.mk
new file mode 100644
index 0000000000..35076514f4
--- /dev/null
+++ b/package/python-pkg-resources/python-pkg-resources.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-pkg-resources
+#
+################################################################################
+
+PYTHON_PKG_RESOURCES_VERSION = 7fa76c17eacf8a67c6932c9c2dd97861f42439cf
+PYTHON_PKG_RESOURCES_SITE = $(call github,pypa,pkg_resources,$(PYTHON_PKG_RESOURCES_VERSION))
+PYTHON_PKG_RESOURCES_SETUP_TYPE = setuptools
+PYTHON_PKG_RESOURCES_LICENSE = MIT
+PYTHON_PKG_RESOURCES_LICENSE_FILES = LICENSE
+HOST_PYTHON_PKG_RESOURCES_DEPENDENCIES = \
+	host-python-jaraco-text \
+	host-python-packaging \
+	host-python-platformdirs
+
+$(eval $(host-python-package))
diff --git a/support/testing/tests/package/test_python_pkg_resources.py b/support/testing/tests/package/test_python_pkg_resources.py
new file mode 100644
index 0000000000..72acde3dcd
--- /dev/null
+++ b/support/testing/tests/package/test_python_pkg_resources.py
@@ -0,0 +1,14 @@
+import infra.basetest
+
+
+class TestHostPythonPkgResources(infra.basetest.BRHostPkgTest):
+    hostpkgs = ["host-python-pkg-resources"]
+
+    def test_run(self):
+        cmd = ["host/bin/python3", "-I", "-c",
+               "import pkg_resources; "
+               "assert '__init__.py' in pkg_resources.resource_listdir('pkg_resources', ''); "
+               "assert pkg_resources.resource_string('pkg_resources', '__init__.py'); "
+               "assert pkg_resources.require('pkg_resources'); "
+               "assert pkg_resources.get_default_cache()"]
+        infra.run_cmd_on_host(self.builddir, cmd)

--===============0969970697556100790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0969970697556100790==--
