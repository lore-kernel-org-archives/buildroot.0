Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04F0FC617E
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFE41607F5;
	Sat,  3 Jan 2026 11:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 50wCki8JcnIz; Sat,  3 Jan 2026 11:58:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAE7060801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767441525;
	bh=BcjjcgW5fftBk1fw5vqu0CJ+GHn4hWunNy22qlOskBI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XSvWWpNm8nUBSO2bUd8SGOap3XCRyJI4gY1ACj8/s1J6cwr+kbM5G16PtmUMU5C/l
	 jlhGfsi5avPfUzRJc5EBP0ckiSTOi/iBaN5VQQR2+a15lbHa5fT+XfNP86sDm7Tr2X
	 pSIzv+U0ZpzCabtohdFvJj6nAU94OOd5XodiIjXahCRDg4keUx3I1LaBHaxlQAtaP3
	 DzZb5w9FRrp/6+N1w2IFwC68YoX2Y9MN6pvLsZJ0Fg+xuwpKcDwpn+bExY233VmLA9
	 Ye/P2DbSNAQ27UdoaBiNH3f4njY0sRikS1ZOwzGbl7NWUWxm0m/rIlRZ0ROfXWWOIJ
	 rVc/ifVlwWDMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAE7060801;
	Sat,  3 Jan 2026 11:58:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CE5EA21
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F6A24077F
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5klHoSJdEBqr for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:58:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93C5F4077A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93C5F4077A
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:58:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84B0888114; Sat,  3 Jan 2026 11:58:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Jan 2026 12:43:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5dee91f069e2e2b952aa4ef1b88b6875ce56c66a
X-Git-Newrev: 8e4aac8c1c48e2f4b166c04e7768b9179feebef0
X-Patchwork-Hint: ignore
Message-Id: <20260103115842.84B0888114@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-boto3: bump to version
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

commit: https://git.buildroot.net/buildroot/commit/?id=8e4aac8c1c48e2f4b166c04e7768b9179feebef0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index ae99b5092c..29d4125fbb 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  8abc4bb707739d3ad3e9fe14b42d5234  boto3-1.42.14.tar.gz
-sha256  a5d005667b480c844ed3f814a59f199ce249d0f5669532a17d06200c0a93119c  boto3-1.42.14.tar.gz
+md5  67045728a35f4e764ad826fc31006746  boto3-1.42.21.tar.gz
+sha256  9b92943d253bc837323079fe88460e741cb2eb80abaebcb558b2446bdb4049d6  boto3-1.42.21.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 9ee51b454d..3d7088ddb3 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.42.14
+PYTHON_BOTO3_VERSION = 1.42.21
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/09/72/e236ca627bc0461710685f5b7438f759ef3b4106e0e08dda08513a6539ab
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/27/36/999f23a821567334ecdfaec31fad556f5569383006543be63fdd1e17193f
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
