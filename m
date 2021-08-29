Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B88C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 17:12:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C746604AC
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 17:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C746604AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4777A80E9A;
	Sun, 29 Aug 2021 17:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YRMq48fzFwYu; Sun, 29 Aug 2021 17:12:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 636A180E9D;
	Sun, 29 Aug 2021 17:12:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 877B11BF962
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 17:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 849B3403F8
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 17:12:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xudz67jdM4_v for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 17:12:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78BFD403F6
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 17:12:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 517A787580; Sun, 29 Aug 2021 17:11:07 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 29 Aug 2021 19:07:19 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 51a282bcb8dfc26d3a27723383c5a1767653a19d
X-Git-Newrev: 8dcd6ae36170282156e0522f9a1e9533d8c4c43d
X-Patchwork-Hint: ignore
Message-Id: <20210829171107.517A787580@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-aioprocessing:
 new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=8dcd6ae36170282156e0522f9a1e9533d8c4c43d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Arnout: add to DEVELOPERS]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                             |  1 +
 package/Config.in                                      |  1 +
 package/python-aioprocessing/Config.in                 |  8 ++++++++
 package/python-aioprocessing/python-aioprocessing.hash |  5 +++++
 package/python-aioprocessing/python-aioprocessing.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1bc4a1370c..5cedb8d6ea 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1231,6 +1231,7 @@ F:	package/python-aiohttp-sse/
 F:	package/python-aiologstash/
 F:	package/python-aiomonitor/
 F:	package/python-aiojobs/
+F:	package/python-aioprocessing/
 F:	package/python-aiorwlock/
 F:	package/python-aiosignal/
 F:	package/python-aiozipkin/
diff --git a/package/Config.in b/package/Config.in
index 1fc8381048..899b493180 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -898,6 +898,7 @@ menu "External python modules"
 	source "package/python-aiojobs/Config.in"
 	source "package/python-aiologstash/Config.in"
 	source "package/python-aiomonitor/Config.in"
+	source "package/python-aioprocessing/Config.in"
 	source "package/python-aioredis/Config.in"
 	source "package/python-aiorwlock/Config.in"
 	source "package/python-aiosignal/Config.in"
diff --git a/package/python-aioprocessing/Config.in b/package/python-aioprocessing/Config.in
new file mode 100644
index 0000000000..2e76bc562b
--- /dev/null
+++ b/package/python-aioprocessing/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_AIOPROCESSING
+	bool "python-aioprocessing"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  A Python 3.5+ library that integrates the multiprocessing
+	  module with asyncio.
+
+	  https://github.com/dano/aioprocessing
diff --git a/package/python-aioprocessing/python-aioprocessing.hash b/package/python-aioprocessing/python-aioprocessing.hash
new file mode 100644
index 0000000000..cf92a72d4a
--- /dev/null
+++ b/package/python-aioprocessing/python-aioprocessing.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aioprocessing/json
+md5  838b6aa073f1373bd42204f86b0e3196  aioprocessing-2.0.0.tar.gz
+sha256  469dfb746e8c4e0c727ba135cfabf9e034c554f6a73c27f908bfe3625dd74b9e  aioprocessing-2.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  53c809e8f0b91a68a39477e5fbdf77fe2b74dd6a1647c2dd9b7b22fed135239e  LICENSE.txt
diff --git a/package/python-aioprocessing/python-aioprocessing.mk b/package/python-aioprocessing/python-aioprocessing.mk
new file mode 100644
index 0000000000..e1e919de2d
--- /dev/null
+++ b/package/python-aioprocessing/python-aioprocessing.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aioprocessing
+#
+################################################################################
+
+PYTHON_AIOPROCESSING_VERSION = 2.0.0
+PYTHON_AIOPROCESSING_SOURCE = aioprocessing-$(PYTHON_AIOPROCESSING_VERSION).tar.gz
+PYTHON_AIOPROCESSING_SITE = https://files.pythonhosted.org/packages/8e/3e/54266241660fb026bfd27f660d44cd81a4b7f8a145d8e2db010de12622a0
+PYTHON_AIOPROCESSING_SETUP_TYPE = setuptools
+PYTHON_AIOPROCESSING_LICENSE = BSD-2-Clause
+PYTHON_AIOPROCESSING_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
