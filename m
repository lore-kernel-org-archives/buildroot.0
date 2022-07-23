Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA32C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60CAC41686;
	Sat, 23 Jul 2022 19:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60CAC41686
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FQ1jfTncK2UG; Sat, 23 Jul 2022 19:21:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC4C04169C;
	Sat, 23 Jul 2022 19:21:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC4C04169C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D964F1BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C144841699
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C144841699
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SqmB7Y6ZsNIy for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:21:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDA8440650
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDA8440650
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6368F84BD8; Sat, 23 Jul 2022 19:07:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 21:20:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 439404e7acb928524c409843b74cfc7726c49d38
X-Git-Newrev: 1f6ab13194867272d4ec67d8e847c2a9e60d29f4
X-Patchwork-Hint: ignore
Message-Id: <20220723190733.6368F84BD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jsonschema: bump to version
 4.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f6ab13194867272d4ec67d8e847c2a9e60d29f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-pyrsistent runtime dependency.

Drop unused host-python-vcversioner build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-jsonschema/Config.in              | 1 +
 package/python-jsonschema/python-jsonschema.hash | 8 ++++----
 package/python-jsonschema/python-jsonschema.mk   | 5 ++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-jsonschema/Config.in b/package/python-jsonschema/Config.in
index 7002653722..7b30d46fc6 100644
--- a/package/python-jsonschema/Config.in
+++ b/package/python-jsonschema/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_JSONSCHEMA
 	bool "python-jsonschema"
+	select BR2_PACKAGE_PYTHON_PYRSISTENT # runtime
 	help
 	  An implementation of JSON Schema validation for Python.
 
diff --git a/package/python-jsonschema/python-jsonschema.hash b/package/python-jsonschema/python-jsonschema.hash
index c631fe981e..a2766f78cc 100644
--- a/package/python-jsonschema/python-jsonschema.hash
+++ b/package/python-jsonschema/python-jsonschema.hash
@@ -1,6 +1,6 @@
-# md5 from https://pypi.python.org/pypi/jsonschema/json
-md5	374e848fdb69a3ce8b7e778b47c30640  jsonschema-2.5.1.tar.gz
-# Locally computed
-sha256	36673ac378feed3daa5956276a829699056523d7961027911f064b52255ead41  jsonschema-2.5.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/jsonschema/json
+md5  c3f7a29c187bf1d038c66a5d5763eab1  jsonschema-4.5.1.tar.gz
+sha256  7c6d882619340c3347a1bf7315e147e6d3dae439033ae6383d6acb908c101dfc  jsonschema-4.5.1.tar.gz
+# Locally computed sha256 checksums
 sha256  4f92a015a13c4d1a040bef018aa13430b4f1bc73b41b16bb846c346766de7439  COPYING
 sha256  837402bd25fad9b704265801ca3f92566a98157c1f9a7acd6f446299ba1c305a  json/LICENSE
diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
index 0fb2be869f..013a5c1293 100644
--- a/package/python-jsonschema/python-jsonschema.mk
+++ b/package/python-jsonschema/python-jsonschema.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-PYTHON_JSONSCHEMA_VERSION = 2.5.1
+PYTHON_JSONSCHEMA_VERSION = 4.5.1
 PYTHON_JSONSCHEMA_SOURCE = jsonschema-$(PYTHON_JSONSCHEMA_VERSION).tar.gz
-PYTHON_JSONSCHEMA_SITE = https://pypi.python.org/packages/58/0d/c816f5ea5adaf1293a1d81d32e4cdfdaf8496973aa5049786d7fdb14e7e7
+PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/9e/62/93a54db0e44c4de57868a7d638d7a8abce113c8bc43a20b10b1109b2a517
 PYTHON_JSONSCHEMA_SETUP_TYPE = setuptools
 PYTHON_JSONSCHEMA_LICENSE = MIT
 PYTHON_JSONSCHEMA_LICENSE_FILES = COPYING json/LICENSE
-PYTHON_JSONSCHEMA_DEPENDENCIES = host-python-vcversioner
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
