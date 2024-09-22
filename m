Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5146CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 18:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65F5940247;
	Sun, 22 Sep 2024 18:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iKFCfZczTAZQ; Sun, 22 Sep 2024 18:17:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25E6F4025D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25E6F4025D;
	Sun, 22 Sep 2024 18:17:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7764F1BF3E1
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 18:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73D8E811AF
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 18:17:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pS0S6nZMFE3u for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 18:17:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93F3A811A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93F3A811A7
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 18:17:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79EE084333; Sun, 22 Sep 2024 18:17:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 20:14:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5370103e64384d0111a6bb722a1b1591b12e4a5f
X-Git-Newrev: d2fe9e861bb29ace50876b7ff07c6ddbfa9c647d
X-Patchwork-Hint: ignore
Message-Id: <20240922181730.79EE084333@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-argcomplete: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d2fe9e861bb29ace50876b7ff07c6ddbfa9c647d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                                  |  1 +
 package/python-argcomplete/Config.in               |  6 ++++++
 package/python-argcomplete/python-argcomplete.hash |  5 +++++
 package/python-argcomplete/python-argcomplete.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index fab4c1a657..e1ceb81dc0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -998,6 +998,7 @@ menu "External python modules"
 	source "package/python-anyio/Config.in"
 	source "package/python-apispec/Config.in"
 	source "package/python-appdirs/Config.in"
+	source "package/python-argcomplete/Config.in"
 	source "package/python-argh/Config.in"
 	source "package/python-argon2-cffi/Config.in"
 	source "package/python-argon2-cffi-bindings/Config.in"
diff --git a/package/python-argcomplete/Config.in b/package/python-argcomplete/Config.in
new file mode 100644
index 0000000000..ba9db643a7
--- /dev/null
+++ b/package/python-argcomplete/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_ARGCOMPLETE
+	bool "python-argcomplete"
+	help
+	  Bash tab completion for argparse.
+
+	  https://github.com/kislyuk/argcomplete
diff --git a/package/python-argcomplete/python-argcomplete.hash b/package/python-argcomplete/python-argcomplete.hash
new file mode 100644
index 0000000000..88bd7c9565
--- /dev/null
+++ b/package/python-argcomplete/python-argcomplete.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/argcomplete/json
+md5  5e5bb2e193a5581cb06abae2de3dd3d8  argcomplete-3.5.0.tar.gz
+sha256  4349400469dccfb7950bb60334a680c58d88699bff6159df61251878dc6bf74b  argcomplete-3.5.0.tar.gz
+# Locally computed sha256 checksums
+sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.rst
diff --git a/package/python-argcomplete/python-argcomplete.mk b/package/python-argcomplete/python-argcomplete.mk
new file mode 100644
index 0000000000..1773f98914
--- /dev/null
+++ b/package/python-argcomplete/python-argcomplete.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-argcomplete
+#
+################################################################################
+
+PYTHON_ARGCOMPLETE_VERSION = 3.5.0
+PYTHON_ARGCOMPLETE_SOURCE = argcomplete-$(PYTHON_ARGCOMPLETE_VERSION).tar.gz
+PYTHON_ARGCOMPLETE_SITE = https://files.pythonhosted.org/packages/75/33/a3d23a2e9ac78f9eaf1fce7490fee430d43ca7d42c65adabbb36a2b28ff6
+PYTHON_ARGCOMPLETE_SETUP_TYPE = setuptools
+PYTHON_ARGCOMPLETE_LICENSE = Apache-2.0
+PYTHON_ARGCOMPLETE_LICENSE_FILES = LICENSE.rst
+PYTHON_ARGCOMPLETE_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
