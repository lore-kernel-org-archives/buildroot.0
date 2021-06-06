Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A828FC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:58:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 701A960238
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 701A960238
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 487C4608A7;
	Tue,  3 Aug 2021 22:58:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nbJLvNubJVd3; Tue,  3 Aug 2021 22:58:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96F43608F2;
	Tue,  3 Aug 2021 22:58:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F07D1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6623404DE
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Szoe_wjE7XcZ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 473B840614
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9ECF285F62; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Jun 2021 22:42:10 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f87c377a53e31e2638d0193acab5a40b4aa49b59
X-Git-Newrev: 7cee1f6eecc5d36921fa99d69ef4bbe007549bac
X-Patchwork-Hint: ignore
Message-Id: <20210803210948.9ECF285F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python3-cryptography:
 add python3 host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=7cee1f6eecc5d36921fa99d69ef4bbe007549bac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add a python3 host variant since another downstream OSS component
(OP-TEE) uses buildroot and it will depend on a python3 host variant
of python-cryptography.

Signed-off-by: Donald Chan <hoiho@lab126.com>
[yann.morin.1998@free.fr:
  - drop target _DEPENDENCIES since this is a host-only package
  - instead, add host-openssl to dependencies
  - add CPE variables
  - also add sync comment for python-pip
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-cryptography/python-cryptography.mk |  1 +
 .../python3-cryptography/python3-cryptography.hash |  1 +
 .../python3-cryptography/python3-cryptography.mk   | 24 ++++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index bc7a9f8027..eff0fa14a5 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with package/python3-cryptography/python3-cryptography.mk
 PYTHON_CRYPTOGRAPHY_VERSION = 3.0
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
 PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/bf/ac/552fc8729d90393845cc3a2062facf4a89dcbe206fa78771d60ddaae7554
diff --git a/package/python3-cryptography/python3-cryptography.hash b/package/python3-cryptography/python3-cryptography.hash
new file mode 120000
index 0000000000..73fa25f572
--- /dev/null
+++ b/package/python3-cryptography/python3-cryptography.hash
@@ -0,0 +1 @@
+../python-cryptography/python-cryptography.hash
\ No newline at end of file
diff --git a/package/python3-cryptography/python3-cryptography.mk b/package/python3-cryptography/python3-cryptography.mk
new file mode 100644
index 0000000000..03112e41d4
--- /dev/null
+++ b/package/python3-cryptography/python3-cryptography.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# python3-cryptography
+#
+################################################################################
+
+# Please keep in sync with package/python-cryptography/python-cryptography.mk
+PYTHON3_CRYPTOGRAPHY_VERSION = 3.0
+PYTHON3_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON3_CRYPTOGRAPHY_VERSION).tar.gz
+PYTHON3_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/bf/ac/552fc8729d90393845cc3a2062facf4a89dcbe206fa78771d60ddaae7554
+PYTHON3_CRYPTOGRAPHY_SETUP_TYPE = setuptools
+PYTHON3_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
+PYTHON3_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
+PYTHON3_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
+PYTHON3_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
+HOST_PYTHON3_CRYPTOGRAPHY_DL_SUBDIR = python-cryptography
+HOST_PYTHON3_CRYPTOGRAPHY_NEEDS_HOST_PYTHON = python3
+HOST_PYTHON3_CRYPTOGRAPHY_DEPENDENCIES = \
+	host-openssl \
+	host-python3-cffi \
+	host-python3-pip \
+	host-python3-six
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
