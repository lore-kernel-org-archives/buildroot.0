Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BDEC3DA64
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 20:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8912981A30;
	Thu,  1 Aug 2024 20:56:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nhtOzmOZCZv4; Thu,  1 Aug 2024 20:56:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 944CC81A65
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 944CC81A65;
	Thu,  1 Aug 2024 20:56:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 30B751BF98E
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 20:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F63081A65
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 20:56:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jo_LeLMASqfZ for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 20:56:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45CBF81DE1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45CBF81DE1
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 20:56:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2638883881; Thu,  1 Aug 2024 20:56:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Jul 2024 23:46:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e321e81cf921346ec2d4cd1a9439016c7b2d3fb5
X-Git-Newrev: 8850a30673393f1d456be0e3c1cb5e4f8cdde457
X-Patchwork-Hint: ignore
Message-Id: <20240801205639.2638883881@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pefile: new host package
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

commit: https://git.buildroot.net/buildroot/commit/?id=8850a30673393f1d456be0e3c1cb5e4f8cdde457
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pefile/python-pefile.hash |  5 +++++
 package/python-pefile/python-pefile.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/python-pefile/python-pefile.hash b/package/python-pefile/python-pefile.hash
new file mode 100644
index 0000000000..af2288487d
--- /dev/null
+++ b/package/python-pefile/python-pefile.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pefile/json
+md5  fa0eba7c91f4e696771ddbfacdca25e4  pefile-2023.2.7.tar.gz
+sha256  82e6114004b3d6911c77c3953e3838654b04511b8b66e8583db70c65998017dc  pefile-2023.2.7.tar.gz
+# Locally computed sha256 checksums
+sha256  bfd4b5e4f8a99c961fd6f94d708e38396cc146bfe8fbc5d2a86e63aa29fb4208  LICENSE
diff --git a/package/python-pefile/python-pefile.mk b/package/python-pefile/python-pefile.mk
new file mode 100644
index 0000000000..c65f1deb60
--- /dev/null
+++ b/package/python-pefile/python-pefile.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pefile
+#
+################################################################################
+
+PYTHON_PEFILE_VERSION = 2023.2.7
+PYTHON_PEFILE_SOURCE = pefile-$(PYTHON_PEFILE_VERSION).tar.gz
+PYTHON_PEFILE_SITE = https://files.pythonhosted.org/packages/78/c5/3b3c62223f72e2360737fd2a57c30e5b2adecd85e70276879609a7403334
+PYTHON_PEFILE_SETUP_TYPE = setuptools
+PYTHON_PEFILE_LICENSE = MIT
+PYTHON_PEFILE_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
