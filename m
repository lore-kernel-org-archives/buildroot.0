Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F9CC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:57:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7516604AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7516604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92D8383D9A;
	Tue,  3 Aug 2021 22:57:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0wA4-sEn1BRM; Tue,  3 Aug 2021 22:57:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A24F483D6F;
	Tue,  3 Aug 2021 22:57:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C4481BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EF6B4060C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aoCMcEemdim8 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3183A404DE
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7BF3285F62; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Jun 2021 22:42:00 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 950268102defbf243c09761307987adba5df81cc
X-Git-Newrev: 5864b40faccd6a5f5e7a5441ccc820e2b5ee72f7
X-Patchwork-Hint: ignore
Message-Id: <20210803210948.7BF3285F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python3-pip: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=5864b40faccd6a5f5e7a5441ccc820e2b5ee72f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add a python3 host variant since we are adding a python3 host variant of
python-cryptography and it is dependent on this.

Signed-off-by: Donald Chan <hoiho@lab126.com>
[yann.morin.1998@free.fr:
  - add CPE variables
  - also add sync comment for python-pip
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pip/python-pip.mk     |  1 +
 package/python3-pip/python3-pip.hash |  1 +
 package/python3-pip/python3-pip.mk   | 19 +++++++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index f881a3ce55..71f76e2842 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with package/python3-pip/python3-pip.mk
 PYTHON_PIP_VERSION = 20.0.2
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
 PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/8e/76/66066b7bc71817238924c7e4b448abdb17eb0c92d645769c223f9ace478f
diff --git a/package/python3-pip/python3-pip.hash b/package/python3-pip/python3-pip.hash
new file mode 120000
index 0000000000..d90fb3d005
--- /dev/null
+++ b/package/python3-pip/python3-pip.hash
@@ -0,0 +1 @@
+../python-pip/python-pip.hash
\ No newline at end of file
diff --git a/package/python3-pip/python3-pip.mk b/package/python3-pip/python3-pip.mk
new file mode 100644
index 0000000000..58e3c06c39
--- /dev/null
+++ b/package/python3-pip/python3-pip.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# python3-pip
+#
+################################################################################
+
+# Please keep in sync with package/python-pip/python-pip.mk
+PYTHON3_PIP_VERSION = 20.0.2
+PYTHON3_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
+PYTHON3_PIP_SITE = https://files.pythonhosted.org/packages/8e/76/66066b7bc71817238924c7e4b448abdb17eb0c92d645769c223f9ace478f
+PYTHON3_PIP_SETUP_TYPE = setuptools
+PYTHON3_PIP_LICENSE = MIT
+PYTHON3_PIP_LICENSE_FILES = LICENSE.txt
+PYTHON3_PIP_CPE_ID_VENDOR = pypa
+PYTHON3_PIP_CPE_ID_PRODUCT = pip
+HOST_PYTHON3_PIP_DL_SUBDIR = python-pip
+HOST_PYTHON3_PIP_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
