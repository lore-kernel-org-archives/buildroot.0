Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2990C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E6C861B14;
	Sat, 23 Jul 2022 20:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E6C861B14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KoYykWCJ4gEo; Sat, 23 Jul 2022 20:19:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CFD060E14;
	Sat, 23 Jul 2022 20:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CFD060E14
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CAA1F1BF955
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4DAB4048D
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4DAB4048D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SvLipOUZSVnE for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:18:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4B4F4019C
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4B4F4019C
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1912385164; Sat, 23 Jul 2022 20:05:10 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 22:17:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32ecf0e80c68f9640d24a307cffebdbf28416eab
X-Git-Newrev: a9b54ef06ed085fa79194962510b499e17e7cc58
X-Patchwork-Hint: ignore
Message-Id: <20220723200510.1912385164@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender: bump to version 3.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9b54ef06ed085fa79194962510b499e17e7cc58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While we're at it, also switch to github helper.

License hash changes:

New:
  - vendor/github.com/gorilla/websocket/LICENSE: BSD-2-Clause
  - vendor/github.com/klauspost/cpuid/v2/LICENSE: MIT
  - vendor/golang.org/x/term/LICENSE: BSD-2-Clause

Removed:
  - vendor/golang.org/x/crypto/LICENSE
  - vendor/github.com/konsorten/go-windows-terminal-sequences/LICENSE

Updated:
  - LICENSE: Update copyright year

  - vendor/github.com/mendersoftware/mender-artifact/LICENSE:
    - Updated copyright year

  - vendor/github.com/klauspost/compress/LICENSE:
    - Added Apache 2.0 license for gzhttp/* directory

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mender/mender.hash | 15 ++++++++-------
 package/mender/mender.mk   | 10 +++++-----
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/package/mender/mender.hash b/package/mender/mender.hash
index 40d82f072f..7fee01cf1a 100644
--- a/package/mender/mender.hash
+++ b/package/mender/mender.hash
@@ -1,12 +1,12 @@
 # Locally computed:
-sha256  716ba7110dd68cdafc5caa989706ff67bbac0617c284d666aa81605850be5763  3.1.0.tar.gz
+sha256  9d8b2438e358dacde58c3692bd038ed9938392f1a526c49d919f73a2dff77eee  mender-3.3.0.tar.gz
 
 # Vendor licenses
 # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
 
 # Apache-2.0 license.
-sha256  b4acfcfa2a0ba1a8c82ec3965fbcee886cff8394ca4214e0ddac0a36beb1e05a  LICENSE
-sha256  32714818ad6f98ee0185a52e23a475d89122e3efd2b2c26c733781c28e798c99  vendor/github.com/mendersoftware/mender-artifact/LICENSE
+sha256  1033348db7606a7e61b6484f293847cf8d7a35766efebb97e304d4bd5d7f3f6b  LICENSE
+sha256  b4acfcfa2a0ba1a8c82ec3965fbcee886cff8394ca4214e0ddac0a36beb1e05a  vendor/github.com/mendersoftware/mender-artifact/LICENSE
 sha256  73ba74dfaa520b49a401b5d21459a8523a146f3b7518a833eea5efa85130bf68  vendor/github.com/mendersoftware/openssl/LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/github.com/minio/sha256-simd/LICENSE
 sha256  8f5d89b47d7a05a199b77b7e0f362dad391d451ebda4ef48ba11c50c071564c7  vendor/github.com/mendersoftware/progressbar/LICENSE
@@ -14,26 +14,27 @@ sha256  8f5d89b47d7a05a199b77b7e0f362dad391d451ebda4ef48ba11c50c071564c7  vendor
 # BSD 2 Clause license.
 sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86  vendor/github.com/pkg/errors/LICENSE
 sha256  e4646a82a976369d7ae8f6ed5c11d35dc0af18433a8ccc24c85b459ad8b95128  vendor/github.com/godbus/dbus/LICENSE
+sha256  2be1b548b0387ca8948e1bb9434e709126904d15f622cc2d0d8e7f186e4d122d  vendor/github.com/gorilla/websocket/LICENSE
 #
 # BSD 3 Clause license.
-sha256  16f848582e4b276a7392cd34496b7a33d6f65c0e190c163ff3a056a7c61219ce  vendor/github.com/klauspost/compress/LICENSE
+sha256  0d9e582ee4bff57bf1189c9e514e6da7ce277f9cd3bc2d488b22fbb39a6d87cf  vendor/github.com/klauspost/compress/LICENSE
 sha256  2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477  vendor/github.com/pmezard/go-difflib/LICENSE
-sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/crypto/LICENSE
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/sys/LICENSE
 sha256  0634b008cee55ca01f0888d2f5aba2d34e66c3f52c31a4e16a5d5d33d0c2a03e  vendor/github.com/bmatsuo/lmdb-go/LICENSE.md
 sha256  87640bc4df2ceb1559f268a3db1ba859ab780f7ba5b1b4545173d4680a3d918b  vendor/github.com/remyoudompheng/go-liblzma/LICENSE
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/term/LICENSE
 #
 # ISC license.
 sha256  1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470251  vendor/github.com/davecgh/go-spew/LICENSE
 #
 # MIT license.
 sha256  6d2de1cde19c4d2bd8bcd9aaa1d581f4cfa3db9cf71896140330eaa2f2687685  vendor/github.com/klauspost/pgzip/LICENSE
+sha256  5d966570d7a442d4e969892860a914e542c97f262c873baee8f0aa48e1f40212  vendor/github.com/klauspost/cpuid/v2/LICENSE
 sha256  51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c313973424664b2e6b  vendor/github.com/sirupsen/logrus/LICENSE
 sha256  f8e536c1c7b695810427095dc85f5f80d44ff7c10535e8a9486cf393e2599189  vendor/github.com/stretchr/testify/LICENSE
 sha256  ffa15bdce332058a03a1d923910864fb6e58bf6df66a0e3914284725b327183e  vendor/github.com/ungerik/go-sysfs/LICENSE
 sha256  da277af11b85227490377fbcac6afccc68be560c4fff36ac05ca62de55345fd7  vendor/github.com/urfave/cli/v2/LICENSE
 sha256  b2663894033a05fd80261176cd8da1d72546e25842d5c1abcc852ca23b6b61b0  vendor/github.com/stretchr/objx/LICENSE
-sha256  95b8ef9c4137a8f75ddd3101ffdc4cfd594fa875b261697b68baddc16b0e537c  vendor/github.com/konsorten/go-windows-terminal-sequences/LICENSE
 sha256  d18f6323b71b0b768bb5e9616e36da390fbd39369a81807cca352de4e4e6aa0b  vendor/gopkg.in/yaml.v3/LICENSE
 sha256  08eab1118c80885fa1fa6a6dd7303f65a379fcb3733e063d20d1bbc2c76e6fa1  vendor/github.com/mattn/go-isatty/LICENSE
 #
@@ -41,4 +42,4 @@ sha256  08eab1118c80885fa1fa6a6dd7303f65a379fcb3733e063d20d1bbc2c76e6fa1  vendor
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
 
 # sha256 of all the vendor licenses combined
-sha256  4f3541ea69b9b6e3959679576c146b42ba9a840a9dc4e593bff43e5e3a313d24  LIC_FILES_CHKSUM.sha256
+sha256  e6d8321e71be932e08b8923fe9e24e06a95c7e74a6b86e6f73696436ae0ea54f  LIC_FILES_CHKSUM.sha256
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index ddf3e43be2..000ec36354 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-MENDER_VERSION = 3.1.0
-MENDER_SITE = https://github.com/mendersoftware/mender/archive
-MENDER_SOURCE = $(MENDER_VERSION).tar.gz
+MENDER_VERSION = 3.3.0
+MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
 MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
 
 # Vendor license paths generated with:
@@ -20,20 +19,21 @@ MENDER_LICENSE_FILES = \
 	vendor/github.com/mendersoftware/progressbar/LICENSE \
 	vendor/github.com/pkg/errors/LICENSE \
 	vendor/github.com/godbus/dbus/LICENSE \
+	vendor/github.com/gorilla/websocket/LICENSE \
 	vendor/github.com/klauspost/compress/LICENSE \
 	vendor/github.com/pmezard/go-difflib/LICENSE \
-	vendor/golang.org/x/crypto/LICENSE \
 	vendor/golang.org/x/sys/LICENSE \
 	vendor/github.com/bmatsuo/lmdb-go/LICENSE.md \
 	vendor/github.com/remyoudompheng/go-liblzma/LICENSE \
+	vendor/golang.org/x/term/LICENSE \
 	vendor/github.com/davecgh/go-spew/LICENSE \
 	vendor/github.com/klauspost/pgzip/LICENSE \
+	vendor/github.com/klauspost/cpuid/v2/LICENSE \
 	vendor/github.com/sirupsen/logrus/LICENSE \
 	vendor/github.com/stretchr/testify/LICENSE \
 	vendor/github.com/ungerik/go-sysfs/LICENSE \
 	vendor/github.com/urfave/cli/v2/LICENSE \
 	vendor/github.com/stretchr/objx/LICENSE \
-	vendor/github.com/konsorten/go-windows-terminal-sequences/LICENSE \
 	vendor/gopkg.in/yaml.v3/LICENSE \
 	vendor/github.com/mattn/go-isatty/LICENSE \
 	vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
