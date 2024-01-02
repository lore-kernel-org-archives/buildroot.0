Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52E0C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 08:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6740340897;
	Tue,  2 Jan 2024 08:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6740340897
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2T_ExTBcUnmH; Tue,  2 Jan 2024 08:55:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 848814092A;
	Tue,  2 Jan 2024 08:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 848814092A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 862F11BF5A6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C61281279
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C61281279
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jR80reLd5-BV for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 08:55:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F60081276
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 08:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F60081276
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F2B783BD3; Tue,  2 Jan 2024 08:55:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 09:54:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de8256e3f823307a65494decca8b1cd152819af6
X-Git-Newrev: 280d06236e25a01b7985e2e7951948533306a60e
X-Patchwork-Hint: ignore
Message-Id: <20240102085518.6F2B783BD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-validators: bump to version
 0.22.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=280d06236e25a01b7985e2e7951948533306a60e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- python-decorator is not a runtime dependency since
  https://github.com/python-validators/validators/commit/b6255c49088cbe6563eb93a7224c86eee04be06a
- Replace https://github.com/kvesteri/validators by
  https://python-validators.github.io/validators
- Update hash of LICENSE file (update in year with
  https://github.com/python-validators/validators/commit/2e0d0ec703eab5c9b0d303d8d318d5389dcef9fa)

https://github.com/python-validators/validators/blob/0.22.0/CHANGES.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-validators/Config.in              | 3 +--
 package/python-validators/python-validators.hash | 6 +++---
 package/python-validators/python-validators.mk   | 4 ++--
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/python-validators/Config.in b/package/python-validators/Config.in
index 8a2ddb49fb..6eb6913ab6 100644
--- a/package/python-validators/Config.in
+++ b/package/python-validators/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_VALIDATORS
 	bool "python-validators"
-	select BR2_PACKAGE_PYTHON_DECORATOR # runtime
 	help
 	  Python Data Validation for Humans.
 
-	  https://github.com/kvesteri/validators
+	  https://python-validators.github.io/validators
diff --git a/package/python-validators/python-validators.hash b/package/python-validators/python-validators.hash
index 4f4e1c21f8..3682850cb3 100644
--- a/package/python-validators/python-validators.hash
+++ b/package/python-validators/python-validators.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/validators/json
-md5  f03b5acb91079450bae664726ae01948  validators-0.20.0.tar.gz
-sha256  24148ce4e64100a2d5e267233e23e7afeb55316b47d30faae7eb6e7292bc226a  validators-0.20.0.tar.gz
+md5  e7b36d935ebafe149629146cbfe5b0c8  validators-0.22.0.tar.gz
+sha256  77b2689b172eeeb600d9605ab86194641670cdb73b60afd577142a9397873370  validators-0.22.0.tar.gz
 # Locally computed sha256 checksums
-sha256  a7fd9d761c7ca1c6508b9baf030f6e21f5752d1caea3e49a270634aa9ef01e6f  LICENSE
+sha256  7c1bdc4712afecb46d402ec79da0ea2877811711e76dbaf1e425ee0b0e331b1f  LICENSE
diff --git a/package/python-validators/python-validators.mk b/package/python-validators/python-validators.mk
index 731aca11f6..09ccbe6ab7 100644
--- a/package/python-validators/python-validators.mk
+++ b/package/python-validators/python-validators.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_VALIDATORS_VERSION = 0.20.0
+PYTHON_VALIDATORS_VERSION = 0.22.0
 PYTHON_VALIDATORS_SOURCE = validators-$(PYTHON_VALIDATORS_VERSION).tar.gz
-PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/95/14/ed0af6865d378cfc3c504aed0d278a890cbefb2f1934bf2dbe92ecf9d6b1
+PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/9b/21/40a249498eee5a244a017582c06c0af01851179e2617928063a3d628bc8f
 PYTHON_VALIDATORS_SETUP_TYPE = setuptools
 PYTHON_VALIDATORS_LICENSE = MIT
 PYTHON_VALIDATORS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
