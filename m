Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE14AC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94C0D4EE95;
	Mon, 20 Feb 2023 22:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94C0D4EE95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g1cq-tZuSoeY; Mon, 20 Feb 2023 22:15:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FBF44EF92;
	Mon, 20 Feb 2023 22:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FBF44EF92
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 839791BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A55661165
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A55661165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mXhSVH52zxqR for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA6F36112C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA6F36112C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9B88828C8; Mon, 20 Feb 2023 20:52:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:28:50 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5a3fb64466b38f68ed4c49fe3eda86a5094bd411
X-Git-Newrev: 3ef0959eabce0cf3f155b8959fdd06e6018c86e7
X-Patchwork-Hint: ignore
Message-Id: <20230220205201.A9B88828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-reedsolo: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ef0959eabce0cf3f155b8959fdd06e6018c86e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                            |  1 +
 package/python-reedsolo/Config.in            |  6 ++++++
 package/python-reedsolo/python-reedsolo.hash |  5 +++++
 package/python-reedsolo/python-reedsolo.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d5a673295d..6804e1d418 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1231,6 +1231,7 @@ menu "External python modules"
 	source "package/python-qrcode/Config.in"
 	source "package/python-raven/Config.in"
 	source "package/python-redis/Config.in"
+	source "package/python-reedsolo/Config.in"
 	source "package/python-reentry/Config.in"
 	source "package/python-regex/Config.in"
 	source "package/python-remi/Config.in"
diff --git a/package/python-reedsolo/Config.in b/package/python-reedsolo/Config.in
new file mode 100644
index 0000000000..6482b1e98c
--- /dev/null
+++ b/package/python-reedsolo/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_REEDSOLO
+	bool "python-reedsolo"
+	help
+	  Pure-Python Reed Solomon encoder/decoder.
+
+	  https://github.com/tomerfiliba/reedsolomon
diff --git a/package/python-reedsolo/python-reedsolo.hash b/package/python-reedsolo/python-reedsolo.hash
new file mode 100644
index 0000000000..fdafc89f49
--- /dev/null
+++ b/package/python-reedsolo/python-reedsolo.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/reedsolo/json
+md5  b67a04027a1825c63a63b6793ec660a3  reedsolo-1.6.0.tar.gz
+sha256  4e290d3b0a7207ac7aac186790766c752b5fcdf5e0b04dfd260349579052bbac  reedsolo-1.6.0.tar.gz
+# Locally computed sha256 checksums
+sha256  0babd7b573efc3dcf5bb3c28b583150726f775d3dd8d54d6cd062834735b3d73  LICENSE
diff --git a/package/python-reedsolo/python-reedsolo.mk b/package/python-reedsolo/python-reedsolo.mk
new file mode 100644
index 0000000000..2a7fd42a05
--- /dev/null
+++ b/package/python-reedsolo/python-reedsolo.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-reedsolo
+#
+################################################################################
+
+PYTHON_REEDSOLO_VERSION = 1.6.0
+PYTHON_REEDSOLO_SOURCE = reedsolo-$(PYTHON_REEDSOLO_VERSION).tar.gz
+PYTHON_REEDSOLO_SITE = https://files.pythonhosted.org/packages/9b/10/28d1492cc82a103bc06f18cb9a9dbb3a9168ab2e4068801fa0aa0c76b231
+PYTHON_REEDSOLO_SETUP_TYPE = setuptools
+PYTHON_REEDSOLO_LICENSE = Public Domain
+PYTHON_REEDSOLO_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
