Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C67BC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:56:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25A7960F41
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25A7960F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1B42404F8;
	Tue,  3 Aug 2021 22:56:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EMWIw-Okpx67; Tue,  3 Aug 2021 22:56:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BC3D40527;
	Tue,  3 Aug 2021 22:56:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 12EDF1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 440F440527
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yO0cemPe3hrQ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EF1340609
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 714F3843F5; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Jun 2021 22:21:30 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0c600074199fa49291918039fae6723be90776c4
X-Git-Newrev: 950268102defbf243c09761307987adba5df81cc
X-Patchwork-Hint: ignore
Message-Id: <20210803210948.714F3843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python3-six: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=950268102defbf243c09761307987adba5df81cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add a python3 host variant since we are adding a python3 host variant of
python-cryptography and it is dependent on this.

Signed-off-by: Donald Chan <hoiho@lab126.com>
[yann.morin.1998@free.fr: also add sync comment in python-six]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-six/python-six.mk     |  1 +
 package/python3-six/python3-six.hash |  1 +
 package/python3-six/python3-six.mk   | 17 +++++++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/package/python-six/python-six.mk b/package/python-six/python-six.mk
index e7621f5ecb..7c298d6f89 100644
--- a/package/python-six/python-six.mk
+++ b/package/python-six/python-six.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with package/python3-six/python3-six.mk
 PYTHON_SIX_VERSION = 1.15.0
 PYTHON_SIX_SOURCE = six-$(PYTHON_SIX_VERSION).tar.gz
 PYTHON_SIX_SITE = https://files.pythonhosted.org/packages/6b/34/415834bfdafca3c5f451532e8a8d9ba89a21c9743a0c59fbd0205c7f9426
diff --git a/package/python3-six/python3-six.hash b/package/python3-six/python3-six.hash
new file mode 120000
index 0000000000..ed8cb89a6b
--- /dev/null
+++ b/package/python3-six/python3-six.hash
@@ -0,0 +1 @@
+../python-six/python-six.hash
\ No newline at end of file
diff --git a/package/python3-six/python3-six.mk b/package/python3-six/python3-six.mk
new file mode 100644
index 0000000000..debd338a4b
--- /dev/null
+++ b/package/python3-six/python3-six.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python3-six
+#
+################################################################################
+
+# Please keep in sync with package/python-six/python-six.mk
+PYTHON3_SIX_VERSION = 1.15.0
+PYTHON3_SIX_SOURCE = six-$(PYTHON3_SIX_VERSION).tar.gz
+PYTHON3_SIX_SITE = https://files.pythonhosted.org/packages/6b/34/415834bfdafca3c5f451532e8a8d9ba89a21c9743a0c59fbd0205c7f9426
+PYTHON3_SIX_SETUP_TYPE = setuptools
+PYTHON3_SIX_LICENSE = MIT
+PYTHON3_SIX_LICENSE_FILES = LICENSE
+HOST_PYTHON3_SIX_DL_SUBDIR = python-six
+HOST_PYTHON3_SIX_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
