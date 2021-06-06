Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF104C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:44:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A916860F9C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A916860F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F82640157;
	Tue,  3 Aug 2021 21:44:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tzmeYg8KGuuT; Tue,  3 Aug 2021 21:44:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B567740470;
	Tue,  3 Aug 2021 21:44:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10C461BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D02E4608A5
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z7FFCefDnhlX for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2ED786063A
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 861F2843F5; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Jun 2021 22:42:10 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5864b40faccd6a5f5e7a5441ccc820e2b5ee72f7
X-Git-Newrev: 9e2f12ae1cf68c4b8edb736f7d68ba159f34f1dd
X-Patchwork-Hint: ignore
Message-Id: <20210803210948.861F2843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python3-pycparser: add
 python3 host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e2f12ae1cf68c4b8edb736f7d68ba159f34f1dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add a python3 host variant since we are adding a python3 host variant of
python-cryptography and it is dependent on this.

Signed-off-by: Donald Chan <hoiho@lab126.com>
[yann.morin.1998@free.fr: also add sync comment to python-pycparser]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pycparser/python-pycparser.mk     |  1 +
 package/python3-pycparser/python3-pycparser.hash |  1 +
 package/python3-pycparser/python3-pycparser.mk   | 17 +++++++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/package/python-pycparser/python-pycparser.mk b/package/python-pycparser/python-pycparser.mk
index 8af37fce98..5f44a562af 100644
--- a/package/python-pycparser/python-pycparser.mk
+++ b/package/python-pycparser/python-pycparser.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with package/python3-pycparser/python3-pycparser.mk
 PYTHON_PYCPARSER_VERSION = 2.20
 PYTHON_PYCPARSER_SOURCE = pycparser-$(PYTHON_PYCPARSER_VERSION).tar.gz
 PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/0f/86/e19659527668d70be91d0369aeaa055b4eb396b0f387a4f92293a20035bd
diff --git a/package/python3-pycparser/python3-pycparser.hash b/package/python3-pycparser/python3-pycparser.hash
new file mode 120000
index 0000000000..7a1912cad2
--- /dev/null
+++ b/package/python3-pycparser/python3-pycparser.hash
@@ -0,0 +1 @@
+../python-pycparser/python-pycparser.hash
\ No newline at end of file
diff --git a/package/python3-pycparser/python3-pycparser.mk b/package/python3-pycparser/python3-pycparser.mk
new file mode 100644
index 0000000000..68769ceb46
--- /dev/null
+++ b/package/python3-pycparser/python3-pycparser.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python3-pycparser
+#
+################################################################################
+
+# Please keep in sync with package/python-pycparser/python-pycparser.mk
+PYTHON3_PYCPARSER_VERSION = 2.20
+PYTHON3_PYCPARSER_SOURCE = pycparser-$(PYTHON3_PYCPARSER_VERSION).tar.gz
+PYTHON3_PYCPARSER_SITE = https://files.pythonhosted.org/packages/0f/86/e19659527668d70be91d0369aeaa055b4eb396b0f387a4f92293a20035bd
+PYTHON3_PYCPARSER_SETUP_TYPE = setuptools
+PYTHON3_PYCPARSER_LICENSE = BSD-3-Clause
+PYTHON3_PYCPARSER_LICENSE_FILES = LICENSE
+HOST_PYTHON3_PYCPARSER_DL_SUBDIR = python-pycparser
+HOST_PYTHON3_PYCPARSER_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
