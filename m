Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5416C7EE24
	for <buildroot@archiver.kernel.org>; Fri,  2 Jun 2023 19:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 471E642855;
	Fri,  2 Jun 2023 19:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 471E642855
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SCgeZe63O3AN; Fri,  2 Jun 2023 19:47:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF53C42708;
	Fri,  2 Jun 2023 19:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF53C42708
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E2371BF255
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 19:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64FBB84593
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 19:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64FBB84593
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DYC4JpZbv2I9 for <buildroot@lists.busybox.net>;
 Fri,  2 Jun 2023 19:46:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8115C84590
 for <buildroot@buildroot.org>; Fri,  2 Jun 2023 19:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8115C84590
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F63B86BBA; Fri,  2 Jun 2023 19:46:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 2 Jun 2023 21:40:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91b7bd01eca709c0bd7fa94c147f82082f054c94
X-Git-Newrev: c8e93f4a6b91ad42add41618b775a30dbfc79338
X-Patchwork-Hint: ignore
Message-Id: <20230602194659.6F63B86BBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pure-eval: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8e93f4a6b91ad42add41618b775a30dbfc79338
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                              |  1 +
 package/python-pure-eval/Config.in             |  6 ++++++
 package/python-pure-eval/python-pure-eval.hash |  5 +++++
 package/python-pure-eval/python-pure-eval.mk   | 16 ++++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 82aa348455..3da005b5e5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1190,6 +1190,7 @@ menu "External python modules"
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
