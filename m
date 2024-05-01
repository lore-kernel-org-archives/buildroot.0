Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7001C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 853D9820BB;
	Wed,  1 May 2024 19:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id by70twTSrnPE; Wed,  1 May 2024 19:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9937780C29
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9937780C29;
	Wed,  1 May 2024 19:28:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D99D11BF2C9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C64414031D
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zsDWi0IIF2mn for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:28:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3FD640132
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3FD640132
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:28:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE8C4863FF; Wed,  1 May 2024 19:28:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 21:27:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0215a6d6f68e03909f54f4bbb160161b8d80503d
X-Git-Newrev: 653bd0d28b39aee415d38494accc1dc64aea432c
X-Patchwork-Hint: ignore
Message-Id: <20240501192801.CE8C4863FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pycrate: bump to version
 0.7.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=653bd0d28b39aee415d38494accc1dc64aea432c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license.txt file is now part of the release tarball, so it is no
longer needed to download it separately, and re-add it to the source
tree.

The https://github.com/P1sec/pycrate/ repository has been archived, so
use the new official location, as referenced by
https://pypi.org/project/pycrate/.

Signed-off-by: Nasser Afshin <afshin.nasser@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pycrate/Config.in           |  2 +-
 package/python-pycrate/python-pycrate.hash |  4 ++--
 package/python-pycrate/python-pycrate.mk   | 10 ++--------
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/package/python-pycrate/Config.in b/package/python-pycrate/Config.in
index bbd6873938..e78df43fcd 100644
--- a/package/python-pycrate/Config.in
+++ b/package/python-pycrate/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PYTHON_PYCRATE
 	  A software suite to handle various data and protocol
 	  formats.
 
-	  https://github.com/P1sec/pycrate/
+	  https://github.com/pycrate-org/pycrate/
diff --git a/package/python-pycrate/python-pycrate.hash b/package/python-pycrate/python-pycrate.hash
index 94ec99b738..5489f9290f 100644
--- a/package/python-pycrate/python-pycrate.hash
+++ b/package/python-pycrate/python-pycrate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycrate/json
-md5  bd21fa697ecff7ad93bec4943230d281  pycrate-0.7.0.tar.gz
-sha256  c83232f522b5bbc3b3eeaca2cf38ee63cd3c25d0c15f3ba221e6dafa89b9a763  pycrate-0.7.0.tar.gz
+md5  37e1bda10f41fe947512e9d5f8289518  pycrate-0.7.2.tar.gz
+sha256  8abd3fb9f3e7a2dc62061490f01e99b2a6185e88b1c9bf30db68853b748b8f61  pycrate-0.7.2.tar.gz
 # Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  license.txt
diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
index 1645eaf52c..41ad30fcc8 100644
--- a/package/python-pycrate/python-pycrate.mk
+++ b/package/python-pycrate/python-pycrate.mk
@@ -4,17 +4,11 @@
 #
 ################################################################################
 
-PYTHON_PYCRATE_VERSION = 0.7.0
+PYTHON_PYCRATE_VERSION = 0.7.2
 PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
-PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/a6/a5/aab94e6bb8b3281cc450dde3961b417bd56abde2401955a9a4904df44c68
+PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/f4/01/09aac6ea758ca7b7b1b4832c0c39003752ef7b6c1478e6db2f34171db3fe
 PYTHON_PYCRATE_SETUP_TYPE = setuptools
-PYTHON_PYCRATE_EXTRA_DOWNLOADS = https://raw.githubusercontent.com/P1sec/pycrate/$(PYTHON_PYCRATE_VERSION)/license.txt
 PYTHON_PYCRATE_LICENSE = LGPL-2.1+
 PYTHON_PYCRATE_LICENSE_FILES = license.txt
 
-define PYTHON_PYCRATE_ADD_LICENSE_FILE
-	cp $(PYTHON_PYCRATE_DL_DIR)/license.txt $(@D)
-endef
-PYTHON_PYCRATE_POST_EXTRACT_HOOKS += PYTHON_PYCRATE_ADD_LICENSE_FILE
-
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
