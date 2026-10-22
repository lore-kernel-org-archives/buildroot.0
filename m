Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAD4606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qlJF0e9O
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7537460677;
	Thu, 22 Oct 2026 15:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFUiWj5VOsVj; Thu, 22 Oct 2026 15:39:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7BE3E6069C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792683553;
	b=U5Lnmb6VUP/QwiV1gYZpispx/UR6wNkUMhAVngBYP1DMr8umygDy/f750y5En5qQNQLe
	 UPkOMUrCvWtawHhAILHHXPBjMZCw4+k04RYipndpBfKU18brBNPJRgp1ZHoR6+LwUs2OJ
	 E98Ajb7rp7CGUxuS6t4KHFlGjUchEAZ+f+7QGue07eiff0dCQC/jlD8QaQMdEDwk9jlI1
	 tKZk5hOed6XbBzfmzd4qvF/G9m9kmfZrcg+Vc8BtclPi34AjWyTJkAt0aWHM9XPhIhJra
	 TMjBV0jxD1sTHod8Hfhjy1bx6PldmtyvfC8GoCbfnqK87rUwW5SQlRHmMuRu/3tS/wg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792683553;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YQ3BWDoh+mwVBEpMWaIpiPcE3Uya9KGTGvava3QOcAM=;
	b=WaYg9vHQz4K6j4Unh1vqlwFBv/f/7kKqBesKHImwsonrnpTWqLNsRn9M94ZbXV3jvwIc
	 Jlyop4rEEfmK+R/Ksk4Lyt2pVHX4HnPxwuLp8j3m5EmoWDTAQHqLy35t77dU2rogyqvb2
	 o/snX4LKjKgjdZf+fHfazq0C5Pq3BcViT4+wYROi8MFLJVglJL5sM5SQcSYCGUXaYzl8F
	 /deJNTnnrCAR0lF1JG9/Oab7HeQRdTR2YkdLCy1YYzjfwvK+Twak6blmo3EKipfeIqL37
	 Z8FN9tdAAJprNANE48iHUDD9J6XUO21BHFxE5oUIBtblqAzyS4qj3Yp8wlBu6UBEXZA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792683553;
	bh=YQ3BWDoh+mwVBEpMWaIpiPcE3Uya9KGTGvava3QOcAM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qlJF0e9ONlPjLpBzqja0ujUoSdNNauqYF/fn1dJ5bKKTBPDAXFtlo4vaKijFLdBO5
	 tTSJoZNKXgF2nI8zHwQGt483tHUxblLCpOW4Oqkazj7Ah0P/BeJaR6ohgUlyeVnW9g
	 laE8tPuv05vvxPReCDVcCfnsDZmgd2YBv44X6RLcjM/2fkk3j0pkVulvBwRu+7yJys
	 ASOU6dNJ9qFXkyO3fmzVgajuNT6fotZCmjQr+zVgGaOXAyUk5M9QghnBB23SA/ij7D
	 B1XiVdUvTpTqjAk+SN/CPAVBrJMXMZ9Hi67Ljdj537GlrP6U3n7GMQNCu4eHUUTqyl
	 QUU76O1kT/Tog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BE3E6069C;
	Thu, 22 Oct 2026 15:39:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 19ACB1AB
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BADE811CD
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JT1JgpIT5qX9 for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:39:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EEF10811A3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792683551;
 b=oaTM+Q7LVNaX77Vazz+CBvyLy1VpfkErqUCNKTluQtkkpf6hKZC0Pm5gkksaVzCiccjV
 dMoSeQbEB+iaKAo6t2sAKQP6qrhmwY3WqX48QpLmx5jwVFKOPyXm+pQNW4TjGWuL9qgsy
 ZDJ9RojePt2TUQrAA1tVi6ox4QV+XIOtLWn784+/1jqTJLnYLNzStVrz/fT6Kwcuc8Hta
 Q1oIKmKL9d3N5Ea3s12CKO37wTOo0ralCCWtxuGKNivh4Bn+OH57+JqPPcqz5U/pK8gMh
 kUUymIRNsaSUvlMSF/xI+SGEiY8d6IWfs6kNEe7GsHx59AhVeP+sWPoTceSILQnHobQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792683551;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=YQqUq9YSPCDgQAkxOQxXuB8N68LvRXd4sDw+QaTS2g0=;
 b=FR+OxH50iiHoD40dZd7rKeoKI2I/ixaOCck4tSKld+77A5N+p31Fz18U/Z7P3Q+uDGX4
 S4atuyGgqVPiHMWHGuGm9tigafBYkQToWiGtLOAOjbPAG+4cZi4hxtat5WI0PprUwkE0F
 mCDGvBOGmdHj8YTH9oXL8gH55UnisFHJbXNy2d2cR9W2VoLjEcKXDHoFtBSC8g/GZCu/9
 fItdUoYqP1f3i9nYMGHTPtVz3eccvJkevb8xPZ/KMM993yGF05SAIcNRZ+VKRl0YLijDs
 hbjZgF67Ve/Ohqpvj0qEdipDcRdRxb+6r9Km81QWYTg8Djm6ycBH5uH5CyhqjZ/K6OA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEF10811A3
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:39:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5F3D9B9FF; Thu, 22 Oct 2026 15:37:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 15:54:29 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d5e0d4ad40a7fb9f8ffe20c32f43f514a956f33e
X-Git-Newrev: 3c4bc567c5fd932971fc62a2d72807edb7413cb8
X-Patchwork-Hint: ignore
Message-Id: <20261022153746.E5F3D9B9FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-certifi:
 bump to version 2026.7.22
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3c4bc567c5fd932971fc62a2d72807edb7413cb8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fd66866c9a9bfdc8430298c3db33a1dd8319ce22)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index 5f4706fd37..a0c24e66f3 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  238385f505d22767cd1860661f1c5743  certifi-2026.4.22.tar.gz
-sha256  8d455352a37b71bf76a79caa83a3d6c25afee4a385d632127b6afb3963f1c580  certifi-2026.4.22.tar.gz
+md5  926857e560a3ae443ee35c2de270d75b  certifi-2026.7.22.tar.gz
+sha256  741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55  certifi-2026.7.22.tar.gz
 # Locally computed sha256 checksums
 sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 474b147873..17c6925ae7 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2026.4.22
+PYTHON_CERTIFI_VERSION = 2026.7.22
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/25/ee/6caf7a40c36a1220410afe15a1cc64993a1f864871f698c0f93acb72842a
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a3/c2/24167ea9858356b47a87a50d39908bfdb72ceeefe0041586e704e5376b3a
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
