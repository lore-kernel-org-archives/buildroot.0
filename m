Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4361ACD4840
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 17:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1D2780D88;
	Mon, 11 May 2026 17:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7W7gabMzWIAY; Mon, 11 May 2026 17:16:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2621780D89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778519818;
	bh=9zDGzKHgNU3oPdWtjMCDcZPBv6i4MheSMtblOK0gxWI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HNZ4Z1Zo15wcpLPZDxD1yv96YOXl8oMO8VAsY1oatDk+gbCCFQc3MjxqPZvnR0Dp2
	 X86FSjfU5YS/fugyMe0MvO/mQt8j4qT6V4FRhVhvolWGP7FB5jNXCKjkScFIRssdiP
	 Jicbwky+zvlMnMYMQnZMBqBYhlZnGWL/E8jTFLlMoWpQ8epQaOp2LN3PCfeT9hVWKI
	 /ytG+xVm8T3RXtICWGq2Zh+S/sOQbPB0/th3bbWzPjYTQntAb415CQZSO0pEeofils
	 YYpx1wBytS/NNx0lmyJ9qa54uvIWF7s3z3HuZn7suOllODkFGB36NpduCcPhhfF4Xh
	 XmlAcEsomAuAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2621780D89;
	Mon, 11 May 2026 17:16:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C9F7223
 for <buildroot@buildroot.org>; Mon, 11 May 2026 17:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A5F740729
 for <buildroot@buildroot.org>; Mon, 11 May 2026 17:16:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqiz5mBYZBre for <buildroot@buildroot.org>;
 Mon, 11 May 2026 17:16:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE62040728
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE62040728
 for <buildroot@buildroot.org>; Mon, 11 May 2026 17:16:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C93BE85E29; Mon, 11 May 2026 17:16:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 May 2026 19:10:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ecf88dc4e3812f3e5cc6f956bd6b437b9fe184c
X-Git-Newrev: 78a93cfa9b56791484598aef6b4f1686ce8c1de2
X-Patchwork-Hint: ignore
Message-Id: <20260511171650.C93BE85E29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpg-error: security bump
 version to 1.61
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/78a93cfa9b56791484598aef6b4f1686ce8c1de2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/gpg/libgpg-error/blob/libgpg-error-1.61/NEWS
https://dev.gnupg.org/T8239
https://lwn.net/Articles/1071807/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libgpg-error/libgpg-error.hash | 4 ++--
 package/libgpg-error/libgpg-error.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index 1e52e78d22..cddf2c7828 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  851a1619aee8f7723ed50f09cb6a186c483c280c  libgpg-error-1.60.tar.bz2
-sha256  11b2a738e212f3eab0fe8637bc341d3181ca964e97bb2654de91aab7dae4ce09  libgpg-error-1.60.tar.bz2
+sha1  ec35eea78798a0321986168ea28d55baccd5934b  libgpg-error-1.61.tar.bz2
+sha256  7a85413f2bc354f4f8aa832b718af122e48965e9e0eb9012ee659c13c6385c93  libgpg-error-1.61.tar.bz2
 
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 808339b935..df95e5fe0c 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.60
+LIBGPG_ERROR_VERSION = 1.61
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
