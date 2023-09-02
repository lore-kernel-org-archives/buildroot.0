Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F0BEC873D
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A8FA81288;
	Thu,  7 Sep 2023 15:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A8FA81288
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z2HqzVQx3v1x; Thu,  7 Sep 2023 15:42:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F63783EED;
	Thu,  7 Sep 2023 15:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F63783EED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 229BF1BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6F2041E48
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6F2041E48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rGoNoRYuFFbt for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E4D341DCB
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E4D341DCB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CBDD86A1F; Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 09:45:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9299ea4bff290bd2f178eb81b3a86451c3153a7e
X-Git-Newrev: 86fac42015cb10c8d2926a30882d8e3645e585c8
X-Patchwork-Hint: ignore
Message-Id: <20230907145134.7CBDD86A1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-magic-wormhole: bump to
 version 0.13.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=86fac42015cb10c8d2926a30882d8e3645e585c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see [1].

A notable change is that the package changed its HKDF implementation
from the python-hkdf package to python-cryptography. See [2].
This commit reflect that change in the runtime dependencies. The
python-cryptography was already an indirect dependency; it is now a
direct one.

[1] https://github.com/magic-wormhole/magic-wormhole/blob/0.13.0/NEWS.md
[2] https://github.com/magic-wormhole/magic-wormhole/pull/456

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-magic-wormhole/Config.in                  | 4 ++--
 package/python-magic-wormhole/python-magic-wormhole.hash | 4 ++--
 package/python-magic-wormhole/python-magic-wormhole.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-magic-wormhole/Config.in b/package/python-magic-wormhole/Config.in
index e8429d203b..c92af7a957 100644
--- a/package/python-magic-wormhole/Config.in
+++ b/package/python-magic-wormhole/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE
 	bool "python-magic-wormhole"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-autobahn -> python-cryptography
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime
 	select BR2_PACKAGE_PYTHON_AUTOMAT # runtime
 	select BR2_PACKAGE_PYTHON_CLICK # runtime
-	select BR2_PACKAGE_PYTHON_HKDF # runtime
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_HUMANIZE # runtime
 	select BR2_PACKAGE_PYTHON_PYNACL # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
diff --git a/package/python-magic-wormhole/python-magic-wormhole.hash b/package/python-magic-wormhole/python-magic-wormhole.hash
index 5e880d5427..5a3ffab732 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.hash
+++ b/package/python-magic-wormhole/python-magic-wormhole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/magic-wormhole/json
-md5  ca190d92f56fe32ec8dfd4fc5aab8337  magic-wormhole-0.12.0.tar.gz
-sha256  1b0fd8a334da978f3dd96b620fa9b9348cabedf26a87f74baac7a37052928160  magic-wormhole-0.12.0.tar.gz
+md5  baf778af8df5416e6d01bb2b95fa5cc5  magic-wormhole-0.13.0.tar.gz
+sha256  ac3bd68286270e7f149c06149a8e409e5fa34d7feb0e88844a26d29eed2d1516  magic-wormhole-0.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4a9cc2415c52cef591b6822eee68fed36d7e6d80284b09638cff61d762d99060  LICENSE
diff --git a/package/python-magic-wormhole/python-magic-wormhole.mk b/package/python-magic-wormhole/python-magic-wormhole.mk
index 91f0f826d5..3349bfd4e1 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.mk
+++ b/package/python-magic-wormhole/python-magic-wormhole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAGIC_WORMHOLE_VERSION = 0.12.0
+PYTHON_MAGIC_WORMHOLE_VERSION = 0.13.0
 PYTHON_MAGIC_WORMHOLE_SOURCE = magic-wormhole-$(PYTHON_MAGIC_WORMHOLE_VERSION).tar.gz
-PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/d4/62/5e4a86f7c4b111e016577f1b304063ebe604f430db15465ac58b13993608
+PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/cc/e1/75c31ad5db873268ba0750006b3d0e40c30b0ad39e6f58b1e28a28d6de48
 PYTHON_MAGIC_WORMHOLE_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
