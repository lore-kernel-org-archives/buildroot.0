Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1566CC4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 18:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDAEA82233;
	Tue, 13 Feb 2024 18:22:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wHqB8cJyxbDV; Tue, 13 Feb 2024 18:22:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2FB782234
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2FB782234;
	Tue, 13 Feb 2024 18:22:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C61A71BF2BF
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 18:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B338C82234
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 18:22:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PkYBH_Mr7KrY for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 18:22:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6ECF182233
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ECF182233
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6ECF182233
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 18:22:07 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 73CCE13F8B9;
 Tue, 13 Feb 2024 19:22:02 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 19:21:57 +0100
Message-ID: <20240213182157.916696-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707848523;
 bh=G4i4rYySIE0qGZO4y4AOk/yJ25MrujghiA2zR3lM9ts=;
 h=From:To:Cc:Subject:Date:From;
 b=FD8qMH75kMaXaKrblB5kgkS8FNK1lVvJn3StV2gfF7CEJ5wyZ2StIxo7LsK7ngV1g
 7kcvkn/x33jAPyV2yD9nZAZRmBdu2f7rOaYbYa6LjgFucnC5FPyKcobtHfLv3WiQjU
 8Ft9Vdw2NZOkGoDy6Io92Ghg4nPZM8et2ZmLMIGgCbCsRlpekx7mXIpbzT3LEbHs+n
 Pf6udIYVe8DudxvgZE+YFRnNpjSH9NnWRUw9YM7+/3sqL82MKQhRfyPHRtounABGe+
 6W2dG+DGGN5F1DgpiEGLQZ9ogWJq/nsLLSjHI9euGeAND2RamkLWvE7dqQr5OVWYGA
 A3VW5OW/O0Ang==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FD8qMH75
Subject: [Buildroot] [PATCH 1/1] package/tinycompress: bump to version 1.2.11
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For commit log, see:
https://github.com/alsa-project/tinycompress/commits/v1.2.11/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested master branch at commit e889a1c with commands:

    utils/test-pkg -a -p tinycompress
    ...
    45 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/tinycompress/tinycompress.hash | 2 +-
 package/tinycompress/tinycompress.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tinycompress/tinycompress.hash b/package/tinycompress/tinycompress.hash
index 164f3a36c3..f86b75f346 100644
--- a/package/tinycompress/tinycompress.hash
+++ b/package/tinycompress/tinycompress.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  2f897e5112cd3bca6790b5cecfda6e0662c8bc5ee0fbab972b247a0cc620d66c  tinycompress-1.2.8.tar.bz2
+sha256  ebbe788c28328e7cca245aaf9194a5ad0dc91e9e0dc883c2cf9feb6d42c9f3fc  tinycompress-1.2.11.tar.bz2
 
 # Locally calculated
 sha256  912ea37a4435594a3b3c35f04efa4b5b7af2e68a05f5319c16c881711a31e4b7  COPYING
diff --git a/package/tinycompress/tinycompress.mk b/package/tinycompress/tinycompress.mk
index c9cfbb574b..fabd5884b2 100644
--- a/package/tinycompress/tinycompress.mk
+++ b/package/tinycompress/tinycompress.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYCOMPRESS_VERSION = 1.2.8
+TINYCOMPRESS_VERSION = 1.2.11
 TINYCOMPRESS_SOURCE = tinycompress-$(TINYCOMPRESS_VERSION).tar.bz2
 TINYCOMPRESS_SITE = https://www.alsa-project.org/files/pub/tinycompress
 TINYCOMPRESS_LICENSE = BSD-3-Clause and LGPL-2.1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
