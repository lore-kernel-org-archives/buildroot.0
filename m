Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F67D5B86F
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D86F6810C0;
	Mon, 15 Dec 2025 21:10:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iK11BqUqFdIb; Mon, 15 Dec 2025 21:10:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C54C0810B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765833008;
	bh=2JzH3Tkvvx7rj7HWXuoFkYeLjVbSp1RsSyt+6tnE09M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EZwj81gCemm0dTKhU2+B5EcW8z01F8dJnl+4JLxZ7ZOYcM8JbwDhdKwNMkChXTPvh
	 eBRME+8EK1nYeH4DLfKSAZpDqRkwIBAnjO/AqO2eR2dbmY/TOsWhcN3ZOXMsn5XS1x
	 ZPb42/+koWM3cE2Ok1lvAn5SsvbC1EYvI8sk9R2X9dLg33u+liAIOpu4sCSrahX2Xk
	 aVD4oSZtozltdwyezJ/L2l8xFEiGekOixa1KFZJ/fmIwnS2mVG3s+rryN5acblFFEz
	 J7xcL82QZdC0SrrUSdEIUpMT+dPIM14hsWPNtN1VBR71ZV7hqspxjjWpQBU9Hedp1o
	 TgM1pf62V9lbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C54C0810B4;
	Mon, 15 Dec 2025 21:10:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C4B4F255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E9CC40AC1
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MuQs2euWF8-F for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A70F640ABE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A70F640ABE
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A55B586FB7; Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:47:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1c17bb81c6f21fb89e6838264f26047380efc3e
X-Git-Newrev: 07a28fb3801ec6d055590b25a951aece1957ecac
X-Patchwork-Hint: ignore
Message-Id: <20251215211000.A55B586FB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-matplotlib-inline: bump
 version to 0.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=07a28fb3801ec6d055590b25a951aece1957ecac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched build system to flit:
https://github.com/ipython/matplotlib-inline/commit/d9002a8d3a706487a879b8260e30e0d9d1f22dcd

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-matplotlib-inline/python-matplotlib-inline.hash | 4 ++--
 package/python-matplotlib-inline/python-matplotlib-inline.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-matplotlib-inline/python-matplotlib-inline.hash b/package/python-matplotlib-inline/python-matplotlib-inline.hash
index 1925a09808..6370d2ce87 100644
--- a/package/python-matplotlib-inline/python-matplotlib-inline.hash
+++ b/package/python-matplotlib-inline/python-matplotlib-inline.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/matplotlib-inline/json
-md5  96fe871bf30dc414e6724423c1e2ebb1  matplotlib_inline-0.1.7.tar.gz
-sha256  8423b23ec666be3d16e16b60bdd8ac4e86e840ebd1dd11a30b9f117f2fa0ab90  matplotlib_inline-0.1.7.tar.gz
+md5  25b1b460ee846df0d4d5d92dc8e6664c  matplotlib_inline-0.2.1.tar.gz
+sha256  e1ee949c340d771fc39e241ea75683deb94762c8fa5f2927ec57c83c4dffa9fe  matplotlib_inline-0.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  8521b036c6448e0e0aa7213d4713b6fdee0f4c64c9f320450f77346bf5c0e8e4  LICENSE
diff --git a/package/python-matplotlib-inline/python-matplotlib-inline.mk b/package/python-matplotlib-inline/python-matplotlib-inline.mk
index 961b50120a..54c4a18661 100644
--- a/package/python-matplotlib-inline/python-matplotlib-inline.mk
+++ b/package/python-matplotlib-inline/python-matplotlib-inline.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_MATPLOTLIB_INLINE_VERSION = 0.1.7
+PYTHON_MATPLOTLIB_INLINE_VERSION = 0.2.1
 PYTHON_MATPLOTLIB_INLINE_SOURCE = matplotlib_inline-$(PYTHON_MATPLOTLIB_INLINE_VERSION).tar.gz
-PYTHON_MATPLOTLIB_INLINE_SITE = https://files.pythonhosted.org/packages/99/5b/a36a337438a14116b16480db471ad061c36c3694df7c2084a0da7ba538b7
-PYTHON_MATPLOTLIB_INLINE_SETUP_TYPE = setuptools
+PYTHON_MATPLOTLIB_INLINE_SITE = https://files.pythonhosted.org/packages/c7/74/97e72a36efd4ae2bccb3463284300f8953f199b5ffbc04cbbb0ec78f74b1
+PYTHON_MATPLOTLIB_INLINE_SETUP_TYPE = flit
 PYTHON_MATPLOTLIB_INLINE_LICENSE = BSD-3-Clause
 PYTHON_MATPLOTLIB_INLINE_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
