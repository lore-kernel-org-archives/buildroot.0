Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6915CD0404
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 20:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 828F560B68;
	Mon,  5 Jan 2026 20:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zv3AOeaYRUBa; Mon,  5 Jan 2026 20:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C30560AAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767646238;
	bh=s/Bdg/gf2xGhMf0UXyGlnzkJT0OyVidXHIxVCVJXYbI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y7x2q0NQE4MOiB+6xqjT0XeQmzzY5Z51obxEpvZ8ZV2USJvZk0N9ojLNH/8MyY0Zc
	 F922zr++PnwppKxceldbsWcxUfxec3r4iFAZkZcKFsUncZz/Ih/HHcr0bsF60JWmZj
	 1kJ0ns8DqvB3+TaaA/bJfkpTr3EYBvVJErTqdB7vgFNc3/+mQA7/+Tyc+XEqfSODuH
	 nwBBAaj03KlYlcBauLH+UdP7qj8kcuEVrJdgF0aD1LmzDd5l/Z7wOQXzmaDTrz6wiu
	 VJSsRlrCRAwLqAfTMBa8s98Zj5u9lO5ezGX7FPrVnMTlj8BRTtzEFhpZNw9ZNeNfnZ
	 uOPNWPIIlPM/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C30560AAD;
	Mon,  5 Jan 2026 20:50:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B1BF7976
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4BB581157
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:50:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1jwb_xkQqqP for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 20:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC45981108
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC45981108
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6044882A4; Mon,  5 Jan 2026 20:50:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Jan 2026 21:38:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e6111b48c1e8b13169ff13877ac79c50ac85d0b
X-Git-Newrev: 431e80e843c6f38b499b9f8f49a798749c1b8ed8
X-Patchwork-Hint: ignore
Message-Id: <20260105205030.D6044882A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mdit-py-plugins: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=431e80e843c6f38b499b9f8f49a798749c1b8ed8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                                          |  1 +
 package/python-mdit-py-plugins/Config.in                   |  7 +++++++
 package/python-mdit-py-plugins/python-mdit-py-plugins.hash |  5 +++++
 package/python-mdit-py-plugins/python-mdit-py-plugins.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index def3db0e50..ed79910b9d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1224,6 +1224,7 @@ menu "External python modules"
 	source "package/python-matplotlib/Config.in"
 	source "package/python-matplotlib-inline/Config.in"
 	source "package/python-mbstrdecoder/Config.in"
+	source "package/python-mdit-py-plugins/Config.in"
 	source "package/python-mdurl/Config.in"
 	source "package/python-memory-profiler/Config.in"
 	source "package/python-memray/Config.in"
diff --git a/package/python-mdit-py-plugins/Config.in b/package/python-mdit-py-plugins/Config.in
new file mode 100644
index 0000000000..5c0f9311e0
--- /dev/null
+++ b/package/python-mdit-py-plugins/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MDIT_PY_PLUGINS
+	bool "python-mdit-py-plugins"
+	select BR2_PACKAGE_PYTHON_MARKDOWN_IT_PY # runtime
+	help
+	  Collection of plugins for markdown-it-py.
+
+	  https://github.com/executablebooks/mdit-py-plugins
diff --git a/package/python-mdit-py-plugins/python-mdit-py-plugins.hash b/package/python-mdit-py-plugins/python-mdit-py-plugins.hash
new file mode 100644
index 0000000000..4537d908af
--- /dev/null
+++ b/package/python-mdit-py-plugins/python-mdit-py-plugins.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/mdit-py-plugins/json
+md5  8afddf3e020778a9d4490f43ce469d2a  mdit_py_plugins-0.5.0.tar.gz
+sha256  f4918cb50119f50446560513a8e311d574ff6aaed72606ddae6d35716fe809c6  mdit_py_plugins-0.5.0.tar.gz
+# Locally computed sha256 checksums
+sha256  4a2260d6e2cd0f5a151a1e86dbfe7d3ed552b1e2beabf9941c1ba5c49cbce484  LICENSE
diff --git a/package/python-mdit-py-plugins/python-mdit-py-plugins.mk b/package/python-mdit-py-plugins/python-mdit-py-plugins.mk
new file mode 100644
index 0000000000..dcbec98089
--- /dev/null
+++ b/package/python-mdit-py-plugins/python-mdit-py-plugins.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-mdit-py-plugins
+#
+################################################################################
+
+PYTHON_MDIT_PY_PLUGINS_VERSION = 0.5.0
+PYTHON_MDIT_PY_PLUGINS_SOURCE = mdit_py_plugins-$(PYTHON_MDIT_PY_PLUGINS_VERSION).tar.gz
+PYTHON_MDIT_PY_PLUGINS_SITE = https://files.pythonhosted.org/packages/b2/fd/a756d36c0bfba5f6e39a1cdbdbfdd448dc02692467d83816dff4592a1ebc
+PYTHON_MDIT_PY_PLUGINS_SETUP_TYPE = flit
+PYTHON_MDIT_PY_PLUGINS_LICENSE = MIT
+PYTHON_MDIT_PY_PLUGINS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
