Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A068CC3DA64
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 20:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B355820F8;
	Thu,  1 Aug 2024 20:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kUBUX9FKz77K; Thu,  1 Aug 2024 20:56:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D79098210A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D79098210A;
	Thu,  1 Aug 2024 20:56:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 94F0B1BF408
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 20:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 633C981DE1
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 20:56:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kkgq3C1retov for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 20:56:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 929D981DE6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 929D981DE6
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 20:56:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4941F80753; Thu,  1 Aug 2024 20:56:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Jul 2024 23:46:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8270da3e4f73a99119b6919c829d84016e1cfbcf
X-Git-Newrev: ab11a0389936d7c9acccc62edbb7d1c0cb68117a
X-Patchwork-Hint: ignore
Message-Id: <20240801205639.4941F80753@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-uswid: new host package
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab11a0389936d7c9acccc62edbb7d1c0cb68117a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in.host                 |  1 +
 package/python-uswid/Config.in.host    |  8 ++++++++
 package/python-uswid/python-uswid.hash |  5 +++++
 package/python-uswid/python-uswid.mk   | 18 ++++++++++++++++++
 4 files changed, 32 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 4340e6e8c9..e4fbee4f2a 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -89,6 +89,7 @@ menu "Host utilities"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-pyyaml/Config.in.host"
 	source "package/python-six/Config.in.host"
+	source "package/python-uswid/Config.in.host"
 	source "package/python-xlrd/Config.in.host"
 	source "package/python3/Config.in.host"
 	source "package/qemu/Config.in.host"
diff --git a/package/python-uswid/Config.in.host b/package/python-uswid/Config.in.host
new file mode 100644
index 0000000000..6605d51915
--- /dev/null
+++ b/package/python-uswid/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_PYTHON_USWID
+	bool "host python-uswid"
+	select BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON3_XZ
+	help
+	  A tiny tool for embedding CoSWID tags in EFI binaries.
+
+	  https://github.com/hughsie/python-uswid
diff --git a/package/python-uswid/python-uswid.hash b/package/python-uswid/python-uswid.hash
new file mode 100644
index 0000000000..b6bf09c713
--- /dev/null
+++ b/package/python-uswid/python-uswid.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/uswid/json
+md5  e43ff6d49ddcda0c95338d3271694b91  uswid-0.5.0.tar.gz
+sha256  bdcd7ee5afac1da60ee688c357aa12f5f8d74bc28012446b10e2b4a9cf52fc6d  uswid-0.5.0.tar.gz
+# Locally computed sha256 checksums
+sha256  98bc07f3fb70d05b01ff740e8191b9f29c080159f01588991fbd872c611236f9  LICENSE
diff --git a/package/python-uswid/python-uswid.mk b/package/python-uswid/python-uswid.mk
new file mode 100644
index 0000000000..2092a06f52
--- /dev/null
+++ b/package/python-uswid/python-uswid.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python-uswid
+#
+################################################################################
+
+PYTHON_USWID_VERSION = 0.5.0
+PYTHON_USWID_SOURCE = uswid-$(PYTHON_USWID_VERSION).tar.gz
+PYTHON_USWID_SITE = https://files.pythonhosted.org/packages/dc/bf/05291df12037befeacda2083c798e98691043978e07ca4a00b4eb94aeb61
+PYTHON_USWID_SETUP_TYPE = setuptools
+PYTHON_USWID_LICENSE = BSD-2-Clause-Patent
+PYTHON_USWID_LICENSE_FILES = LICENSE
+HOST_PYTHON_USWID_DEPENDENCIES = \
+	host-python-cbor2 \
+	host-python-lxml \
+	host-python-pefile
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
