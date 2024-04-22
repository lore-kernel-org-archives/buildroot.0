Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90786C4345F
	for <buildroot@archiver.kernel.org>; Mon, 22 Apr 2024 19:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47DF86070B;
	Mon, 22 Apr 2024 19:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RvS8gIjEBSrO; Mon, 22 Apr 2024 19:37:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 367EF6078D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 367EF6078D;
	Mon, 22 Apr 2024 19:37:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E38681BF31D
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 19:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD7FE40B82
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 19:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pvACHWdt3xsP for <buildroot@lists.busybox.net>;
 Mon, 22 Apr 2024 19:36:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 93E09404AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93E09404AF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93E09404AF
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 19:36:56 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2383FB0053D;
 Mon, 22 Apr 2024 21:36:50 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 22 Apr 2024 21:36:44 +0200
Message-ID: <20240422193645.405490-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1713814612;
 bh=d6YFEFS5QOW1Ucaj3c2HbZBu967vqLMlRz+kwmmlL/0=;
 h=From:To:Cc:Subject:Date:From;
 b=QXYzBKiDropNK5/6KCq00IX0fuoCXV2LUytkQwQ9A2cM321+AOW6OOfb9hzQVVmaZ
 e7OTqE1VUV+XV441ro5212zNk7vp/f1CscZf2xKZTPr2Od3cMHufFXsDUwvny/Op3v
 cZ4cdj6sFcsFWfh2+YENUBF0UG3TRRcgRwRqzeML4PBCsN5kGNRJDYAI+gKUL20+eU
 j8U54tUkeFPgV++7qOxYP6Hx9bi0W0UP0BjWab4fpuJwFluMfB0LJc4LsJxX6CuaBc
 /FjQP+nlR6QjzKTGlYV7miZuo1Zj+wCuA6hsqflsKy5VpPaf4EMx+HJMiSMuz72dxp
 Y6UOHZWCjPKoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QXYzBKiD
Subject: [Buildroot] [PATCH 1/1] package/ncdu: bump to version 1.20
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
Cc: Bogdan Radulescu <bogdan@nimblex.net>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 1.19, see:
- https://dev.yorhel.nl/ncdu/changes

The license hash changed: the years were removed. See:
https://code.blicky.net/yorhel/ncdu/commit/a9d608fab119bb98d57b0996f14498ec58bc79b9

This commit also adds the pgp signature check comment in the hash file.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 256aa8e with commands:

    make check-package
    ...
    0 warnings generated

    ./utils/test-pkg -p ncdu
    ...
    6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_ncdu.TestNcdu
    ...
    OK
---
 package/ncdu/ncdu.hash | 11 +++++++----
 package/ncdu/ncdu.mk   |  2 +-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
index 553e128ed10..cfb44b7d318 100644
--- a/package/ncdu/ncdu.hash
+++ b/package/ncdu/ncdu.hash
@@ -1,7 +1,10 @@
 # From https://dev.yorhel.nl/ncdu
-md5  7986451d5b222b8a99b5382f33a30831  ncdu-1.19.tar.gz
-sha1  3ee7aff60bdaa1c79eb4f27e3d277fc2d76e0043  ncdu-1.19.tar.gz
-sha256  30363019180cde0752c7fb006c12e154920412f4e1b5dc3090654698496bb17d  ncdu-1.19.tar.gz
+# After checking pgp signature from:
+# https://dev.yorhel.nl/download/ncdu-1.20.tar.gz.asc
+# With key 74460D32B80810EBA9AFA2E962394C698C2739FA
+md5  563966db4c3c34d61cc890a85ddedae0  ncdu-1.20.tar.gz
+sha1  1a3543cfbbe3e402d6347cf688468327064941b9  ncdu-1.20.tar.gz
+sha256  5fe2bb841abe72374bb242dbb93293c4ae053078432d896a7481b2ff10be9572  ncdu-1.20.tar.gz
 
 # computed locally
-sha256  40372b6016a489b69a5d198526e0a1c284680900f48a8b725de440452098a97b  COPYING
+sha256  a324e25fe6af7fa45286b34a516b4c5a11544344bc80efb74fc51033b2e76df4  COPYING
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index f14f61fec5f..cff824fd740 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NCDU_VERSION = 1.19
+NCDU_VERSION = 1.20
 NCDU_SITE = http://dev.yorhel.nl/download
 
 NCDU_DEPENDENCIES = ncurses
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
