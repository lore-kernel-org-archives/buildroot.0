Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DAECCD1A4
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 16:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F3AC80991;
	Fri, 17 Oct 2025 16:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id or6CJT9G9WTQ; Fri, 17 Oct 2025 16:33:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA312809A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA312809A4;
	Fri, 17 Oct 2025 16:33:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AA9F1EB1
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BBB2610D2
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AfGENHV0S-5M for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 16:33:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99F806108E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99F806108E
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:33:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F840873E3; Fri, 17 Oct 2025 16:33:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Oct 2025 18:28:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d0451030fb4aea04138a95edbd71049c5b9b1e9
X-Git-Newrev: 960cbf71ae35b74ba43944d32c34dcb026eac74e
X-Patchwork-Hint: ignore
Message-Id: <20251017163329.8F840873E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-patch-ng: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=960cbf71ae35b74ba43944d32c34dcb026eac74e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by python-lmdb 1.7.3+.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                            |  1 +
 package/python-patch-ng/Config.in            |  6 ++++++
 package/python-patch-ng/python-patch-ng.hash |  5 +++++
 package/python-patch-ng/python-patch-ng.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 1ae92409c4..b06288941e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1260,6 +1260,7 @@ menu "External python modules"
 	source "package/python-paramiko/Config.in"
 	source "package/python-parso/Config.in"
 	source "package/python-passlib/Config.in"
+	source "package/python-patch-ng/Config.in"
 	source "package/python-path/Config.in"
 	source "package/python-pathpy/Config.in"
 	source "package/python-pathspec/Config.in"
diff --git a/package/python-patch-ng/Config.in b/package/python-patch-ng/Config.in
new file mode 100644
index 0000000000..60c50cbb85
--- /dev/null
+++ b/package/python-patch-ng/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PATCH_NG
+	bool "python-patch-ng"
+	help
+	  Library to parse and apply unified diffs.
+
+	  https://github.com/conan-io/python-patch
diff --git a/package/python-patch-ng/python-patch-ng.hash b/package/python-patch-ng/python-patch-ng.hash
new file mode 100644
index 0000000000..f832552c30
--- /dev/null
+++ b/package/python-patch-ng/python-patch-ng.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/patch-ng/json
+md5  208be456725a65cb570ffd3e3589f6ba  patch-ng-1.19.0.tar.gz
+sha256  27484792f4ac1c15fe2f3e4cecf74bb9833d33b75c715b71d199f7e1e7d1f786  patch-ng-1.19.0.tar.gz
+# Locally computed sha256 checksums
+sha256  d807f69dbc4f24153544ac011b741015ea47231c69fe16b1e74759f299349a78  LICENSE
diff --git a/package/python-patch-ng/python-patch-ng.mk b/package/python-patch-ng/python-patch-ng.mk
new file mode 100644
index 0000000000..fe24b0bc95
--- /dev/null
+++ b/package/python-patch-ng/python-patch-ng.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-patch-ng
+#
+################################################################################
+
+PYTHON_PATCH_NG_VERSION = 1.19.0
+PYTHON_PATCH_NG_SOURCE = patch-ng-$(PYTHON_PATCH_NG_VERSION).tar.gz
+PYTHON_PATCH_NG_SITE = https://files.pythonhosted.org/packages/65/bb/ebd7c6058dcfbf634986f9a8b3fb638f3269501c73701a48b7530042da5b
+PYTHON_PATCH_NG_SETUP_TYPE = setuptools
+PYTHON_PATCH_NG_LICENSE = MIT
+PYTHON_PATCH_NG_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
