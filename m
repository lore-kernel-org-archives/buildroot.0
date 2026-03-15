Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0722CF3028C
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEC0261392;
	Sun, 15 Mar 2026 22:19:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5vPL_ocDA4E; Sun, 15 Mar 2026 22:19:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E948661388
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613158;
	bh=Ohq/gn8cn+sDni96DO2x1rbZHFWdOOjMeIvFpxn9q20=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WZNxNEc08CJSrw45MZJJ8zEk8xS2TUoZyY4P5Bxy91S9aaFJyQwH3hVVN6XroLhbm
	 dSn/7mDxqwz6OY+RuDxa/33V0pSg/+ThdFmNl/YTUeNBQRWzITAgNRS1H/kNFePPun
	 W7HCiB7njy8xrVMgq5lAJfN3X3h9aMCQQAPIuAeUbmOXdygkr+V8+52hHgcDf7/xDU
	 d4Z+8gi+g9N9z2q+MOIquwpWW5c+OhLBshaDvrqVxF/UXwC9/1n9Is1PjWTqIGdktC
	 C79iF30wwovBcTxWqemw9t/dJe7agZba7rq8gw/FMtrAhZJwqMHZZvhdKjy8dVpdCF
	 k/9i8yWU4K2xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E948661388;
	Sun, 15 Mar 2026 22:19:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 105A1357
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E38B440B05
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pfyv35XzJ3kX for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CB7C40AC7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CB7C40AC7
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4EE9380FBC; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d63b4cc92208c477eb82009bdb821aa675f1f19
X-Git-Newrev: 97c0c97452ad77ccbfdad6808e99611100ddab3b
X-Patchwork-Hint: ignore
Message-Id: <20260315221804.4EE9380FBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tinyhtml5: bump version to
 2.1.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/97c0c97452ad77ccbfdad6808e99611100ddab3b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/CourtBouillon/tinyhtml5/blob/2.1.0/docs/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-tinyhtml5/python-tinyhtml5.hash | 4 ++--
 package/python-tinyhtml5/python-tinyhtml5.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tinyhtml5/python-tinyhtml5.hash b/package/python-tinyhtml5/python-tinyhtml5.hash
index 55afa09597..b370a58a47 100644
--- a/package/python-tinyhtml5/python-tinyhtml5.hash
+++ b/package/python-tinyhtml5/python-tinyhtml5.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tinyhtml5/json
-md5  c5fa2991d6d1ea65e923279c435b816e  tinyhtml5-2.0.0.tar.gz
-sha256  086f998833da24c300c414d9fe81d9b368fd04cb9d2596a008421cbc705fcfcc  tinyhtml5-2.0.0.tar.gz
+md5  246cded517cc885e616d1961cf899b52  tinyhtml5-2.1.0.tar.gz
+sha256  60a50ec3d938a37e491efa01af895853060943dcebb5627de5b10d188b338a67  tinyhtml5-2.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  16a39991619e92f18680932da2a9199fdf7d95df3ecaedc52ea06218aabafd6f  LICENSE
diff --git a/package/python-tinyhtml5/python-tinyhtml5.mk b/package/python-tinyhtml5/python-tinyhtml5.mk
index 373ab8aa54..620e36127b 100644
--- a/package/python-tinyhtml5/python-tinyhtml5.mk
+++ b/package/python-tinyhtml5/python-tinyhtml5.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TINYHTML5_VERSION = 2.0.0
+PYTHON_TINYHTML5_VERSION = 2.1.0
 PYTHON_TINYHTML5_SOURCE = tinyhtml5-$(PYTHON_TINYHTML5_VERSION).tar.gz
-PYTHON_TINYHTML5_SITE = https://files.pythonhosted.org/packages/fd/03/6111ed99e9bf7dfa1c30baeef0e0fb7e0bd387bd07f8e5b270776fe1de3f
+PYTHON_TINYHTML5_SITE = https://files.pythonhosted.org/packages/b1/1f/cfe2f6b30557c92b3f31d41707e09cef5c1efbd87392bc6c0430c46b0e4d
 PYTHON_TINYHTML5_SETUP_TYPE = flit
 PYTHON_TINYHTML5_LICENSE = MIT
 PYTHON_TINYHTML5_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
