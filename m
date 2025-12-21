Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47F2E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78A5D81871;
	Sun, 21 Dec 2025 22:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7g3BtH_LluWE; Sun, 21 Dec 2025 22:12:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB9388187F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766355164;
	bh=yonTVGeC0zGNJtDweE9qe8ShzoEYBjJluXiuAGnMcic=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QTUrPdm7RJOcw+DrzimSrK26WcVHafsbObCye8E32O45pnkBupXb+Hp/ZwGtj+nQy
	 1sqsInGjllyd12wa/8hN1xwY5Z5j/psBoqZ1R/GojQc35MX2DfimW2BszkMDH5lxRx
	 gB6NKx4aesmq1QSg1skX59yCbgTHVnUU5tsfEWEZcrEn3jx2dJbB5KjSicxGaubL6K
	 vq4LfkHZl8VQkNDORRxJJGZ1DFZ7cS3NXQ8ZRUI8FjKt/7jVZ8Kk96A+kS/rB8aGO8
	 M9CT+rry9tF7kQI/DakhEt5/tJIsRKXd1yIwqjcrC1cV+Oxdpr5hqtlwt5dnKHI+H2
	 WkR8ph7+tnU+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB9388187F;
	Sun, 21 Dec 2025 22:12:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D0DA119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AC0140779
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NsDcbKNTxQNc for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:12:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC58D4078D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC58D4078D
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB874870BB; Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 22:58:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa2bb2199d64b7c7e019b23ec13ae51994899dd9
X-Git-Newrev: 98cdff07cffe1534147bc4294ed0343492b9edc9
X-Patchwork-Hint: ignore
Message-Id: <20251221221227.AB874870BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-paramiko: bump version to
 4.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=98cdff07cffe1534147bc4294ed0343492b9edc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/paramiko/paramiko/blob/4.0.0/sites/www/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-paramiko/python-paramiko.hash | 4 ++--
 package/python-paramiko/python-paramiko.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-paramiko/python-paramiko.hash b/package/python-paramiko/python-paramiko.hash
index 918dda17e1..64e49fd90f 100644
--- a/package/python-paramiko/python-paramiko.hash
+++ b/package/python-paramiko/python-paramiko.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/paramiko/json
-md5  2ea59e8a3423fe050398071b209b9b69  paramiko-3.5.0.tar.gz
-sha256  ad11e540da4f55cedda52931f1a3f812a8238a7af7f62a60de538cd80bb28124  paramiko-3.5.0.tar.gz
+md5  86c64e731c55db62c0be2ddcb97e6be5  paramiko-4.0.0.tar.gz
+sha256  6a25f07b380cc9c9a88d2b920ad37167ac4667f8d9886ccebd8f90f654b5d69f  paramiko-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5fa25bf5f395fd26e701c2e1de4ca7d162816986dc791c22f8f4226857ad1bb2  LICENSE
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index e79860c442..6ad0fa0d1b 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARAMIKO_VERSION = 3.5.0
+PYTHON_PARAMIKO_VERSION = 4.0.0
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
-PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/1b/0f/c00296e36ff7485935b83d466c4f2cf5934b84b0ad14e81796e1d9d3609b
+PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/1f/e7/81fdcbc7f190cdb058cffc9431587eb289833bdd633e2002455ca9bb13d4
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPL-2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
