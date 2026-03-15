Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364D2F3028C
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08ADA6140E;
	Sun, 15 Mar 2026 22:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3zNxX9G7p7iY; Sun, 15 Mar 2026 22:19:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDD506143C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613187;
	bh=2/uR6MW2w5fvoCGKRXTKYLQQDdhwmbawNJkV7II8PxU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lkZpGSVoYCA6QuUcfktU+X0SKHUWTa3yF3Reg7Klsg8gPWhJWGB7Wm1exi+IiAMSo
	 IzHl9Y8h/V0i3XLmfc0sqVVZVzXoKp6dndl32sw0e3s6TnIAOZgiElIoTEOq+sNsNA
	 tYvsKP6GSMZohXYdRqaYpIMb6jGiVBpD/yAwrFfgU3OAugJZpT2Czv3n/pcr5MD/zF
	 rtItm6VSjSXtHgRfWg5ZjCCZp+RMIXzQrLgiiCzl7d0QG4PfcIE5wgk1INab7UZl5V
	 ZVEArZf1NZn6BReG6kWANXj5wvcspEVbE+k6ajAXznY+RdqhtAXFjbE26oHHeivX6C
	 lwYnFA9D/0l3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDD506143C;
	Sun, 15 Mar 2026 22:19:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D7371B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABF5440A4A
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QNFhQ5VmfoEM for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AD0540B22
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AD0540B22
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D5428226F; Sun, 15 Mar 2026 22:18:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 635c145c16c11f90109f49b842c5a1b4184760d1
X-Git-Newrev: 6ebadc0d9486e8855dac9e2513d2ce894ed449a9
X-Patchwork-Hint: ignore
Message-Id: <20260315221805.4D5428226F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-whitenoise: bump version to
 6.12.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6ebadc0d9486e8855dac9e2513d2ce894ed449a9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/evansd/whitenoise/blob/6.12.0/docs/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-whitenoise/python-whitenoise.hash | 4 ++--
 package/python-whitenoise/python-whitenoise.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-whitenoise/python-whitenoise.hash b/package/python-whitenoise/python-whitenoise.hash
index 1659961825..792e3c917d 100644
--- a/package/python-whitenoise/python-whitenoise.hash
+++ b/package/python-whitenoise/python-whitenoise.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/whitenoise/json
-md5  212cafd7f8d972a5d6740bfc88b3f17b  whitenoise-6.11.0.tar.gz
-sha256  0f5bfce6061ae6611cd9396a8231e088722e4fc67bc13a111be74c738d99375f  whitenoise-6.11.0.tar.gz
+md5  864b21f485449341ea6b7ab68fb16146  whitenoise-6.12.0.tar.gz
+sha256  f723ebb76a112e98816ff80fcea0a6c9b8ecde835f8ddda25df7a30a3c2db6ad  whitenoise-6.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ebfd469b4fb6b5adada547747e1e8da725ecf20595d54aced043275d4f4a3600  LICENSE
diff --git a/package/python-whitenoise/python-whitenoise.mk b/package/python-whitenoise/python-whitenoise.mk
index 91f3b6d2d7..6a11c1db3e 100644
--- a/package/python-whitenoise/python-whitenoise.mk
+++ b/package/python-whitenoise/python-whitenoise.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WHITENOISE_VERSION = 6.11.0
+PYTHON_WHITENOISE_VERSION = 6.12.0
 PYTHON_WHITENOISE_SOURCE = whitenoise-$(PYTHON_WHITENOISE_VERSION).tar.gz
-PYTHON_WHITENOISE_SITE = https://files.pythonhosted.org/packages/15/95/8c81ec6b6ebcbf8aca2de7603070ccf37dbb873b03f20708e0f7c1664bc6
+PYTHON_WHITENOISE_SITE = https://files.pythonhosted.org/packages/cb/2a/55b3f3a4ec326cd077c1c3defeee656b9298372a69229134d930151acd01
 PYTHON_WHITENOISE_SETUP_TYPE = setuptools
 PYTHON_WHITENOISE_LICENSE = MIT
 PYTHON_WHITENOISE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
