Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2DAD66BBB
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E87C36119F;
	Wed, 17 Dec 2025 21:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hcBnh-qX7OI9; Wed, 17 Dec 2025 21:45:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 486E161193
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007911;
	bh=D8IucJLY5yL+6s+cqYo5x8pEFDZwiV1YggBA4W4sSdU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JVqypjYxFya0/P60vQ3IkZSVRb+S4BLmoq1yECHn7JKxbG8Q5MdzlF+vEMFuGBq1+
	 HUDgZFeYy95hS+YvxJD0FLvUGqVeEQP4TUWZ9z5jxBrAaB2Wy4Ff8sP3LDpitWBa1h
	 TnWm1Ri/rLGm4NbUnhh1DWaykjZSWT9pE7puSlsH18ZXI7ECOkQfwT1aNSUqMi3pqA
	 ta6J4EBsmfircRbdINaMsP98ZdPao3XAzsMtv+l5GncTuiyc4oMbb/nVztBr2tbG3w
	 ioDTsFfY4qHWCrerrVkFcGSI+FHfFfaL7Fd7sB21uEJfqUUU0T8gXmTsbNa40oe94A
	 t0V2niV04IXhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 486E161193;
	Wed, 17 Dec 2025 21:45:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20C1B37A
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA39E40F7D
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qXw1zqbmiSaj for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7667040F83
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7667040F83
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 750DC81E43; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:08:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 61b522acd0c4b25e925a78883c0837a0f31b2f16
X-Git-Newrev: 027a8d3d398487523fc453a16b6c30b9dbfbeca8
X-Patchwork-Hint: ignore
Message-Id: <20251217214458.750DC81E43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-weasyprint: bump version to
 67.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=027a8d3d398487523fc453a16b6c30b9dbfbeca8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/Kozea/WeasyPrint/blob/v67.0/docs/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-weasyprint/python-weasyprint.hash | 4 ++--
 package/python-weasyprint/python-weasyprint.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-weasyprint/python-weasyprint.hash b/package/python-weasyprint/python-weasyprint.hash
index 9c51ad95a3..d67415bcc6 100644
--- a/package/python-weasyprint/python-weasyprint.hash
+++ b/package/python-weasyprint/python-weasyprint.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/weasyprint/json
-md5  9e87ec00619aad446c51f679117be676  weasyprint-64.0.tar.gz
-sha256  1ceb3ea6306db4a3d06df0eafae3a5a6e879c35c40091aa8ceb5bcb143e80b29  weasyprint-64.0.tar.gz
+md5  55d8d8d72a1e7e6b209f7485fd5ad1f6  weasyprint-67.0.tar.gz
+sha256  fdfbccf700e8086c8fd1607ec42e25d4b584512c29af2d9913587a4e448dead4  weasyprint-67.0.tar.gz
 # Locally computed sha256 checksums
 sha256  bfd14eccfa6100575460e685556b183399d4bd335904e3c9521b0116d21c54da  LICENSE
diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
index 7edb9f28da..73bcb1b12a 100644
--- a/package/python-weasyprint/python-weasyprint.mk
+++ b/package/python-weasyprint/python-weasyprint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEASYPRINT_VERSION = 64.0
+PYTHON_WEASYPRINT_VERSION = 67.0
 PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
-PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/e3/04/c73f99531bce81d4ced5cd18a159855de261f83843a5633acd67ae327933
+PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/fd/bc/79a65b3a406cb62a1982fec8b49134b25a3b31abb094ca493c9fddff5492
 PYTHON_WEASYPRINT_SETUP_TYPE = flit
 PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
 PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
