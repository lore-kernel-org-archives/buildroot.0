Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7FDCFA474
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 21:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 594AA605AA;
	Wed, 23 Oct 2024 21:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jZmen5RT_VzB; Wed, 23 Oct 2024 21:12:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B97660837
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B97660837;
	Wed, 23 Oct 2024 21:12:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4946B972
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27E6840287
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:12:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gMR9bTL2rBv0 for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 21:12:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E298440256
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E298440256
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:12:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C99A28643C; Wed, 23 Oct 2024 21:12:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 23:01:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1459c0a6f06caf5340fd8c54d160ca4e96306669
X-Git-Newrev: acdc6eba5ed8def2ba56ecce948d15b643240eba
X-Patchwork-Hint: ignore
Message-Id: <20241023211251.C99A28643C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-psygnal: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=acdc6eba5ed8def2ba56ecce948d15b643240eba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                          |  1 +
 package/python-psygnal/Config.in           |  6 ++++++
 package/python-psygnal/python-psygnal.hash |  5 +++++
 package/python-psygnal/python-psygnal.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 6c4f9640c1..b43e11b806 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1269,6 +1269,7 @@ menu "External python modules"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
 	source "package/python-psycopg2/Config.in"
+	source "package/python-psygnal/Config.in"
 	source "package/python-ptyprocess/Config.in"
 	source "package/python-pudb/Config.in"
 	source "package/python-pure-eval/Config.in"
diff --git a/package/python-psygnal/Config.in b/package/python-psygnal/Config.in
new file mode 100644
index 0000000000..d6fbcbcd6a
--- /dev/null
+++ b/package/python-psygnal/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PSYGNAL
+	bool "python-psygnal"
+	help
+	  Python observer pattern (callback/event system).
+
+	  https://github.com/pyapp-kit/psygnal
diff --git a/package/python-psygnal/python-psygnal.hash b/package/python-psygnal/python-psygnal.hash
new file mode 100644
index 0000000000..f378861063
--- /dev/null
+++ b/package/python-psygnal/python-psygnal.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/psygnal/json
+md5  13955249103622604d4022e7d5ef94e0  psygnal-0.11.1.tar.gz
+sha256  f9b02ca246ab0adb108c4010b4a486e464f940543201074591e50370cd7b0cc0  psygnal-0.11.1.tar.gz
+# Locally computed sha256 checksums
+sha256  50169b145e35e6ae11a1e05cebdaa7052a58a8a2325dd5c394f8a68199c78415  LICENSE
diff --git a/package/python-psygnal/python-psygnal.mk b/package/python-psygnal/python-psygnal.mk
new file mode 100644
index 0000000000..57ba442e6c
--- /dev/null
+++ b/package/python-psygnal/python-psygnal.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-psygnal
+#
+################################################################################
+
+PYTHON_PSYGNAL_VERSION = 0.11.1
+PYTHON_PSYGNAL_SOURCE = psygnal-$(PYTHON_PSYGNAL_VERSION).tar.gz
+PYTHON_PSYGNAL_SITE = https://files.pythonhosted.org/packages/bc/b0/194cfbcb76dbf9c4a1c4271ccc825b38406d20fb7f95fd18320c28708800
+PYTHON_PSYGNAL_SETUP_TYPE = pep517
+PYTHON_PSYGNAL_LICENSE = BSD-3-Clause
+PYTHON_PSYGNAL_LICENSE_FILES = LICENSE
+PYTHON_PSYGNAL_DEPENDENCIES = host-python-hatchling host-python-hatch-vcs
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
