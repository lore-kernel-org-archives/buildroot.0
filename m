Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50F1C636B6
	for <buildroot@archiver.kernel.org>; Sun, 22 Feb 2026 19:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9F4783D68;
	Sun, 22 Feb 2026 19:03:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wW9OyEuwdCMO; Sun, 22 Feb 2026 19:03:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A87C83D5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771787003;
	bh=ltFYeNLv9UBJc2zkzcAhRWenht15abQRLMsw/1kk/5A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Nyv/H/bRgWFl9//Br2fxaEiQItAWUPWadrz5kN1ElD4WnaHU/dnrOGkHBw/IDeL/z
	 +e4txGY10zxqWY1RZGP/jj5mUD2hBiuczqCfrKvSrtYCuVblv5AKrekF23h4Bumdl8
	 1+hYkP0jRWjj4zE0KoD5qRVE5tmY9tNyuHhHzDVlpPFoETAM974xzYV+4sBKfr/Dqa
	 YIs+i9N5Pz7diYV05a1wByxz2v0ki3mY7DnsIyrCMo8J+bsJ9lVDsumk+CjajNJ3AR
	 v+A/4iKY30VIwDNXk2LY6HJ2jTCAjSIpYAgDXEYlYduf0GAWQBB+t65Mj5a/S68nSv
	 JrwKn2PHiRjKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A87C83D5B;
	Sun, 22 Feb 2026 19:03:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19508249
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 19:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2AE340EEA
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 19:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3zbY-R078Zs9 for <buildroot@buildroot.org>;
 Sun, 22 Feb 2026 19:03:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49EC340169
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49EC340169
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 19:03:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4220E86FCB; Sun, 22 Feb 2026 19:03:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 22 Feb 2026 19:57:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0d13085291aebd484eb8ca653a9674a3c1de00c
X-Git-Newrev: 39b2b6e4a303e8b108a599670c71d0b2ea2e055f
X-Patchwork-Hint: ignore
Message-Id: <20260222190321.4220E86FCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pybind: overwrite
 'pybind11/_version.py' with a hard-coded version
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/39b2b6e4a303e8b108a599670c71d0b2ea2e055f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes build error with python-pillow since its version bump to 12.0.0
which introduced a dependency to pybind with buildroot commit
5f446a8d6dd8715385d6e2df2714f064bf26243d:

FileNotFoundError: [Errno 2] No such file or directory:
 '/home/bernd/buildroot/output/host/lib/python3.13/site-packages/include/pybind11/detail/common.h'

Implement the solution suggested by Vincent Fazio [1]:
Generate `pybind11/_version.py` file with a hard-coded version to avoid
copying pybind11 headers in HOST_DIR.

Fixes:
  https://gitlab.com/buildroot.org/buildroot/-/jobs/13138981946 (TestPythonPybind)

[1] https://lists.busybox.net/pipermail/buildroot/2026-February/796082.html

Cc: Vincent Fazio <vfazio@xes-inc.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Tested-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pybind/python-pybind.mk            |  7 +++++++
 package/python-pybind/python-pybind_version.py.in | 12 ++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index 7282c058f6..cdafc9d4c0 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -19,9 +19,16 @@ PYTHON_PYBIND_CONF_OPTS = \
 
 PYTHON_PYBIND_INSTALL_PATH = $(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/pybind11
 
+# Overwrite 'pybind11/_version.py' with a hard-coded version to replace
+# 'pybind11/_version.py' installed by default that require
+# pybind11/detail/common.h header in HOST_DIR.
+# https://github.com/pybind/pybind11/blob/f5fbe867d2d26e4a0a9177a51f6e568868ad3dc8/pyproject.toml#L93
 define PYTHON_PYBIND_INSTALL_MODULE
 	mkdir -p $(PYTHON_PYBIND_INSTALL_PATH)
 	cp -dpf $(@D)/pybind11/*.py $(PYTHON_PYBIND_INSTALL_PATH)
+	sed -e 's#@@PYBIND_VERSION@@#$(PYTHON_PYBIND_VERSION)#' \
+		$(PYTHON_PYBIND_PKGDIR)/python-pybind_version.py.in \
+		> $(PYTHON_PYBIND_INSTALL_PATH)/_version.py
 endef
 PYTHON_PYBIND_POST_INSTALL_STAGING_HOOKS += PYTHON_PYBIND_INSTALL_MODULE
 
diff --git a/package/python-pybind/python-pybind_version.py.in b/package/python-pybind/python-pybind_version.py.in
new file mode 100644
index 0000000000..c4cc5d074d
--- /dev/null
+++ b/package/python-pybind/python-pybind_version.py.in
@@ -0,0 +1,12 @@
+from __future__ import annotations
+
+
+def _to_int(s: str) -> int | str:
+    try:
+        return int(s)
+    except ValueError:
+        return s
+
+
+__version__ = "@@PYBIND_VERSION@@"
+version_info = tuple(_to_int(s) for s in __version__.split("."))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
