Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8884F3027F
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CE414159F;
	Sun, 15 Mar 2026 22:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36dkAUozFZOc; Sun, 15 Mar 2026 22:19:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF61B41598
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613167;
	bh=pyRbWardeMQE8SMD9YaCAn/ip0czxxC9J2mL8aBoPbU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=im5jQ2zRK0vyF1R0cagRc+dCO+MgcGFb42D5Z8+OZm1/fNhm95CFtuoQd60bCRI/y
	 P/XSM1I9tGdVvrxABJR6eBfwXeKo1U2rweSlLv5reU+5/z7m+iUY6OSUKYn0c87bkg
	 IyCogZmmcbQaauGOAkMcN3sXiwzM+YYkCzaB1vvIENLCZ+jxntF2QBNaDlizvLNh5C
	 XZDz/5tV6wmMkh7JW7JzY3RP2mPoaC0mkBcWAPM8UEX+E+HoyF1OaayYUSfA1CSexO
	 77CKdvDVftd88G8pyz8ozWz89y46X4hhRjof2YDV8X3XfZTIkd8xHIWqotCRgk4ZUL
	 VLQiBpQ+5tiYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF61B41598;
	Sun, 15 Mar 2026 22:19:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E0541B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C571740B80
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1EL0WzhL7Sb for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6C6E409DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6C6E409DF
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34D0F80FBC; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25867d252b92ead57d63c565f186e16dc08be134
X-Git-Newrev: 9f17e0c2c92b58fad20f49e1fa9142ecbb87c593
X-Patchwork-Hint: ignore
Message-Id: <20260315221804.34D0F80FBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-textual: bump version to
 8.1.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9f17e0c2c92b58fad20f49e1fa9142ecbb87c593
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/Textualize/textual/blob/v8.1.1/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-textual/python-textual.hash | 4 ++--
 package/python-textual/python-textual.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-textual/python-textual.hash b/package/python-textual/python-textual.hash
index 68f996aeec..00a6759383 100644
--- a/package/python-textual/python-textual.hash
+++ b/package/python-textual/python-textual.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/textual/json
-md5  88b5c60f9713a6cc3b5cf625c4f5efe3  textual-7.5.0.tar.gz
-sha256  c730cba1e3d704e8f1ca915b6a3af01451e3bca380114baacf6abf87e9dac8b6  textual-7.5.0.tar.gz
+md5  d94bf25d9e81458d56b86aa108bb3fea  textual-8.1.1.tar.gz
+sha256  eef0256a6131f06a20ad7576412138c1f30f92ddeedd055953c08d97044bc317  textual-8.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  94f290a762376dfdb7768e42070618b0abfd2a2799eab1b1c097816c3a39eb57  LICENSE
diff --git a/package/python-textual/python-textual.mk b/package/python-textual/python-textual.mk
index 93881f6d02..9401964732 100644
--- a/package/python-textual/python-textual.mk
+++ b/package/python-textual/python-textual.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEXTUAL_VERSION = 7.5.0
+PYTHON_TEXTUAL_VERSION = 8.1.1
 PYTHON_TEXTUAL_SOURCE = textual-$(PYTHON_TEXTUAL_VERSION).tar.gz
-PYTHON_TEXTUAL_SITE = https://files.pythonhosted.org/packages/9f/38/7d169a765993efde5095c70a668bf4f5831bb7ac099e932f2783e9b71abf
+PYTHON_TEXTUAL_SITE = https://files.pythonhosted.org/packages/72/23/8c709655c5f2208ee82ab81b8104802421865535c278a7649b842b129db1
 PYTHON_TEXTUAL_SETUP_TYPE = poetry
 PYTHON_TEXTUAL_LICENSE = MIT
 PYTHON_TEXTUAL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
