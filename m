Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8585BE6748D
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58C154078F;
	Sun, 21 Dec 2025 22:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tHUDGAy-7ReD; Sun, 21 Dec 2025 22:12:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82CBD4079D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766355151;
	bh=SQrS/jb79uUAH6bOVdteua+QMx7JdpOrvcEmc670P+Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SgYl9vLfmWrUxEySiseD0S2s+UONBSpsdwMuDHsmjTGHCrq3itU98O/SLd7TH51Yi
	 fW4y4Wn8on93nzZpTNGv5XvX2BjqDrtWyRRk3XIIj+0zyhaAk/pkz/3h4/EiYLnt+K
	 RJk67LH3fCCr+MVEJIIRx9DtT87FmTXb6a7zmHI/p2qYfRxjmLz2jF3BnulYhp/8vP
	 e98MdN+t7LS5mJpEbvxAvp361lpFj3r4uRM1oGw4/pm2G2YyJrWzDc/gOPIAXCd2jd
	 Fk+KMKmaTGYQh7FUv42ugS7UArPYmLoKP8plxUhQnF0O1krKtjga6cL8MFmqeHjiFM
	 zCt9uVjZCuA6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82CBD4079D;
	Sun, 21 Dec 2025 22:12:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F0DE119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44A0581573
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDaPM7af-A5Q for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 824CD8156F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 824CD8156F
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7576E874CE; Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 22:58:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09675812659d86dadcf6d76f5137061099af8162
X-Git-Newrev: dee2bb0fac979f0d11d07aee0406e45db92ad9bb
X-Patchwork-Hint: ignore
Message-Id: <20251221221227.7576E874CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-google-auth: bump version
 to 2.45.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=dee2bb0fac979f0d11d07aee0406e45db92ad9bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/googleapis/google-auth-library-python/blob/v2.45.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-google-auth/python-google-auth.hash | 4 ++--
 package/python-google-auth/python-google-auth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-auth/python-google-auth.hash b/package/python-google-auth/python-google-auth.hash
index 17ca9ddd61..6a7b5cd170 100644
--- a/package/python-google-auth/python-google-auth.hash
+++ b/package/python-google-auth/python-google-auth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-auth/json
-md5  43aef15e30f2646226add26c54256302  google_auth-2.43.0.tar.gz
-sha256  88228eee5fc21b62a1b5fe773ca15e67778cb07dc8363adcb4a8827b52d81483  google_auth-2.43.0.tar.gz
+md5  702a1aa7d2a65e7ae2702167be9183f4  google_auth-2.45.0.tar.gz
+sha256  90d3f41b6b72ea72dd9811e765699ee491ab24139f34ebf1ca2b9cc0c38708f3  google_auth-2.45.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-google-auth/python-google-auth.mk b/package/python-google-auth/python-google-auth.mk
index 53e5900856..69c2a32b70 100644
--- a/package/python-google-auth/python-google-auth.mk
+++ b/package/python-google-auth/python-google-auth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_AUTH_VERSION = 2.43.0
+PYTHON_GOOGLE_AUTH_VERSION = 2.45.0
 PYTHON_GOOGLE_AUTH_SOURCE = google_auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
-PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/ff/ef/66d14cf0e01b08d2d51ffc3c20410c4e134a1548fc246a6081eae585a4fe
+PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/e5/00/3c794502a8b892c404b2dea5b3650eb21bfc7069612fbfd15c7f17c1cb0d
 PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
 PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
