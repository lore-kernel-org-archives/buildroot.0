Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4AEC001B0
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 09:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32E9C40BC0;
	Tue, 15 Aug 2023 09:39:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32E9C40BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4BiwTKG1ylAx; Tue, 15 Aug 2023 09:39:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 819F540BE1;
	Tue, 15 Aug 2023 09:38:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 819F540BE1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D04A21BF2FF
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 09:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B664B40BBF
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 09:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B664B40BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jks50Kogw7xX for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 09:38:55 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3AE040900
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 09:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3AE040900
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6A6FE13F8AF;
 Tue, 15 Aug 2023 11:38:51 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 15 Aug 2023 11:38:44 +0200
Message-ID: <20230815093844.13369-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692092332;
 bh=N8FgvN4RR7D+z2ADCUIbIiMy/etF+1KfBPI2Nx0LADg=;
 h=From:To:Cc:Subject:Date:From;
 b=bFDwEwKc2Q+7HTQ1+8cn5AbaWmeYwMG4aYKWXQAgQjin7MZcU+PV5Rui8OT6qAGnq
 ZWK4nPNjMPRZM1naI4QROJLVc6FxWON/VBXbO8WnzwJuFZH8pkq4pICca3/MykCNL+
 joGy/2yEYp9XE+8KKdSpGMNFnOm17610KHzXxOpi1Mz8k1SbI2mi+sM6jRw/35AM8G
 1Ciz7A15QQH0aeawPh4ZFgr7NgswlZ0yk4hkqx4XH00Ajz+lgQQqeRZLK4JIcvcive
 ZKf4m5yMeli/LaIDr2UmpyO7W13tLLANOxJ5aSCOLougdoPolieJffuTcFBjNU9Bqs
 d7el2n/KeEtdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bFDwEwKc
Subject: [Buildroot] [PATCH next 1/1] package/lsof: change _LICENSE_FILES to
 use COPYING
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

Commit e3322e2c7 "lsof: add license info" added the package license
info. At that time, lsof was at version 4.85. The package was not
including a dedicated license file. Instead, the license text was
copied in many files (source files, readmes, ...). It was then decided
to use the small source file "dialects/linux/dproto.h".

Recently, lsof added a COPYING license file. See [1]. This commit was
first included in lsof version 4.97.0. We can now use this file.

The license file hash is updated due to formatting changes. As a side
note, the copyright year in source file was 1997 (see [2]), whereas in
the new license file it is 2002. Source files have different copyright
dates, and can be as old as 1994, for example in [3]. The rest of the
license text remains unchanged.

[1] https://github.com/lsof-org/lsof/commit/62dab61cae3ca9e4d41ec573ae5cda0c5689c326
[2] https://github.com/lsof-org/lsof/blob/4.98.0/dialects/linux/dproto.h#L9
[3] https://github.com/lsof-org/lsof/blob/4.98.0/arg.c#L7

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lsof/lsof.hash | 2 +-
 package/lsof/lsof.mk   | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
index b6a29b3cea..d9e85ac15c 100644
--- a/package/lsof/lsof.hash
+++ b/package/lsof/lsof.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  80308a614508814ac70eb2ae1ed2c4344dcf6076fa60afc7734d6b1a79e62b16  lsof-4.98.0.tar.gz
-sha256  32a728188b19bf86917659d904ab29d0a294b4506e1c98b8b7f1c70ab4975fe1  dialects/linux/dproto.h
+sha256  225222ff9bf38abc2cef7205e9b05c60935efa9ec28d1fd01e503c9316088718  COPYING
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 66911dddb9..66f346aa13 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -7,9 +7,7 @@
 LSOF_VERSION = 4.98.0
 LSOF_SITE = $(call github,lsof-org,lsof,$(LSOF_VERSION))
 LSOF_LICENSE = lsof license
-# License is repeated in each file, this is a relatively small one.
-# It is also defined in 00README, but that contains a lot of other cruft.
-LSOF_LICENSE_FILES = dialects/linux/dproto.h
+LSOF_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 LSOF_DEPENDENCIES += libtirpc
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
