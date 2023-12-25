Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0205C3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 20:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A822340534;
	Mon, 25 Dec 2023 20:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A822340534
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Hpt9baj1ADW; Mon, 25 Dec 2023 20:43:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7629240488;
	Mon, 25 Dec 2023 20:43:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7629240488
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27E571BF951
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CA3F40933
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CA3F40933
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 41MJySWl4FZl for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 20:42:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EDE740946
 for <buildroot@buildroot.org>; Mon, 25 Dec 2023 20:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EDE740946
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D20A83235; Mon, 25 Dec 2023 20:42:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Dec 2023 21:24:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 607f0ecb7e43a3d24030da3d683f0a32e2802865
X-Git-Newrev: 3d743c1027a5c633926f27d6edc801c569f7b953
X-Patchwork-Hint: ignore
Message-Id: <20231225204212.4D20A83235@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-httpcore: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d743c1027a5c633926f27d6edc801c569f7b953
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                            |  1 +
 package/python-httpcore/Config.in            |  8 ++++++++
 package/python-httpcore/python-httpcore.hash |  5 +++++
 package/python-httpcore/python-httpcore.mk   | 17 +++++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 9108ce5e25..f9867bf2ca 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1113,6 +1113,7 @@ menu "External python modules"
 	source "package/python-hkdf/Config.in"
 	source "package/python-hpack/Config.in"
 	source "package/python-html5lib/Config.in"
+	source "package/python-httpcore/Config.in"
 	source "package/python-httplib2/Config.in"
 	source "package/python-huepy/Config.in"
 	source "package/python-humanize/Config.in"
diff --git a/package/python-httpcore/Config.in b/package/python-httpcore/Config.in
new file mode 100644
index 0000000000..d8c9083da8
--- /dev/null
+++ b/package/python-httpcore/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_HTTPCORE
+	bool "python-httpcore"
+	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
+	select BR2_PACKAGE_PYTHON_H11 # runtime
+	help
+	  A minimal low-level HTTP client.
+
+	  https://www.encode.io/httpcore/
diff --git a/package/python-httpcore/python-httpcore.hash b/package/python-httpcore/python-httpcore.hash
new file mode 100644
index 0000000000..1623573b65
--- /dev/null
+++ b/package/python-httpcore/python-httpcore.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/httpcore/json
+md5  155fbd7794ce7351b607d408cb8182bf  httpcore-1.0.2.tar.gz
+sha256  9fc092e4799b26174648e54b74ed5f683132a464e95643b226e00c2ed2fa6535  httpcore-1.0.2.tar.gz
+# Locally computed sha256 checksums
+sha256  fdcb59154c74cbaba16a11242f7740bea9f23d6feb5547917d8c5f94a80392a5  LICENSE.md
diff --git a/package/python-httpcore/python-httpcore.mk b/package/python-httpcore/python-httpcore.mk
new file mode 100644
index 0000000000..f1b3b810d7
--- /dev/null
+++ b/package/python-httpcore/python-httpcore.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-httpcore
+#
+################################################################################
+
+PYTHON_HTTPCORE_VERSION = 1.0.2
+PYTHON_HTTPCORE_SOURCE = httpcore-$(PYTHON_HTTPCORE_VERSION).tar.gz
+PYTHON_HTTPCORE_SITE = https://files.pythonhosted.org/packages/18/56/78a38490b834fa0942cbe6d39bd8a7fd76316e8940319305a98d2b320366
+PYTHON_HTTPCORE_SETUP_TYPE = pep517
+PYTHON_HTTPCORE_LICENSE = BSD-3-Clause
+PYTHON_HTTPCORE_LICENSE_FILES = LICENSE.md
+PYTHON_HTTPCORE_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-fancy-pypi-readme
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
