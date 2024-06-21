Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2032C27C78
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 21:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 882036062C;
	Fri, 21 Jun 2024 21:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPsZkLv7Rbfd; Fri, 21 Jun 2024 21:45:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 885A6607BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 885A6607BA;
	Fri, 21 Jun 2024 21:45:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 341761BF834
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 21:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D6B6842A1
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 21:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UXYykXN5HJWQ for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 21:44:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E592283AEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E592283AEB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E592283AEB
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 21:44:56 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A0A29B00535;
 Fri, 21 Jun 2024 23:44:52 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 21 Jun 2024 23:44:47 +0200
Message-ID: <20240621214447.479094-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719006293;
 bh=8JYdf4Fl9bNXlMwiYEBwlPuIVkZx8bCNA0rDiABJTZ8=;
 h=From:To:Cc:Subject:Date:From;
 b=sL/RXTKnd9lIhMMbdbcLabQV1BnfraXS5dmWAD5kyosBu6DfVld1Ic9wQDwMdvW3P
 uXU8kLyF/t1Bt4FIPOMkwXXFCahrG0Pqe5C3H3EudGGyRRT3iXYHYgbq21yq/Ie37Y
 eiFZg10uvVT8FkNiQvDY/ExoKw/oJ9laogW1f4HdA8Flqu+AGnmSHfBHYPGMzCKbFn
 uH2NNXcJSKQLUTBu/PUVP7KY7a14agwbcyDbyZjFIPux+9HT0DpmOXw+2odVcoMLz/
 vbhI2wvwT8SgsB28rFLbdMpQhBtQIsg0woHsckeP7c7Xb3dM6oY4RcRme3BV/NCqFA
 4DThYl+WEBSCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sL/RXTKn
Subject: [Buildroot] [PATCH 1/1] package/highway: bump to version 1.2.0
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

For release note, see:
- https://github.com/google/highway/releases/tag/1.2.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 4aff617 with commands:

    utils/docker-run make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_highway
    ...
    OK

    utils/test-pkg -p highway
    ...
    6 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/highway/highway.hash | 2 +-
 package/highway/highway.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/highway/highway.hash b/package/highway/highway.hash
index 270131134ec..5addf50eee7 100644
--- a/package/highway/highway.hash
+++ b/package/highway/highway.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  354a8b4539b588e70b98ec70844273e3f2741302c4c377bcc4e81b3d1866f7c9  highway-1.1.0.tar.gz
+sha256  7e0be78b8318e8bdbf6fa545d2ecb4c90f947df03f7aadc42c1967f019e63343  highway-1.2.0.tar.gz
 sha256  43070e2d4e532684de521b885f385d0841030efa2b1a20bafb76133a5e1379c1  LICENSE
 sha256  d25e82e26acd42ca3ccc9993622631163425b869b9e16284226d534cff6470f2  LICENSE-BSD3
diff --git a/package/highway/highway.mk b/package/highway/highway.mk
index 3eb0d7a4aa2..a74bc90dd36 100644
--- a/package/highway/highway.mk
+++ b/package/highway/highway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIGHWAY_VERSION = 1.1.0
+HIGHWAY_VERSION = 1.2.0
 HIGHWAY_SITE = $(call github,google,highway,$(HIGHWAY_VERSION))
 HIGHWAY_LICENSE = Apache-2.0 or BSD-3-Clause
 HIGHWAY_LICENSE_FILES = LICENSE LICENSE-BSD3
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
