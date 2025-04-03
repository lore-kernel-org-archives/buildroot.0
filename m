Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E12C3600C
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 20:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C63D441387;
	Thu,  3 Apr 2025 20:02:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tc2hbaqK3JAl; Thu,  3 Apr 2025 20:02:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF0A040E23
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF0A040E23;
	Thu,  3 Apr 2025 20:02:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C0EC1F4
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 20:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72D1B409E1
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 20:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hB66cDqxO6kB for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 20:02:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA149409D3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA149409D3
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 20:02:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9789A83B7E; Thu,  3 Apr 2025 20:02:56 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 3 Apr 2025 21:57:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8292b8fb89ba71d2b35d4596327b022741f18be4
X-Git-Newrev: 43abcd4c7dd8ad65d2f2012f3d4292362550a3ed
X-Patchwork-Hint: ignore
Message-Id: <20250403200256.9789A83B7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-smbus2: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=43abcd4c7dd8ad65d2f2012f3d4292362550a3ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add python-smbus2 as an alternative for python-smbus-cffi as the latter
has not seen updates in 8 years and was archived on Jan 4 2024.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                        |  1 +
 package/python-smbus2/Config.in          |  7 +++++++
 package/python-smbus2/python-smbus2.hash |  5 +++++
 package/python-smbus2/python-smbus2.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index eb22c81d1d..291e784f26 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1403,6 +1403,7 @@ menu "External python modules"
 	source "package/python-slob/Config.in"
 	source "package/python-smbprotocol/Config.in"
 	source "package/python-smbus-cffi/Config.in"
+	source "package/python-smbus2/Config.in"
 	source "package/python-smmap2/Config.in"
 	source "package/python-snappy/Config.in"
 	source "package/python-sniffio/Config.in"
diff --git a/package/python-smbus2/Config.in b/package/python-smbus2/Config.in
new file mode 100644
index 0000000000..fdacae6da1
--- /dev/null
+++ b/package/python-smbus2/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_SMBUS2
+	bool "python-smbus2"
+	help
+	  smbus2 is a drop-in replacement for smbus-cffi/smbus-python
+	  in pure Python.
+
+	  https://github.com/kplindegaard/smbus2
diff --git a/package/python-smbus2/python-smbus2.hash b/package/python-smbus2/python-smbus2.hash
new file mode 100644
index 0000000000..65f9eefaf6
--- /dev/null
+++ b/package/python-smbus2/python-smbus2.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/smbus2/json
+md5  5708a6cbf052f45a3ad6dd83c00902a6  smbus2-0.5.0.tar.gz
+sha256  4a5946fd82277870c2878befdb1a29bb28d15cda14ea4d8d2d54cf3d4bdcb035  smbus2-0.5.0.tar.gz
+# Locally computed sha256 checksums
+sha256  6ee9cf18c3a75dd76fb549a4b607ae34eedc31a796c48157895e2ad28d66ce79  LICENSE
diff --git a/package/python-smbus2/python-smbus2.mk b/package/python-smbus2/python-smbus2.mk
new file mode 100644
index 0000000000..c416a55005
--- /dev/null
+++ b/package/python-smbus2/python-smbus2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-smbus2
+#
+################################################################################
+
+PYTHON_SMBUS2_VERSION = 0.5.0
+PYTHON_SMBUS2_SOURCE = smbus2-$(PYTHON_SMBUS2_VERSION).tar.gz
+PYTHON_SMBUS2_SITE = https://files.pythonhosted.org/packages/10/c9/6d85aa809e107adf85303010a59b340be109c8f815cbedc5c08c73bcffef
+PYTHON_SMBUS2_SETUP_TYPE = setuptools
+PYTHON_SMBUS2_LICENSE = MIT
+PYTHON_SMBUS2_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
