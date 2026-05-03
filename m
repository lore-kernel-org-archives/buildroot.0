Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B562CCD342C
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7260461562;
	Sun,  3 May 2026 14:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MNsE-UqLawC5; Sun,  3 May 2026 14:51:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 630BD61560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819884;
	bh=wSfynz6rjlNtgea+1CBJtXQ9yBX1VtlAg/xxm9QZfUg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kMY6FHoJ8sDtIPEV1GsA4bucP5jUQkCXLeKJFtESdnc8U/T1AsQixBrzG4RwbQQd3
	 6J+e+LeN6JCXYjChsX6qtQEwBUazS9LQLAe1JrMguzCkvwv/iuvWx08EVXkbiOG7fi
	 QCVym9Nm+Bb1rjjH2TirIinDgeyStb4ebbQaAQRxKeAOhY+EQUQHbKqygG3nqsfl0A
	 gaC1bER6cw+eZ6WjqIEedcSYvSwFvNJ9iY6wWYZ442Ww1Nmegdvejcd8MN+no1JfZr
	 JRfQyuKtvADKc+WquwAB6NRVjIbf0WQcthaluLwNDfZhsgdJc3qfdEIwC7WF95d7RR
	 Vbt8uNfXPu4WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 630BD61560;
	Sun,  3 May 2026 14:51:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ED7B190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB1F784239
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KEvUONRN0anD for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2C838426D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2C838426D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A06C383FC0; Sun,  3 May 2026 14:50:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c15e473032bf3ede252fb94b28a7c9635b4f976f
X-Git-Newrev: 136af2ee2e961cdafd443fcd306c5145ed6905f8
X-Patchwork-Hint: ignore
Message-Id: <20260503145045.A06C383FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-s3transfer: bump version to
 0.17.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/136af2ee2e961cdafd443fcd306c5145ed6905f8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/boto/s3transfer/blob/0.17.0/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-s3transfer/python-s3transfer.hash | 4 ++--
 package/python-s3transfer/python-s3transfer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-s3transfer/python-s3transfer.hash b/package/python-s3transfer/python-s3transfer.hash
index 8c9c9bb873..c7e62ce5c9 100644
--- a/package/python-s3transfer/python-s3transfer.hash
+++ b/package/python-s3transfer/python-s3transfer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/s3transfer/json
-md5  8be597569deb76004da45a021f05e0ea  s3transfer-0.16.0.tar.gz
-sha256  8e990f13268025792229cd52fa10cb7163744bf56e719e0b9cb925ab79abf920  s3transfer-0.16.0.tar.gz
+md5  e85dd5bd00128d9f138db0d49ec24acd  s3transfer-0.17.0.tar.gz
+sha256  9edeb6d1c3c2f89d6050348548834ad8289610d886e5bf7b7207728bd43ce33a  s3transfer-0.17.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/python-s3transfer/python-s3transfer.mk b/package/python-s3transfer/python-s3transfer.mk
index e9dbf4aa03..f0416bab90 100644
--- a/package/python-s3transfer/python-s3transfer.mk
+++ b/package/python-s3transfer/python-s3transfer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_S3TRANSFER_VERSION = 0.16.0
+PYTHON_S3TRANSFER_VERSION = 0.17.0
 PYTHON_S3TRANSFER_SOURCE = s3transfer-$(PYTHON_S3TRANSFER_VERSION).tar.gz
-PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/05/04/74127fc843314818edfa81b5540e26dd537353b123a4edc563109d8f17dd
+PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/9b/ec/7c692cde9125b77e84b307354d4fb705f98b8ccad59a036d5957ca75bfc3
 PYTHON_S3TRANSFER_SETUP_TYPE = setuptools
 PYTHON_S3TRANSFER_LICENSE = Apache-2.0
 PYTHON_S3TRANSFER_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
