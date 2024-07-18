Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23174C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 20:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4C8C6062E;
	Thu, 18 Jul 2024 20:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f0T3AWgpbFO2; Thu, 18 Jul 2024 20:54:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED49C60E8B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED49C60E8B;
	Thu, 18 Jul 2024 20:54:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D31071BF3F9
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0B1760767
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 29uSbvx8uZHa for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 20:54:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3A2260612
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3A2260612
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:54:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE97A86E02; Thu, 18 Jul 2024 20:54:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 22:48:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c90e275718f210d488a6958eec65772c120f9e68
X-Git-Newrev: 8a549a1bad51f1ef0ede2666a52e8f389babbc22
X-Patchwork-Hint: ignore
Message-Id: <20240718205421.AE97A86E02@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tomlkit: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8a549a1bad51f1ef0ede2666a52e8f389babbc22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/Config.in                          |  1 +
 package/python-tomlkit/Config.in           |  6 ++++++
 package/python-tomlkit/python-tomlkit.hash |  5 +++++
 package/python-tomlkit/python-tomlkit.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 3e69f55c04..017c6f21e6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1397,6 +1397,7 @@ menu "External python modules"
 	source "package/python-tomako/Config.in"
 	source "package/python-toml/Config.in"
 	source "package/python-tomli/Config.in"
+	source "package/python-tomlkit/Config.in"
 	source "package/python-tornado/Config.in"
 	source "package/python-tortoise-orm/Config.in"
 	source "package/python-tqdm/Config.in"
diff --git a/package/python-tomlkit/Config.in b/package/python-tomlkit/Config.in
new file mode 100644
index 0000000000..6d9afdd8d1
--- /dev/null
+++ b/package/python-tomlkit/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_TOMLKIT
+	bool "python-tomlkit"
+	help
+	  Style preserving TOML library.
+
+	  https://github.com/sdispater/tomlkit
diff --git a/package/python-tomlkit/python-tomlkit.hash b/package/python-tomlkit/python-tomlkit.hash
new file mode 100644
index 0000000000..8c6d3c2377
--- /dev/null
+++ b/package/python-tomlkit/python-tomlkit.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tomlkit/json
+md5  e182df9625d617692a9ae035266634fe  tomlkit-0.12.4.tar.gz
+sha256  7ca1cfc12232806517a8515047ba66a19369e71edf2439d0f5824f91032b6cc3  tomlkit-0.12.4.tar.gz
+# Locally computed sha256 checksums
+sha256  f2f9b460ba719da6626add264d3782f275a4ff7aab677beda08b330911e23adb  LICENSE
diff --git a/package/python-tomlkit/python-tomlkit.mk b/package/python-tomlkit/python-tomlkit.mk
new file mode 100644
index 0000000000..ad82719ee2
--- /dev/null
+++ b/package/python-tomlkit/python-tomlkit.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-tomlkit
+#
+################################################################################
+
+PYTHON_TOMLKIT_VERSION = 0.12.4
+PYTHON_TOMLKIT_SOURCE = tomlkit-$(PYTHON_TOMLKIT_VERSION).tar.gz
+PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/7d/49/4c0764898ee67618996148bdba4534a422c5e698b4dbf4001f7c6f930797
+PYTHON_TOMLKIT_SETUP_TYPE = pep517
+PYTHON_TOMLKIT_LICENSE = MIT
+PYTHON_TOMLKIT_LICENSE_FILES = LICENSE
+PYTHON_TOMLKIT_DEPENDENCIES = host-python-poetry-core
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
