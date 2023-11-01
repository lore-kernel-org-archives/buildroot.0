Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F2EC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 22:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CD18432A7;
	Wed,  1 Nov 2023 22:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CD18432A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id slg6Rs3f7gyB; Wed,  1 Nov 2023 22:09:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83964432A2;
	Wed,  1 Nov 2023 22:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83964432A2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B04C1BF30B
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8D3484DA1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8D3484DA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V3TDpGNg25ze for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 22:08:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0BD084DA0
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 22:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0BD084DA0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8592864DD; Wed,  1 Nov 2023 22:08:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 23:08:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d952b970a1897b5e01d32127a426cd6864e7a409
X-Git-Newrev: 8dd5390be6b210eaac1bf02af2fea84d4c87dcd1
X-Patchwork-Hint: ignore
Message-Id: <20231101220856.B8592864DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tftpy: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=8dd5390be6b210eaac1bf02af2fea84d4c87dcd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tftpy is described as a pure Python implementation of the Trivial FTP
protocol. Add support for this package.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-tftpy/Config.in         |  7 +++++++
 package/python-tftpy/python-tftpy.hash |  3 +++
 package/python-tftpy/python-tftpy.mk   | 13 +++++++++++++
 5 files changed, 25 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e7e4a59e94..26b25edd98 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -666,6 +666,7 @@ F:	board/beelink/gs1/
 F:	configs/beelink_gs1_defconfig
 
 N:	Colin Foster <colin.foster@in-advantage.com>
+F:	package/python-tftpy/
 F:	package/rauc-hawkbit-updater/
 
 N:	Corentin Guillevic <corentin.guillevic@smile.fr>
diff --git a/package/Config.in b/package/Config.in
index 3ce78a2461..7e2fccc8b1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1337,6 +1337,7 @@ menu "External python modules"
 	source "package/python-termcolor/Config.in"
 	source "package/python-terminaltables/Config.in"
 	source "package/python-texttable/Config.in"
+	source "package/python-tftpy/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tinycss2/Config.in"
 	source "package/python-tinyrpc/Config.in"
diff --git a/package/python-tftpy/Config.in b/package/python-tftpy/Config.in
new file mode 100644
index 0000000000..ef21ac58de
--- /dev/null
+++ b/package/python-tftpy/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TFTPY
+	bool "python-tftpy"
+	help
+	  tftpy is a pure Python implementation of the
+	  Trivial FTP protocol.
+
+	  https://github.com/msoulier/tftpy
diff --git a/package/python-tftpy/python-tftpy.hash b/package/python-tftpy/python-tftpy.hash
new file mode 100644
index 0000000000..1fae4fdeef
--- /dev/null
+++ b/package/python-tftpy/python-tftpy.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  2bfbf6377f6e3b6ba647f0ac614e9cbc225d1cc35b52991860ba6ea1ec58ef9d  python-tftpy-0.8.2.tar.gz
+sha256  4616f0c71e62ce2e0f6cdd3aef6d3c285f8730c9304b88a9f3ce3f14c2e6f756  LICENSE
diff --git a/package/python-tftpy/python-tftpy.mk b/package/python-tftpy/python-tftpy.mk
new file mode 100644
index 0000000000..829bd08b96
--- /dev/null
+++ b/package/python-tftpy/python-tftpy.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-tftpy
+#
+################################################################################
+
+PYTHON_TFTPY_VERSION = 0.8.2
+PYTHON_TFTPY_SITE = $(call github,msoulier,tftpy,$(PYTHON_TFTPY_VERSION))
+PYTHON_TFTPY_LICENSE = MIT
+PYTHON_TFTPY_LICENSE_FILES = LICENSE.txt
+PYTHON_TFTPY_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
