Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7882CC83F2F
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 19:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0020D60DF4;
	Thu, 31 Aug 2023 19:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0020D60DF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KsBtFyodQ0LV; Thu, 31 Aug 2023 19:19:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DB0160B2B;
	Thu, 31 Aug 2023 19:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DB0160B2B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B7FD1BF396
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 19:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6BDC41EE1
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 19:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6BDC41EE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kh0ZFdt0eHnw for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 19:19:36 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85CBB41ED1
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 19:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85CBB41ED1
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9FFEC13F85F;
 Thu, 31 Aug 2023 21:19:29 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 21:19:21 +0200
Message-ID: <20230831191921.200550-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1693509573;
 bh=THMfsd16bZ0hdgjdmNn/hzDyjd4YZ4FhTNZaxG/Xdkc=;
 h=From:To:Cc:Subject:Date:From;
 b=DihxWOx/4iIfnbUFT95o9P+JaH1ni5XuvPfwUruCF87nmQqWOMDH86UmlCEsO2wYT
 g61zDlV95KMloHApip8+1AM8Igx+/hRpPDzgeF/ou8nsh5e7xqJ6Cb5kyTMShTnjjE
 WEx8EHv/spMv9kpPrwOUq7EMZ3rjok0CiPoD64vRJd4O7qaLJ3wwwIk+PtoSI4slqO
 3Q8svx2XmDfJrpWHNjQUsv73ihJgxerDlHQmV2uqZaeNSHoaKep8nZTQuT8qZ5IMuG
 CMRqrrwDeNLxtwvh6lgc5K+fFPb/+MTWX0R+33/qCdV8MViVehLaOiJ85MGcrm6F8E
 XZ9l1BLFzue+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DihxWOx/
Subject: [Buildroot] [PATCH next 1/1] package/python-magic-wormhole: bump to
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
Cc: Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see [1].

A notable change is that the package changed its HKDF implementation
from the python-hkdf package to python-cryptography. See [2].
This commit reflect that change in the runtime dependencies. The
python-cryptography was already an indirect dependency; it is now a
direct one.

[1] https://github.com/magic-wormhole/magic-wormhole/blob/0.13.0/NEWS.md
[2] https://github.com/magic-wormhole/magic-wormhole/pull/456

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on top of branch next at commit d87d54d with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_python_magic_wormhole
    ...
    OK
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
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
