Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88203C4332F
	for <buildroot@archiver.kernel.org>; Mon, 13 Nov 2023 20:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1148B41C0B;
	Mon, 13 Nov 2023 20:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1148B41C0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hjEPvqP6oj98; Mon, 13 Nov 2023 20:54:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51DE341BD5;
	Mon, 13 Nov 2023 20:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51DE341BD5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 963EA1BF390
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 20:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6ED6141BD5
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 20:54:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ED6141BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1TluJiDTeYlU for <buildroot@lists.busybox.net>;
 Mon, 13 Nov 2023 20:54:00 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4199D41A2A
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 20:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4199D41A2A
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C745C13F89A;
 Mon, 13 Nov 2023 21:53:55 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 13 Nov 2023 21:53:50 +0100
Message-ID: <20231113205350.922873-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699908837;
 bh=WRP4aA5+UwATAXsU7zS6qWZVTFWlD+J4XiLFg0fbhaM=;
 h=From:To:Cc:Subject:Date:From;
 b=kX0N21vB/KzipDOw7GewGqrhiCm0VAy8yfgtBpyKKubHINMJCc/hLY90kfJMnF3jG
 4wQeePpo03uXOyW/O99Xg9jbmXQpQKW+Q8Mu2lcqUWFUoPWSN1CsAGYCT7zmgNkE5I
 +scGU5Pk1vVeRGj7Sf9WnJdR3r1vxnJ3h/zrrHDWDVLmbuTFpB9r9RWRpshV0Nwei0
 D9nC0W/vmdsmLk8ogsIrBJXNLQEJT4KEk+OzKuFgTjdLcrulWM5Vo8avnx9vK1Z7/U
 BfcLncSP0Mda7M9Sic48tWNvr+qms6kpP+b+VNbt2lOJ5Dw4cLEz1Egl0OulP/sxdk
 N/SbL3RLoxogQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kX0N21vB
Subject: [Buildroot] [PATCH 1/1] package/octave: bump package to version
 8.4.0
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
https://octave.org/news/release/2023/11/05/octave-8.4.0-released.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 3b65462, with commands:

    utils/docker-run make check-package
    ...
    0 warnings generated

    utils/test-pkg -p octave
    ...
    6 builds, 4 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

    support/testing/run-tests \
        -d dl \
        -o output_folder \
        tests.package.test_octave
    ...
    OK
---
 package/octave/octave.hash | 4 ++--
 package/octave/octave.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/octave/octave.hash b/package/octave/octave.hash
index a655f82849..20ee4ddb64 100644
--- a/package/octave/octave.hash
+++ b/package/octave/octave.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-# https://ftp.gnu.org/gnu/octave/octave-8.3.0.tar.lz.sig
+# https://ftp.gnu.org/gnu/octave/octave-8.4.0.tar.lz.sig
 # using key DBD9C84E39FE1AAE99F04446B05F05B75D36644B
-sha256  4dbd5da711b20ce640d75471895172b60e0bb9f45b75a0daa5ddf3050488d639  octave-8.3.0.tar.lz
+sha256  d5a7e89928528dce8cab7eead700be8a8319a98ec5334cc2ce83d29ac60264c1  octave-8.4.0.tar.lz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index 86f5564c02..cae0de7620 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OCTAVE_VERSION = 8.3.0
+OCTAVE_VERSION = 8.4.0
 OCTAVE_SITE = https://ftp.gnu.org/gnu/octave
 OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.lz
 OCTAVE_LICENSE = GPL-3.0+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
