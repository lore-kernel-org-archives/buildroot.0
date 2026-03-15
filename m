Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0880F3028C
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A99461145;
	Sun, 15 Mar 2026 22:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xWY2kXGvHJkP; Sun, 15 Mar 2026 22:18:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF709611A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613089;
	bh=QSEh4zvZTzdyfRQoBN9VKuBBI8iRa5KusMp4C3ZNjhg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UBuyHk1quY5WDvWS0Ilt698GYTe/RNeaplaq7ifXI5/3qTIlDbtt8uaHaomtI+smc
	 M2juZluVEkTQLP/SWx1w1Tajz5d73YpIgOSyIDaaNlFQAwJ/8B8pGjwvLFFY25S9xT
	 BurPihhv39ueQOdndVro7qDHYUnW7QeiKo0WK28AsLSLPCElWPy+znDoUnAdB8/m28
	 rlZWvL2TCxbFO5PdVp49pYs3nt5alNY2y5+CYJ9hHrPIBJlmkbz2spaCx7HWTmGW8c
	 3MdZd4OSOeZ1OZs9bWi4YAfcaVKUL1Wcu/Zp3fZl5Daj4d0f2xefBFUJQHxWmzpD/I
	 1IQBADh1JtUcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF709611A9;
	Sun, 15 Mar 2026 22:18:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D7971B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A2FC610A4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y4s6hrYCpDXv for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD3616108C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD3616108C
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B93883F4D; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 16:21:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81541039cd10d778472f2fba54c549478023213f
X-Git-Newrev: e3fee9b0987c4530031cf0e5a1225bdffda48a8a
X-Patchwork-Hint: ignore
Message-Id: <20260315221801.1B93883F4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-charset-normalizer: bump
 version to 3.4.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e3fee9b0987c4530031cf0e5a1225bdffda48a8a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/jawah/charset_normalizer/blob/3.4.5/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-charset-normalizer/python-charset-normalizer.hash | 4 ++--
 package/python-charset-normalizer/python-charset-normalizer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
index dd10c11e73..1094f419a3 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.hash
+++ b/package/python-charset-normalizer/python-charset-normalizer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
-md5  3c73a3c5c05a896c1169d8b5298dc4e5  charset_normalizer-3.4.4.tar.gz
-sha256  94537985111c35f28720e43603b8e7b43a6ecfb2ce1d3058bbe955b73404e21a  charset_normalizer-3.4.4.tar.gz
+md5  cde800b3dada84f6041196f40f4b2ad1  charset_normalizer-3.4.5.tar.gz
+sha256  95adae7b6c42a6c5b5b559b1a99149f090a57128155daeea91732c8d970d8644  charset_normalizer-3.4.5.tar.gz
 # Locally computed sha256 checksums
 sha256  6d0d41bfe170ac6c7dc248c9a63e254d0fb45a60d50a8257d0af92c6e249b887  LICENSE
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index f793241a1e..ce91028b31 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHARSET_NORMALIZER_VERSION = 3.4.4
+PYTHON_CHARSET_NORMALIZER_VERSION = 3.4.5
 PYTHON_CHARSET_NORMALIZER_SOURCE = charset_normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
-PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/13/69/33ddede1939fdd074bce5434295f38fae7136463422fe4fd3e0e89b98062
+PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/1d/35/02daf95b9cd686320bb622eb148792655c9412dbb9b67abb5694e5910a24
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
