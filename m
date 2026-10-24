Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EB8606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 15:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TorYMVaj
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC77881AC4;
	Sat, 24 Oct 2026 15:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PpDrm-0S19lW; Sat, 24 Oct 2026 15:01:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AE7D881AEF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792854088;
	b=Y9pGinzcFwuqaG8YSMYFsgJ6tjzeG+Y2Bm3x+qBuYdZ1luvJqRCTWuIygWKK0F/CpeGo
	 v5GG/q72wydAsiwymfwT/aNp0w9CvYWCFrkxfbuzWw14DHV7CkB1gafaPHSTkhUIisZBz
	 qH1iqjAUdg9cGreFZZ8Ng4n3TiWiSmuplmAsyVs9/oK4kFvuaPKlXZ5FLwSTR/oAMdhrg
	 HxmgYWnItGyL2Og0XxhoUfoB+78KjFyOBzmDasa4JMLHzEuxYJJSi6GoMquzXsjeTqGP/
	 myQjcq13Q8EnLLNmwNCtGzQfU+5CEVD9d2zvIE73ABA+cgyh+sezKh1pfafO5NBI6Vw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792854088;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=N2wyE126GNbrYkmGfozh25/TqeANIYki+RpPIfkRUro=;
	b=aN42IRL22RV8nauXmatFJR7fGr/AmJmf+jSg1IqjTE7aGqMjFLF5lFQI57gJim403cN6
	 2rcifye9rw1xEIQgP60TmGXxxZE8De7utqudJBIwBCeJHOzj8/vOGhdgH8mBAOQqvToLY
	 Xf1+emS29CMam4LIsCALOgthY//HhfGscW7MDAGTGEym/hreyIedppJKYylG6Ynk+1HO6
	 iNxDk6ui6sTlTUQTquerImqzug24WaczbzYvLf5+WE552+p6xN6MPfQ5mm5UzE7V79uKJ
	 DCtyHlKca+3/qnr4dE1R9FBKw5UlPGf7WpxVzHxocyDVeNSV2jQYBslDGoKxbMUVAVQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792854088;
	bh=N2wyE126GNbrYkmGfozh25/TqeANIYki+RpPIfkRUro=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TorYMVajiEYl922oPEwlBrefaNLrW+jlM2lY3u7zSZ9JwofovcE+jiRVM97aDRlqH
	 emtDDmVy2n1P+cUULnsykcvbkjW6BM4EjCiDaMmhOM5SPGD5Nd0D7+AwCoZbBXbl8o
	 VGWm3K6pscYd2LfW1A7vHkTMI/mVjonEhfgOvxBunMavQzdgjtZ0PzyPR5Gk91ol64
	 GW+CiBMHVJ88murSmQdLYijewh6+KcNiWiDn3BE3NO654FfAbxpVNEIMDqyi7Lgesm
	 Ew03kpJk7BexIGH2zp6qXMN6ZGiBlMNzL9ukPP3m/fIxVb7AoXvBusclE0SWvdBbEw
	 rgniJl5W9Xt5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE7D881AEF;
	Sat, 24 Oct 2026 15:01:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A103380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FFA340978
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pyho-XCIGFbp for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 311F940A2B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792854054;
 b=fmNUN60Eq1+S9InQDy5SMbJHpHaQ8GLrvYzuuR8PbQ/uq8ZOkc4JGYtirOGzSbH34CsU
 g5Q8NsnxPTi7IP/yhLMmfpnQeQihD9t1F8Qdn0RwjmSSEWyHxCtx4wIhlQB0sfSFvTBsL
 E3aXg2WF9xfQU7SC+XfBIz3S/ZQjI0T6WoVxEk03LWDFpO4rsGI6XXhewOcjtlecxoYtK
 UO5rI3poOUO+BSXmHb3bQSdNm1t5SrfKmT8ynOcZz6sfBFjTZyaM52c+Rb2B9B6LiFfrH
 1nfRcwYitdV5r7gPc134pm3KxiNNLY4hOZnNveVth49mJyaFH+QoD/q/dqFwm3VMKqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792854054;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ISHMpe7eJy4Q+gGsc2XUASUbel/C7ZnNnhRpuzjYFdg=;
 b=R1bFBjFkNdcRhPTdqeSv5kna2Qxo440b97nX7mclpRR9mqTbq41h1DIPJf5EyW5vV9HO
 AefiV3W+jeGjtfUG9h+EAXR7+znqZSo872omklY0NUs5qQxm+o/X7IWcJDWXgG5fE2Og4
 B/9T15Vi4bpILPwTd0Z4ZOz4Re8kFpdKEyTAbG9ly645kvPUXaHto5tTTfseKGsE1GWGB
 wze2LLIpFZTxE8mx8STkI5kIms9adoeFo2EyATePh7J2iKGsFyuBG15xt5j4fYO8vbzJJ
 dOv2ad4Fntas0K/meKR2L2GUtcNWyLO01XzFH5FNLg2qYbp/LNJktFeyYAq+017HJPQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 311F940A2B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3728F9C7E2; Sat, 24 Oct 2026 14:59:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 16:57:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2027954db7f5f42ed976ea2f4655e0cd224c7ee7
X-Git-Newrev: 93ad9e63ddfe7492ab51931185e2294f5a845aef
X-Patchwork-Hint: ignore
Message-Id: <20261024145929.3728F9C7E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pkg-resources: new host
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/93ad9e63ddfe7492ab51931185e2294f5a845aef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
