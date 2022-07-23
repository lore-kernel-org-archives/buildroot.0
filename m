Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40272C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAA934245F;
	Sat, 23 Jul 2022 19:09:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAA934245F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V-HghJsGYIIX; Sat, 23 Jul 2022 19:09:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 543F34245B;
	Sat, 23 Jul 2022 19:09:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 543F34245B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 951DE1BF955
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E84284BA2
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E84284BA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mj0ulxua6i1h for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:09:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C7D684B1B
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C7D684B1B
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1BB788432B; Sat, 23 Jul 2022 18:56:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 21:07:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7d854bf060632e8bcd4fbe3b8ab8074dad472f6
X-Git-Newrev: 6a1603d4d4d0565d7b1a6a498d9efa13523e071a
X-Patchwork-Hint: ignore
Message-Id: <20220723185616.1BB788432B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mypy-extensions: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a1603d4d4d0565d7b1a6a498d9efa13523e071a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/python-mypy-extensions/Config.in                   |  7 +++++++
 package/python-mypy-extensions/python-mypy-extensions.hash |  5 +++++
 package/python-mypy-extensions/python-mypy-extensions.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 55e27edf83..65fc880623 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1349,6 +1349,7 @@ F:	package/python-installer/
 F:	package/python-janus/
 F:	package/python-logstash/
 F:	package/python-multidict/
+F:	package/python-mypy-extensions/
 F:	package/python-pep517/
 F:	package/python-pycares/
 F:	package/python-pydyf/
diff --git a/package/Config.in b/package/Config.in
index 75516dd453..9f9d8124a6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1110,6 +1110,7 @@ menu "External python modules"
 	source "package/python-mwclient/Config.in"
 	source "package/python-mwscrape/Config.in"
 	source "package/python-mwscrape2slob/Config.in"
+	source "package/python-mypy-extensions/Config.in"
 	source "package/python-nested-dict/Config.in"
 	source "package/python-netaddr/Config.in"
 	source "package/python-netifaces/Config.in"
diff --git a/package/python-mypy-extensions/Config.in b/package/python-mypy-extensions/Config.in
new file mode 100644
index 0000000000..cc5b78033e
--- /dev/null
+++ b/package/python-mypy-extensions/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MYPY_EXTENSIONS
+	bool "python-mypy-extensions"
+	help
+	  Experimental type system extensions for programs checked
+	  with the mypy typechecker.
+
+	  https://github.com/python/mypy_extensions
diff --git a/package/python-mypy-extensions/python-mypy-extensions.hash b/package/python-mypy-extensions/python-mypy-extensions.hash
new file mode 100644
index 0000000000..ffe850d7bd
--- /dev/null
+++ b/package/python-mypy-extensions/python-mypy-extensions.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/mypy_extensions/json
+md5  4163ff73d0db8631c0a78bb55b551c84  mypy_extensions-0.4.3.tar.gz
+sha256  2d82818f5bb3e369420cb3c4060a7970edba416647068eb4c5343488a6c604a8  mypy_extensions-0.4.3.tar.gz
+# Locally computed sha256 checksums
+sha256  a50450da1d53cd777b80ced77c58ff96abe0ccd879706bd142c3ec20e245f0b4  LICENSE
diff --git a/package/python-mypy-extensions/python-mypy-extensions.mk b/package/python-mypy-extensions/python-mypy-extensions.mk
new file mode 100644
index 0000000000..26dc329a37
--- /dev/null
+++ b/package/python-mypy-extensions/python-mypy-extensions.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-mypy-extensions
+#
+################################################################################
+
+PYTHON_MYPY_EXTENSIONS_VERSION = 0.4.3
+PYTHON_MYPY_EXTENSIONS_SOURCE = mypy_extensions-$(PYTHON_MYPY_EXTENSIONS_VERSION).tar.gz
+PYTHON_MYPY_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/63/60/0582ce2eaced55f65a4406fc97beba256de4b7a95a0034c6576458c6519f
+PYTHON_MYPY_EXTENSIONS_SETUP_TYPE = setuptools
+PYTHON_MYPY_EXTENSIONS_LICENSE = MIT
+PYTHON_MYPY_EXTENSIONS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
