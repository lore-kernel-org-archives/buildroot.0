Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01845EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 16:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86E0E60BC7;
	Sun, 20 Aug 2023 16:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86E0E60BC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yILWf0VZwdtz; Sun, 20 Aug 2023 16:57:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE3B860B3C;
	Sun, 20 Aug 2023 16:57:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE3B860B3C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B08D1BF373
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 16:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E895E4013F
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 16:57:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E895E4013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RGTpWjdmWsEP for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 16:57:05 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 003CB40017
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 16:57:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 003CB40017
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 14D5713F8CB;
 Sun, 20 Aug 2023 18:57:01 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 18:56:54 +0200
Message-ID: <20230820165654.275913-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692550622;
 bh=lICnCbihWzPumb9yd84b8sQEWtgRjRxYS1gI1Ug+vBg=;
 h=From:To:Cc:Subject:Date:From;
 b=VLgaFTZN5Yd141fYipxq9gxUDzZTCugfpImlua45wj85B8L4yEMFQKSz+wYi1scXn
 IQpqg2ajxw68R18WhIV4b59paoCWOBVyoFQbrZ7Hz5rhhqwsdIrcy8Gd17g21mx6Ki
 hF6A/SRTznKlCNTRn4EDXj1DbFMbwJpzxQalvlMHUBq3ODbST3pXh/A/EnXRphDztx
 g0OxXCTHbIYtG5Wv8SsfpBD5YiOUjNXMahDWJGTp2+fj1y6+9yo2iCFmQKzeZyI0Kv
 f8yu180ZFMtG8Evym3TL/5dRFI5ihsNaTQJTltw5urKNDisbt1TBQH0ZF0o2aRgsIS
 KUKkx91OF3Mig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VLgaFTZN
Subject: [Buildroot] [PATCH next 1/1] package/octave: bump package to
 version 8.3.0
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

See release note:
https://octave.org/news/release/2023/08/08/octave-8.3.0-released.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch next at commit bf2d7f8 with commands:

    utils/test-pkg -p octave
    ...
    6 builds, 4 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_octave
    ...
    OK
---
 package/octave/octave.hash | 4 ++--
 package/octave/octave.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/octave/octave.hash b/package/octave/octave.hash
index 6e82a589ec..a655f82849 100644
--- a/package/octave/octave.hash
+++ b/package/octave/octave.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-# https://ftp.gnu.org/gnu/octave/octave-8.2.0.tar.lz.sig
+# https://ftp.gnu.org/gnu/octave/octave-8.3.0.tar.lz.sig
 # using key DBD9C84E39FE1AAE99F04446B05F05B75D36644B
-sha256  8ac875a9f8e44b8eb4b75ca8638531e2ca47cd9d13a6ca39d3a0eccd175f8a05  octave-8.2.0.tar.lz
+sha256  4dbd5da711b20ce640d75471895172b60e0bb9f45b75a0daa5ddf3050488d639  octave-8.3.0.tar.lz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index 81954bbdd3..86f5564c02 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OCTAVE_VERSION = 8.2.0
+OCTAVE_VERSION = 8.3.0
 OCTAVE_SITE = https://ftp.gnu.org/gnu/octave
 OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.lz
 OCTAVE_LICENSE = GPL-3.0+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
