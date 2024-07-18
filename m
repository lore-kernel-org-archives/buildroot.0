Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E42C3DA63
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 20:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAE4A60E77;
	Thu, 18 Jul 2024 20:54:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id opC0G9a_BjPB; Thu, 18 Jul 2024 20:54:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71D6660EA9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71D6660EA9;
	Thu, 18 Jul 2024 20:54:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 007711BF3F9
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE6B440F45
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ij8q-VsFkYwm for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 20:54:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A86D140F41
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A86D140F41
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:54:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A183086E0C; Thu, 18 Jul 2024 20:54:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 22:47:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 500070c1050c0a718026a43f620af6c443e003e6
X-Git-Newrev: c90e275718f210d488a6958eec65772c120f9e68
X-Patchwork-Hint: ignore
Message-Id: <20240718205421.A183086E0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dictdiffer: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c90e275718f210d488a6958eec65772c120f9e68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to set --skip-dependency-check to prevent pytest-runner from
being required to build python-dictdiffer.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/Config.in                                |  1 +
 package/python-dictdiffer/Config.in              |  7 +++++++
 package/python-dictdiffer/python-dictdiffer.hash |  5 +++++
 package/python-dictdiffer/python-dictdiffer.mk   | 16 ++++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index e58b8eebc9..3e69f55c04 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1071,6 +1071,7 @@ menu "External python modules"
 	source "package/python-decouple/Config.in"
 	source "package/python-defusedxml/Config.in"
 	source "package/python-dialog3/Config.in"
+	source "package/python-dictdiffer/Config.in"
 	source "package/python-dicttoxml/Config.in"
 	source "package/python-dicttoxml2/Config.in"
 	source "package/python-distro/Config.in"
diff --git a/package/python-dictdiffer/Config.in b/package/python-dictdiffer/Config.in
new file mode 100644
index 0000000000..636b4f7c4e
--- /dev/null
+++ b/package/python-dictdiffer/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_DICTDIFFER
+	bool "python-dictdiffer"
+	help
+	  Dictdiffer is a library that helps you to diff and patch
+	  dictionaries.
+
+	  https://github.com/inveniosoftware/dictdiffer
diff --git a/package/python-dictdiffer/python-dictdiffer.hash b/package/python-dictdiffer/python-dictdiffer.hash
new file mode 100644
index 0000000000..4984595346
--- /dev/null
+++ b/package/python-dictdiffer/python-dictdiffer.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/dictdiffer/json
+md5  524b353b969300d4dc6aa6720c953657  dictdiffer-0.9.0.tar.gz
+sha256  17bacf5fbfe613ccf1b6d512bd766e6b21fb798822a133aa86098b8ac9997578  dictdiffer-0.9.0.tar.gz
+# Locally computed sha256 checksums
+sha256  1f9e05b3b9a6fad24cc67455578bcdfd3e89b09a25c45369a5254203bbe2bdd3  LICENSE
diff --git a/package/python-dictdiffer/python-dictdiffer.mk b/package/python-dictdiffer/python-dictdiffer.mk
new file mode 100644
index 0000000000..569f923a9a
--- /dev/null
+++ b/package/python-dictdiffer/python-dictdiffer.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-dictdiffer
+#
+################################################################################
+
+PYTHON_DICTDIFFER_VERSION = 0.9.0
+PYTHON_DICTDIFFER_SOURCE = dictdiffer-$(PYTHON_DICTDIFFER_VERSION).tar.gz
+PYTHON_DICTDIFFER_SITE = https://files.pythonhosted.org/packages/61/7b/35cbccb7effc5d7e40f4c55e2b79399e1853041997fcda15c9ff160abba0
+PYTHON_DICTDIFFER_SETUP_TYPE = setuptools
+PYTHON_DICTDIFFER_LICENSE = MIT
+PYTHON_DICTDIFFER_LICENSE_FILES = LICENSE
+PYTHON_DICTDIFFER_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_DICTDIFFER_BUILD_OPTS = --skip-dependency-check
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
