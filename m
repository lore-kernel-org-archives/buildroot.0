Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07842C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 20:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 881BF60A6A;
	Fri, 22 Jul 2022 20:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 881BF60A6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FUOZDfctycq1; Fri, 22 Jul 2022 20:52:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55E2E60A68;
	Fri, 22 Jul 2022 20:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55E2E60A68
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 26E9E1C11A9
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01ED283FE4
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01ED283FE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qD001t7ztkts for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 20:52:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 336AC83F1B
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 20:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 336AC83F1B
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D2CC984170; Fri, 22 Jul 2022 20:38:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 22:52:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c15734e3d25c7b7ee97a7a48d45457b926daf159
X-Git-Newrev: 727889c87975530d084d156689eb6b6ffbe8f4f9
X-Patchwork-Hint: ignore
Message-Id: <20220722203852.D2CC984170@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-s3transfer: bump to version
 0.6.0
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
Content-Type: multipart/mixed; boundary="===============5996626699804753703=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5996626699804753703==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=727889c87975530d084d156689eb6b6ffbe8f4f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While at it, remove the md5 hash as there is already a sha256 hash.

Note that the checksum of the license changed, but the license is
still the same (the only change in the license file is the removal of
a blank line at the end of the file).

Changelog: https://github.com/boto/s3transfer/blob/develop/CHANGELOG.rst

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-s3transfer/python-s3transfer.hash | 7 +++----
 package/python-s3transfer/python-s3transfer.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-s3transfer/python-s3transfer.hash b/package/python-s3transfer/python-s3transfer.hash
index b8f4a57ab8..16f0face72 100644
--- a/package/python-s3transfer/python-s3transfer.hash
+++ b/package/python-s3transfer/python-s3transfer.hash
@@ -1,5 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/s3transfer/json
-md5  9416d1c7d33506501a8627bb1f7baf66  s3transfer-0.5.0.tar.gz
-sha256  50ed823e1dc5868ad40c8dc92072f757aa0e653a192845c94a3b676f4a62da4c  s3transfer-0.5.0.tar.gz
+# sha256 from https://pypi.org/pypi/s3transfer/json
+sha256  2ed07d3866f523cc561bf4a00fc5535827981b117dd7876f036b0c1aca42c947  s3transfer-0.6.0.tar.gz
 # Locally computed sha256 checksums
-sha256  8c6db340475136df3c1201d458fa5755698eace76e510471ecc9d857d6083dac  LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/python-s3transfer/python-s3transfer.mk b/package/python-s3transfer/python-s3transfer.mk
index 8b8e02db57..60a72da729 100644
--- a/package/python-s3transfer/python-s3transfer.mk
+++ b/package/python-s3transfer/python-s3transfer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_S3TRANSFER_VERSION = 0.5.0
+PYTHON_S3TRANSFER_VERSION = 0.6.0
 PYTHON_S3TRANSFER_SOURCE = s3transfer-$(PYTHON_S3TRANSFER_VERSION).tar.gz
-PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/88/ef/4d1b3f52ae20a7e72151fde5c9f254cd83f8a49047351f34006e517e1655
+PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/e1/eb/e57c93d5cd5edf8c1d124c831ef916601540db70acd96fa21fe60cef1365
 PYTHON_S3TRANSFER_SETUP_TYPE = setuptools
 PYTHON_S3TRANSFER_LICENSE = Apache-2.0
 PYTHON_S3TRANSFER_LICENSE_FILES = LICENSE.txt

--===============5996626699804753703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5996626699804753703==--
