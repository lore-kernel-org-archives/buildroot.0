Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA06EC433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:40:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B04F60FE8
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B04F60FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57A2680D4E;
	Tue, 26 Oct 2021 19:40:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0sBwdH8LUAZB; Tue, 26 Oct 2021 19:40:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCE2280BB2;
	Tue, 26 Oct 2021 19:40:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 33C011BF9AC
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5464040243
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:38:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vl7iJC7XvzA6 for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F7FE4055D
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 836AD88F04; Tue, 26 Oct 2021 19:34:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 21:34:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5562eb58e8bad82bf8d691f90e6411344e280847
X-Git-Newrev: a98cfa16b21c4ce18b8f33423ae6dec424a07092
X-Patchwork-Hint: ignore
Message-Id: <20211026193445.836AD88F04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-boto3: bump to 1.19.2
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
Content-Type: multipart/mixed; boundary="===============2473704692806893764=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2473704692806893764==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a98cfa16b21c4ce18b8f33423ae6dec424a07092
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While at it, remove the md5 hash as there is already a sha256 hash.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-boto3/python-boto3.hash | 5 ++---
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index e4d924e786..358fabd39b 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  0f37b054b9c14fe05a8194f85b122918  boto3-1.18.48.tar.gz
-sha256  7b45b224442c479de4bc6e6e9cb0557b642fc7a77edc8702e393ccaa2e0aa128  boto3-1.18.48.tar.gz
+# sha256 from https://pypi.org/pypi/boto3/json
+sha256  11a6035060230e92327d4f10fef6bc44188b2cd68504012bc25ed62ac31d670b  boto3-1.19.2.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index d1e01de855..8e10aa482d 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.18.48
+PYTHON_BOTO3_VERSION = 1.19.2
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/d4/1e/7d6bf1b92199121ec5c020868402b90ba1a4fef6941aafaff970a664d83a
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/ec/45/d12f9c09b5c4dad8bcb098dfae5e9e1253ed6408efbbd9a3e60bff55b824
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE

--===============2473704692806893764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2473704692806893764==--
