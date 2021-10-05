Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB268C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:39:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8507B61269
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8507B61269
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6648360D56;
	Tue,  5 Oct 2021 19:39:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jidovwOc_-hB; Tue,  5 Oct 2021 19:39:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C053F60C18;
	Tue,  5 Oct 2021 19:39:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 902261BF334
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C17A83E00
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ktrPrEcP48Nv for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AAC283E02
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3A2C191223; Tue,  5 Oct 2021 19:34:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 21:31:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54790b134283f012d2491ebd7cea21e367aadf8f
X-Git-Newrev: b95e903a2fabbcb7f788d3d93b0bb0d569b339b7
X-Patchwork-Hint: ignore
Message-Id: <20211005193451.3A2C191223@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-s3transfer: bump to version
 0.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b95e903a2fabbcb7f788d3d93b0bb0d569b339b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package doesn't support python2 anymore.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-s3transfer/Config.in              | 3 +--
 package/python-s3transfer/python-s3transfer.hash | 4 ++--
 package/python-s3transfer/python-s3transfer.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-s3transfer/Config.in b/package/python-s3transfer/Config.in
index 6587a5fe39..ad3a673938 100644
--- a/package/python-s3transfer/Config.in
+++ b/package/python-s3transfer/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_PYTHON_S3TRANSFER
 	bool "python-s3transfer"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_BOTOCORE # runtime
-	# runtime, not needed for python3:
-	select BR2_PACKAGE_PYTHON_FUTURES if BR2_PACKAGE_PYTHON
 	help
 	  An Amazon S3 Transfer Manager.
 
diff --git a/package/python-s3transfer/python-s3transfer.hash b/package/python-s3transfer/python-s3transfer.hash
index 496acc045c..b8f4a57ab8 100644
--- a/package/python-s3transfer/python-s3transfer.hash
+++ b/package/python-s3transfer/python-s3transfer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/s3transfer/json
-md5  e351d246498fca53e2ca2bf75c550d60  s3transfer-0.3.3.tar.gz
-sha256  921a37e2aefc64145e7b73d50c71bb4f26f46e4c9f414dc648c6245ff92cf7db  s3transfer-0.3.3.tar.gz
+md5  9416d1c7d33506501a8627bb1f7baf66  s3transfer-0.5.0.tar.gz
+sha256  50ed823e1dc5868ad40c8dc92072f757aa0e653a192845c94a3b676f4a62da4c  s3transfer-0.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8c6db340475136df3c1201d458fa5755698eace76e510471ecc9d857d6083dac  LICENSE.txt
diff --git a/package/python-s3transfer/python-s3transfer.mk b/package/python-s3transfer/python-s3transfer.mk
index 946be261a3..8b8e02db57 100644
--- a/package/python-s3transfer/python-s3transfer.mk
+++ b/package/python-s3transfer/python-s3transfer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_S3TRANSFER_VERSION = 0.3.3
+PYTHON_S3TRANSFER_VERSION = 0.5.0
 PYTHON_S3TRANSFER_SOURCE = s3transfer-$(PYTHON_S3TRANSFER_VERSION).tar.gz
-PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/50/de/2b688c062107942486c81a739383b1432a72717d9a85a6a1a692f003c70c
+PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/88/ef/4d1b3f52ae20a7e72151fde5c9f254cd83f8a49047351f34006e517e1655
 PYTHON_S3TRANSFER_SETUP_TYPE = setuptools
 PYTHON_S3TRANSFER_LICENSE = Apache-2.0
 PYTHON_S3TRANSFER_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
