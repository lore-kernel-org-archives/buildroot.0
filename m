Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE461E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8C6540760;
	Sun, 28 Dec 2025 22:07:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rkYkYGX1L5S3; Sun, 28 Dec 2025 22:07:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B87EE404D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766959626;
	bh=/S1gIgRTdPNrwRfqqAPyllOAjJBuW9xDXFCjvHjwJk4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jvltAg/9MkWxp2mDkTt6kHBPFKsEOi0cb2AtEiZvsxCMdIXy1v9FloU1NTDAAPzA2
	 buAtBUH1relfIXkT/aHjU+KcuuuAKSgWa+sYB5/TKB+mq/NU9JcQCkNJdHLrkicNbB
	 Jacy6fx0Py1h/Q+8L5XPEwsCupsmhDVO30DvScEUzDFRcjsb4m7CtH5rsbLIs1+N7F
	 Djw+DIYiA4Rj7+Ljvug8Y/O5O4FEiv72rY6+v7wEkvvWBbhTeTYqT4lcVs7IvMHggA
	 W/VVqBGod4A6frCQmZ1qza2wpCV8RlMBYHRWzu5cuoarDTYrdVHpjWTYGIE9fukswR
	 5ogJ1aV0cge8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B87EE404D7;
	Sun, 28 Dec 2025 22:07:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 171FDD8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3DCC80DE6
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9w29i4S6e5u for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:06:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 046F380DF7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 046F380DF7
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0280A85F80; Sun, 28 Dec 2025 22:06:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 23:02:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50922517f7c3f8c35f1683aab10c33e95f79fe29
X-Git-Newrev: 46f8497e1c92c29a2f1d9889b897d948b496ef92
X-Patchwork-Hint: ignore
Message-Id: <20251228220646.0280A85F80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyqrcode: update tarball URL
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=46f8497e1c92c29a2f1d9889b897d948b496ef92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyqrcode/python-pyqrcode.hash | 4 ++--
 package/python-pyqrcode/python-pyqrcode.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pyqrcode/python-pyqrcode.hash b/package/python-pyqrcode/python-pyqrcode.hash
index c946ba9d9b..9c1dfce294 100644
--- a/package/python-pyqrcode/python-pyqrcode.hash
+++ b/package/python-pyqrcode/python-pyqrcode.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pyqrcode/json
+# md5, sha256 from https://pypi.org/pypi/pyqrcode/json
 md5  371f29f4b03bd2830c6e0319258b1259  PyQRCode-1.2.1.tar.gz
-# Locally computed
 sha256  fdbf7634733e56b72e27f9bce46e4550b75a3a2c420414035cae9d9d26b234d5  PyQRCode-1.2.1.tar.gz
+# Locally computed
 sha256  bef0c3595451da5132dea99e288fb5dafcbc469e0643f993a4ba0a69980f5ec9  setup.py
diff --git a/package/python-pyqrcode/python-pyqrcode.mk b/package/python-pyqrcode/python-pyqrcode.mk
index f3eac5a3c0..6dfe1afa6d 100644
--- a/package/python-pyqrcode/python-pyqrcode.mk
+++ b/package/python-pyqrcode/python-pyqrcode.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYQRCODE_VERSION = 1.2.1
 PYTHON_PYQRCODE_SOURCE = PyQRCode-$(PYTHON_PYQRCODE_VERSION).tar.gz
-PYTHON_PYQRCODE_SITE = https://pypi.python.org/packages/37/61/f07226075c347897937d4086ef8e55f0a62ae535e28069884ac68d979316
+PYTHON_PYQRCODE_SITE = https://files.pythonhosted.org/packages/37/61/f07226075c347897937d4086ef8e55f0a62ae535e28069884ac68d979316
 PYTHON_PYQRCODE_SETUP_TYPE = setuptools
 PYTHON_PYQRCODE_LICENSE = BSD-3-Clause
 PYTHON_PYQRCODE_LICENSE_FILES = setup.py
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
