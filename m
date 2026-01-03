Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554F9FA3750
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3621281EAC;
	Sat,  3 Jan 2026 11:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W2p374jh2yCI; Sat,  3 Jan 2026 11:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F4F481EA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767441529;
	bh=RQwAs3gTTjTRmgIzfGqlyR+t4dm1IbJSVz/SR8zDt4k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=APn7rkMeqza+r2xeFXW9Kc1aHarKlQKA8gYQ/TyC2hoq6+Tb2O39O6bPCYwmkxIOz
	 5VOuewZJruNMD3XoK2iNFLCnASfnx+c3kHVIOUeZBoKfkIclF7gnw/K6yGc1CCwJN1
	 UC7nuWlIwTDuvWWYBLhI0aPqALzzrlHxYf+VwqQzo7gnwxaKn2mRNtRM8YtJgEocUJ
	 CPhb3QjkUy9LsTGn+umSbCt9VMPzk6NlBj/lLQTfPUWvQcpKE89ZaGMPfqAzjt1gn+
	 GaZvVCZl5z4cVWOAUv+K9SgSR9xuZ7Wd1QbuEnRvycftj9GR593/GJvuOp27PdvJAn
	 LHPpp+dwSe0Dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F4F481EA3;
	Sat,  3 Jan 2026 11:58:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A74DB249
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A2114077A
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:58:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kdIR0wqyAXFp for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:58:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C09F40779
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C09F40779
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:58:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7AC2C88112; Sat,  3 Jan 2026 11:58:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Jan 2026 12:43:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be65832720b226516dcaf357fbb9276544bbf031
X-Git-Newrev: 5dee91f069e2e2b952aa4ef1b88b6875ce56c66a
X-Patchwork-Hint: ignore
Message-Id: <20260103115842.7AC2C88112@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-botocore: bump to version
 1.42.21
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

commit: https://git.buildroot.net/buildroot/commit/?id=5dee91f069e2e2b952aa4ef1b88b6875ce56c66a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 6b4d788410..5645c0fe64 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  5905039db132a93c73a18ad9e497bb43  botocore-1.42.14.tar.gz
-sha256  cf5bebb580803c6cfd9886902ca24834b42ecaa808da14fb8cd35ad523c9f621  botocore-1.42.14.tar.gz
+md5  76edea65e7dd32f11f8ea3885dc65524  botocore-1.42.21.tar.gz
+sha256  db8f99d186156da42feb4fd2098017383d9b155097290cc53da7258f6e652c39  botocore-1.42.21.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 3d7fe258bb..5ed8ac421a 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.42.14
+PYTHON_BOTOCORE_VERSION = 1.42.21
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/35/3f/50c56f093c2c6ce6de1f579726598db1cf9a9cccd3bf8693f73b1cf5e319
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/4c/df/dfd07d75fda643ba07af75e33cfd72472a12bb13901812ca34e47f081507
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
