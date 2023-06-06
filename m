Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2120C77B7A
	for <buildroot@archiver.kernel.org>; Tue,  6 Jun 2023 18:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76C2141AE9;
	Tue,  6 Jun 2023 18:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76C2141AE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hLMUDEjVODT5; Tue,  6 Jun 2023 18:49:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5598541B3E;
	Tue,  6 Jun 2023 18:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5598541B3E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B51B11BF95D
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 18:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BC8940B9F
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 18:49:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BC8940B9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OT4_WTH_Iyu4 for <buildroot@lists.busybox.net>;
 Tue,  6 Jun 2023 18:49:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E34A400FC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E34A400FC
 for <buildroot@buildroot.org>; Tue,  6 Jun 2023 18:49:38 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.204.57])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8125278050C;
 Tue,  6 Jun 2023 20:49:33 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  6 Jun 2023 20:49:27 +0200
Message-Id: <20230606184927.13877-1-ju.o@free.fr>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1686077375;
 bh=HFMpQBWusCC6qQLu4ZBWwePAOg25jBse0JPllVXmLh8=;
 h=From:To:Cc:Subject:Date:From;
 b=kNZqmHtoe9f+lAAYJdIguUoleEjdrNksthEQQhVbwKDxlvKkLKamELgWQ8BPQpBLt
 Y8pFC7UBinFKf3gMnmq6BTQnJA+/8gCKUCqIgzJ2T5sxsa1fI4p2h5A1dT6rOs4Q1L
 9TDbCh/zG7vWAItQQHx9fYhq9kkGgczDTjVXW/0P76y8a9a+QiuASnTvPlmtJQCt0O
 UpIWTc2zD3To1sLrCXXbhTatwvZsQtS1HSG/QhxYB/8vCi5Pzw9sJT3Od/ElwRNDKw
 cHgfm4iHYdI8G5vHWb3ygt3J8mr2s2a34q2iskcmn1giDkLceObnJGAQDepo0IIczA
 NTF9cGGNUbLwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kNZqmHto
Subject: [Buildroot] [PATCH 1/1] package/gnupg2: bump to version 2.4.2
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

See release announce:
https://lists.gnupg.org/pipermail/gnupg-announce/2023q2/000479.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 757251a with commands:

    utils/docker-run make check-package
    ...
    0 warnings generated

    utils/test-pkg -a -p gnupg2
    ...
    45 builds, 7 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

    support/testing/run-tests         
        -d dl -o output_folder \
        tests.package.test_gnupg2
    ...
    OK
---
 package/gnupg2/gnupg2.hash | 8 ++++----
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index baee824104..9585d36d9f 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,7 +1,7 @@
-# From  https://lists.gnupg.org/pipermail/gnupg-announce/2023q2/000478.html
-sha1  d7d021101361a5e1166a6c0cc1731276e7134547  gnupg-2.4.1.tar.bz2
+# From  https://lists.gnupg.org/pipermail/gnupg-announce/2023q2/000479.html
+sha1  3efd495a94dc81fd0ea8788bef6c69d1f13cedd7  gnupg-2.4.2.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.4.1.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.4.2.tar.bz2.sig
 # using key 6DAA6E64A76D2840571B4902528897B826403ADA
-sha256  76b71e5aeb443bfd910ce9cbc8281b617c8341687afb67bae455877972b59de8  gnupg-2.4.1.tar.bz2
+sha256  97eb47df8ae5a3ff744f868005a090da5ab45cb48ee9836dbf5ee739a4e5cf49  gnupg-2.4.2.tar.bz2
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index f7c7ae847c..760af3b05e 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.4.1
+GNUPG2_VERSION = 2.4.2
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
