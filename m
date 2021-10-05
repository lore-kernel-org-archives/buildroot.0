Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67DACC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:38:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AD50611C5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2AD50611C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0D7860BF1;
	Tue,  5 Oct 2021 19:38:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YlBjarhjvB5K; Tue,  5 Oct 2021 19:38:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 489E1607A3;
	Tue,  5 Oct 2021 19:38:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 54F9F1BF334
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAE6F60C30
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XTfQqij25gtg for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E4E360C03
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D57EC91223; Tue,  5 Oct 2021 19:34:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 21:31:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2abce12948ffe1193ef88955f0fe9d4cd8155d96
X-Git-Newrev: 8298e285dd65dfa2a57739191471ee98d6c22a09
X-Patchwork-Hint: ignore
Message-Id: <20211005193450.D57EC91223@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-botocore: bump to version
 1.21.48
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

commit: https://git.buildroot.net/buildroot/commit/?id=8298e285dd65dfa2a57739191471ee98d6c22a09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* The package doesn't support python2 anymore.
* Sort select alphabetically.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-botocore/Config.in            | 3 ++-
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-botocore/Config.in b/package/python-botocore/Config.in
index f34d774f95..4df82f614c 100644
--- a/package/python-botocore/Config.in
+++ b/package/python-botocore/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_PYTHON_BOTOCORE
 	bool "python-botocore"
-	select BR2_PACKAGE_PYTHON_JMESPATH # runtime
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
+	select BR2_PACKAGE_PYTHON_JMESPATH # runtime
 	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
 	help
 	  Low-level, data-driven core of boto 3.
diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index afaac12bde..31dd58de0a 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  870be84c9b418430ad9d0cb5640e76ef  botocore-1.12.210.tar.gz
-sha256  b954c596f8bdf31d5fdf1eff8a2296bde8094e1e22961a79b83bb62ddeba8a49  botocore-1.19.48.tar.gz
+md5  31ec9358b9b92d2d7cdba7fa448c4eed  botocore-1.21.48.tar.gz
+sha256  2c25a76f09223b2f00ad578df34492b7b84cd4828fc90c08ccbdd1d70abbd7eb  botocore-1.21.48.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 76c59d0a2d..d86ed5cb93 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.19.48
+PYTHON_BOTOCORE_VERSION = 1.21.48
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/35/73/c6fe3fafb74cc86a2a9ddf565a2b8956777e668c6248927e6d76b66f61a4
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/24/53/2d383e61b24637197ba213eb7891230b8d2a7f6ac8c44153943b4a760991
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
