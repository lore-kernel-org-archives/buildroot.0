Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF39CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:38:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9743C603E5
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9743C603E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E140825DF;
	Tue, 12 Oct 2021 20:38:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QNMyaOGbwQtQ; Tue, 12 Oct 2021 20:38:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C944F81D72;
	Tue, 12 Oct 2021 20:38:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2E101BF9BD
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9177F4014E
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:37:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IGxcX97iYUvW for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 20:37:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A2CA400CE
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 20:37:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 178919553C; Tue, 12 Oct 2021 20:34:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 22:23:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36395e4762485e4588a7f8bf90d6b6f2a40ba77d
X-Git-Newrev: 55d1195a301d09a70bd1f768c571769916100393
X-Patchwork-Hint: ignore
Message-Id: <20211012203447.178919553C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-filelock: bump to version
 3.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=55d1195a301d09a70bd1f768c571769916100393
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package doesn't support python2 anymore.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-filelock/Config.in            | 1 +
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/Config.in b/package/python-filelock/Config.in
index 57ec039400..bda4582ac1 100644
--- a/package/python-filelock/Config.in
+++ b/package/python-filelock/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FILELOCK
 	bool "python-filelock"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  A platform independent file lock.
 
diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index d50d2d561c..d7cc864668 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  c1fe6d9a7433a7ca6ce4f36e273317d1  filelock-3.0.12.tar.gz
-sha256  18d82244ee114f543149c66a6e0c14e9c4f8a1044b5cdaadd0f82159d6a6ff59  filelock-3.0.12.tar.gz
+md5  f8458b5235a9e439fd512dc08947f6b2  filelock-3.3.0.tar.gz
+sha256  8c7eab13dc442dc249e95158bcc12dec724465919bdc9831fdbf0660f03d1785  filelock-3.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 35b3374d29..00c32b2caa 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 3.0.12
+PYTHON_FILELOCK_VERSION = 3.3.0
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/14/ec/6ee2168387ce0154632f856d5cc5592328e9cf93127c5c9aeca92c8c16cb
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/fd/6e/665a6cb363bee26e40954ee812e4e733fd7cafd84c06e0c7c2357641abd6
 PYTHON_FILELOCK_SETUP_TYPE = setuptools
 PYTHON_FILELOCK_LICENSE = Public Domain
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
