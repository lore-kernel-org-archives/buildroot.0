Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B675FEED628
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 175CD80EE4;
	Fri,  2 Jan 2026 17:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jOXa9tp1dmUs; Fri,  2 Jan 2026 17:16:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A82BA80E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767374202;
	bh=73LsvNb0fCVKJe7ZW+ryrW1ye0WaV3y70e1PHwuKAm0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rFXoLBBScJm8eFMZSCjHc+pChC7Y11d5KwM5mNypPDOf1aSi6sti79n8J+K3TQOfk
	 /8ZOeJmVzOEH/TEOOBJ1k7O5lVJzZo8NwWcWfm/zyIBDPrmRLx/qjt+nr1o+bOzfiy
	 0EX5+FEDoLurZndLiqU6D7gYBSTvG3Ifo3a59IsKgjoxoawoh1PP/JkOJpdis4luT/
	 JvP9XKAts0pZhfSNBqcn90tIluuCxtJXGdNohrVFq9srLsr+8NEvyrxWNF8F4t7l7R
	 Uu7S9Tf7dEB2R2n5kvMR6Fz5szYDYBsg5FpncF0zcEeLBrYQ7FkfvqPm8cW1tOM+pl
	 7HNKhyZeqA+jQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A82BA80E91;
	Fri,  2 Jan 2026 17:16:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D058219D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C265F60AB6
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:16:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27x9FaRPc87T for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:16:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6339607DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6339607DA
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:16:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C52C288022; Fri,  2 Jan 2026 17:16:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 18:11:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b672e5dc74f37744114036d87c5a1e40859b5fe8
X-Git-Newrev: 38d3739b20518caf33fd2fc3caa7f76940fde1e7
X-Patchwork-Hint: ignore
Message-Id: <20260102171640.C52C288022@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-markdown-it-py: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=38d3739b20518caf33fd2fc3caa7f76940fde1e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                               |  1 +
 package/Config.in                                        |  1 +
 package/python-markdown-it-py/Config.in                  |  7 +++++++
 package/python-markdown-it-py/python-markdown-it-py.hash |  6 ++++++
 package/python-markdown-it-py/python-markdown-it-py.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 176bb167f4..f423045314 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1120,6 +1120,7 @@ N:	Fiona Klute <fiona.klute@gmx.de>
 F:	package/*/S*
 F:	package/panel-mipi-dbi-firmware/
 F:	package/python-aiomqtt/
+F:	package/python-markdown-it-py/
 F:	package/python-mdurl/
 F:	package/python-pyasynchat/
 F:	package/python-pyasyncore/
diff --git a/package/Config.in b/package/Config.in
index 6ad14f006a..54c7333ea5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1214,6 +1214,7 @@ menu "External python modules"
 	source "package/python-magic-wormhole-transit-relay/Config.in"
 	source "package/python-mako/Config.in"
 	source "package/python-markdown/Config.in"
+	source "package/python-markdown-it-py/Config.in"
 	source "package/python-markdown2/Config.in"
 	source "package/python-markupsafe/Config.in"
 	source "package/python-marshmallow/Config.in"
diff --git a/package/python-markdown-it-py/Config.in b/package/python-markdown-it-py/Config.in
new file mode 100644
index 0000000000..b05a875bc9
--- /dev/null
+++ b/package/python-markdown-it-py/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MARKDOWN_IT_PY
+	bool "python-markdown-it-py"
+	select BR2_PACKAGE_PYTHON_MDURL # runtime
+	help
+	  Python port of markdown-it. Markdown parsing, done right!
+
+	  https://github.com/executablebooks/markdown-it-py
diff --git a/package/python-markdown-it-py/python-markdown-it-py.hash b/package/python-markdown-it-py/python-markdown-it-py.hash
new file mode 100644
index 0000000000..bc28feea7d
--- /dev/null
+++ b/package/python-markdown-it-py/python-markdown-it-py.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/markdown-it-py/json
+md5  a00d59ed2704f6590fdde0e9bad04c7c  markdown-it-py-3.0.0.tar.gz
+sha256  e3f60a94fa066dc52ec76661e37c851cb232d92f9886b15cb560aaada2df8feb  markdown-it-py-3.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  4a2260d6e2cd0f5a151a1e86dbfe7d3ed552b1e2beabf9941c1ba5c49cbce484  LICENSE
+sha256  792c48c5a849a15fdf9e37e8bcf9e6d1dd13b32b46c642a748a0a46a9919d473  LICENSE.markdown-it
diff --git a/package/python-markdown-it-py/python-markdown-it-py.mk b/package/python-markdown-it-py/python-markdown-it-py.mk
new file mode 100644
index 0000000000..aac0845185
--- /dev/null
+++ b/package/python-markdown-it-py/python-markdown-it-py.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-markdown-it-py
+#
+################################################################################
+
+PYTHON_MARKDOWN_IT_PY_VERSION = 3.0.0
+PYTHON_MARKDOWN_IT_PY_SOURCE = markdown-it-py-$(PYTHON_MARKDOWN_IT_PY_VERSION).tar.gz
+PYTHON_MARKDOWN_IT_PY_SITE = https://files.pythonhosted.org/packages/38/71/3b932df36c1a044d397a1f92d1cf91ee0a503d91e470cbd670aa66b07ed0
+PYTHON_MARKDOWN_IT_PY_SETUP_TYPE = flit
+PYTHON_MARKDOWN_IT_PY_LICENSE = MIT
+PYTHON_MARKDOWN_IT_PY_LICENSE_FILES = LICENSE LICENSE.markdown-it
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
