Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA12C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:42:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A67A61244
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A67A61244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0407D60C03;
	Tue,  5 Oct 2021 19:42:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tAeh21EI2tmu; Tue,  5 Oct 2021 19:42:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EB89607A3;
	Tue,  5 Oct 2021 19:42:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBB921BF334
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AF9560C03
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWKNIlfoVPeO for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51BE260C20
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2210D91216; Tue,  5 Oct 2021 19:34:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 21:31:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e42f9bc5754fd34ecb7027ad8483f5f259a5a04c
X-Git-Newrev: b89120fb5c48a3931471259c9dbf43e599ed9280
X-Patchwork-Hint: ignore
Message-Id: <20211005193451.2210D91216@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ecdsa: bump to version
 0.17.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b89120fb5c48a3931471259c9dbf43e599ed9280
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And correct the URL in Config.in.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-ecdsa/Config.in         | 2 +-
 package/python-ecdsa/python-ecdsa.hash | 4 ++--
 package/python-ecdsa/python-ecdsa.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ecdsa/Config.in b/package/python-ecdsa/Config.in
index eb0d65801f..54a363b367 100644
--- a/package/python-ecdsa/Config.in
+++ b/package/python-ecdsa/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PYTHON_ECDSA
 	help
 	  ECDSA cryptographic signature library (pure python).
 
-	  http://github.com/warner/python-ecdsa
+	  http://github.com/tlsfuzzer/python-ecdsa
diff --git a/package/python-ecdsa/python-ecdsa.hash b/package/python-ecdsa/python-ecdsa.hash
index fcb8093826..a082d30b0f 100644
--- a/package/python-ecdsa/python-ecdsa.hash
+++ b/package/python-ecdsa/python-ecdsa.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ecdsa/json
-md5  98c0da4c046286e892fdba727f93edea  ecdsa-0.16.1.tar.gz
-sha256  cfc046a2ddd425adbd1a78b3c46f0d1325c657811c0f45ecc3a0a6236c1e50ff  ecdsa-0.16.1.tar.gz
+md5  d0dd59c43af0f640a60599551529f5d0  ecdsa-0.17.0.tar.gz
+sha256  b9f500bb439e4153d0330610f5d26baaf18d17b8ced1bc54410d189385ea68aa  ecdsa-0.17.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3eca9845773d2e5b8cc9d8c119d345f00a4806e4bd660d4a3d6cdf9c0e9d8bb2  LICENSE
diff --git a/package/python-ecdsa/python-ecdsa.mk b/package/python-ecdsa/python-ecdsa.mk
index 75c970518e..eda35616de 100644
--- a/package/python-ecdsa/python-ecdsa.mk
+++ b/package/python-ecdsa/python-ecdsa.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ECDSA_VERSION = 0.16.1
+PYTHON_ECDSA_VERSION = 0.17.0
 PYTHON_ECDSA_SOURCE = ecdsa-$(PYTHON_ECDSA_VERSION).tar.gz
-PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/1d/d4/0684a83b3c16a9d1446ace27a506cef1db9b23984ac7ed6aaf764fdd56e8
+PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/bf/3d/3d909532ad541651390bf1321e097404cbd39d1d89c2046f42a460220fb3
 PYTHON_ECDSA_SETUP_TYPE = setuptools
 PYTHON_ECDSA_LICENSE = MIT
 PYTHON_ECDSA_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
