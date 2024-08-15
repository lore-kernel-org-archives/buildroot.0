Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD721E6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98D618444A;
	Fri,  6 Sep 2024 20:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p7pxZP6Glk-R; Fri,  6 Sep 2024 20:00:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D121B8450A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D121B8450A;
	Fri,  6 Sep 2024 20:00:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1381E1BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73B4361101
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 26gNlltG5oky for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31AA460778
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31AA460778
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2EC8586EE3; Fri,  6 Sep 2024 19:58:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 15:26:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 65c8e4c65168b6c17af1e797252693e4190c934f
X-Git-Newrev: 6eff762f5f57b945db394e11bee829779fa413ea
X-Patchwork-Hint: ignore
Message-Id: <20240906195854.2EC8586EE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-immutabledict: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6eff762f5f57b945db394e11bee829779fa413ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                             |  1 +
 package/Config.in                                      |  1 +
 package/python-immutabledict/Config.in                 |  7 +++++++
 package/python-immutabledict/python-immutabledict.hash |  5 +++++
 package/python-immutabledict/python-immutabledict.mk   | 15 +++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e87031b598..9c119f2d6e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2220,6 +2220,7 @@ N:	Marcus Hoffmann <bubu@bubu1.eu>
 F:	package/nethogs/
 F:	package/pico-sdk/
 F:	package/picotool/
+F:	package/python-immutabledict/
 F:	package/python-jc/
 F:	package/python-ruamel-yaml-clib/
 F:	support/testing/tests/package/test_python_fastapi.py
diff --git a/package/Config.in b/package/Config.in
index f2c63ffb6e..07bd1499d8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1151,6 +1151,7 @@ menu "External python modules"
 	source "package/python-ibmiotf/Config.in"
 	source "package/python-idna/Config.in"
 	source "package/python-ifaddr/Config.in"
+	source "package/python-immutabledict/Config.in"
 	source "package/python-incremental/Config.in"
 	source "package/python-inflect/Config.in"
 	source "package/python-inflection/Config.in"
diff --git a/package/python-immutabledict/Config.in b/package/python-immutabledict/Config.in
new file mode 100644
index 0000000000..51b180bf29
--- /dev/null
+++ b/package/python-immutabledict/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_IMMUTABLEDICT
+	bool "python-immutabledict"
+	help
+	  Immutable wrapper around dictionaries (a fork of
+	  frozendict).
+
+	  https://github.com/corenting/immutabledict
diff --git a/package/python-immutabledict/python-immutabledict.hash b/package/python-immutabledict/python-immutabledict.hash
new file mode 100644
index 0000000000..8232bc6e0e
--- /dev/null
+++ b/package/python-immutabledict/python-immutabledict.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/immutabledict/json
+md5  6796be00860cc5cf45ae839b9ed2de52  immutabledict-4.2.0.tar.gz
+sha256  e003fd81aad2377a5a758bf7e1086cf3b70b63e9a5cc2f46bce8d0a2b4727c5f  immutabledict-4.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  347f918d37d4e0556a0695d34b9fb87fa9bbe808d54949851789c6c1fc91c61f  LICENSE
diff --git a/package/python-immutabledict/python-immutabledict.mk b/package/python-immutabledict/python-immutabledict.mk
new file mode 100644
index 0000000000..4d782aace6
--- /dev/null
+++ b/package/python-immutabledict/python-immutabledict.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-immutabledict
+#
+################################################################################
+
+PYTHON_IMMUTABLEDICT_VERSION = 4.2.0
+PYTHON_IMMUTABLEDICT_SOURCE = immutabledict-$(PYTHON_IMMUTABLEDICT_VERSION).tar.gz
+PYTHON_IMMUTABLEDICT_SITE = https://files.pythonhosted.org/packages/55/f4/710c84db4d77767176342913ac6b25f43aaed6d0a0bdb9168a8d2936d9c7
+PYTHON_IMMUTABLEDICT_SETUP_TYPE = pep517
+PYTHON_IMMUTABLEDICT_LICENSE = MIT
+PYTHON_IMMUTABLEDICT_LICENSE_FILES = LICENSE
+PYTHON_IMMUTABLEDICT_DEPENDENCIES = host-python-poetry-core
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
