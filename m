Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE06EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 11:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEB1541B88;
	Wed, 14 Jun 2023 11:54:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEB1541B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lHqFraQV_ntM; Wed, 14 Jun 2023 11:54:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D99D941B66;
	Wed, 14 Jun 2023 11:54:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D99D941B66
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 266261BF97D
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F302041C0A
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F302041C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QJ_QUqhA4GpM for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 11:53:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D61EC4195F
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 11:53:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D61EC4195F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C218683630; Wed, 14 Jun 2023 11:53:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 12:26:03 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: bd2261081f789ea07706c9ee0046320d30434d7b
X-Git-Newrev: 310d23040aef9b0f85878310b5ed4d989c2e6777
X-Patchwork-Hint: ignore
Message-Id: <20230614115309.C218683630@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-pure-eval:
 new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=310d23040aef9b0f85878310b5ed4d989c2e6777
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c8e93f4a6b91ad42add41618b775a30dbfc79338)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                              |  1 +
 package/python-pure-eval/Config.in             |  6 ++++++
 package/python-pure-eval/python-pure-eval.hash |  5 +++++
 package/python-pure-eval/python-pure-eval.mk   | 16 ++++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 3a9c6a1440..440c8e92ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1188,6 +1188,7 @@ menu "External python modules"
 	source "package/python-psycopg2/Config.in"
 	source "package/python-ptyprocess/Config.in"
 	source "package/python-pudb/Config.in"
+	source "package/python-pure-eval/Config.in"
 	source "package/python-py/Config.in"
 	source "package/python-pyaes/Config.in"
 	source "package/python-pyalsa/Config.in"
diff --git a/package/python-pure-eval/Config.in b/package/python-pure-eval/Config.in
new file mode 100644
index 0000000000..f6ccd6056d
--- /dev/null
+++ b/package/python-pure-eval/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PURE_EVAL
+	bool "python-pure-eval"
+	help
+	  Safely evaluate AST nodes without side effects.
+
+	  http://github.com/alexmojaki/pure_eval
diff --git a/package/python-pure-eval/python-pure-eval.hash b/package/python-pure-eval/python-pure-eval.hash
new file mode 100644
index 0000000000..5bf5dcb749
--- /dev/null
+++ b/package/python-pure-eval/python-pure-eval.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pure_eval/json
+md5  212fd27ca2c58d9effddec69748d738a  pure_eval-0.2.2.tar.gz
+sha256  2b45320af6dfaa1750f543d714b6d1c520a1688dec6fd24d339063ce0aaa9ac3  pure_eval-0.2.2.tar.gz
+# Locally computed sha256 checksums
+sha256  a476a2cb0ef4c41450340a577a28b91ac4c7f669136b2ee148047fabd5fc4181  LICENSE.txt
diff --git a/package/python-pure-eval/python-pure-eval.mk b/package/python-pure-eval/python-pure-eval.mk
new file mode 100644
index 0000000000..f139ea270f
--- /dev/null
+++ b/package/python-pure-eval/python-pure-eval.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-pure-eval
+#
+################################################################################
+
+PYTHON_PURE_EVAL_VERSION = 0.2.2
+PYTHON_PURE_EVAL_SOURCE = pure_eval-$(PYTHON_PURE_EVAL_VERSION).tar.gz
+PYTHON_PURE_EVAL_SITE = https://files.pythonhosted.org/packages/97/5a/0bc937c25d3ce4e0a74335222aee05455d6afa2888032185f8ab50cdf6fd
+PYTHON_PURE_EVAL_SETUP_TYPE = setuptools
+PYTHON_PURE_EVAL_LICENSE = MIT
+PYTHON_PURE_EVAL_LICENSE_FILES = LICENSE.txt
+
+PYTHON_PURE_EVAL_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
