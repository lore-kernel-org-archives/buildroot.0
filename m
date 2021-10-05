Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14955C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:38:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5E4E611C5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5E4E611C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B14B283E19;
	Tue,  5 Oct 2021 19:38:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R5kUjeNciIhG; Tue,  5 Oct 2021 19:38:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB81483E2A;
	Tue,  5 Oct 2021 19:38:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4CDE51BF983
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE66C83E13
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GO_nlgs532w9 for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 163A583E00
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CC91391216; Tue,  5 Oct 2021 19:34:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 21:31:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8ac8a8f67b3d8ce6e7db093289d8f5ee8088196
X-Git-Newrev: 2abce12948ffe1193ef88955f0fe9d4cd8155d96
X-Patchwork-Hint: ignore
Message-Id: <20211005193450.CC91391216@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-boto3: bump to version
 1.18.48
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

commit: https://git.buildroot.net/buildroot/commit/?id=2abce12948ffe1193ef88955f0fe9d4cd8155d96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package doesn't support python2 anymore.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-boto3/Config.in         | 1 +
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/Config.in b/package/python-boto3/Config.in
index 67b1420388..1cb1ebfd12 100644
--- a/package/python-boto3/Config.in
+++ b/package/python-boto3/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_BOTO3
 	bool "python-boto3"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_BOTOCORE # runtime
 	select BR2_PACKAGE_PYTHON_JMESPATH # runtime
 	select BR2_PACKAGE_PYTHON_S3TRANSFER # runtime
diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 6752a2cca0..e4d924e786 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  8cecdbf7ef6702837d7ddabaa3e39a89  boto3-1.16.50.tar.gz
-sha256  4d502a842b81fdac4b950d3b88a5b9067ce118213b122b20f4192003cb067986  boto3-1.16.50.tar.gz
+md5  0f37b054b9c14fe05a8194f85b122918  boto3-1.18.48.tar.gz
+sha256  7b45b224442c479de4bc6e6e9cb0557b642fc7a77edc8702e393ccaa2e0aa128  boto3-1.18.48.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index a5c2b6ab31..d1e01de855 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.16.50
+PYTHON_BOTO3_VERSION = 1.18.48
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/c8/c6/b4d9547a493ac2837f296f4a004dff6e7136cf6750d181769b8a61d63813
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/d4/1e/7d6bf1b92199121ec5c020868402b90ba1a4fef6941aafaff970a664d83a
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
