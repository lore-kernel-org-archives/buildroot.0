Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EA2C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 21:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AAEF40283;
	Thu, 11 Jul 2024 21:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A3QN7K_4Obls; Thu, 11 Jul 2024 21:23:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41DC241150
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41DC241150;
	Thu, 11 Jul 2024 21:23:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 716771BF5F5
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 21:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E7AA415DB
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 21:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tyDVsAQoI1u1 for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 21:23:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 20181415D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20181415D7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20181415D7
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 21:23:19 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7D526B00565;
 Thu, 11 Jul 2024 23:23:14 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 23:22:52 +0200
Message-ID: <20240711212252.1066713-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1720732996;
 bh=hYkQRo4Nyjq+afBmlNs4pnWBvaLTdmb2z3cr8OdIApg=;
 h=From:To:Cc:Subject:Date:From;
 b=LYaV3r6rbslR8jNCau5ERzSDQZ2xxX+BjIfNxodtC14iZueo6MhVGqK4xDmZZjBav
 BrTCZa3F3kpWHDaosb03q4KRyWpYh+YTkylf4Hogz8LoOeQ+uv6jRjfwIxZ6aEdpgQ
 sgrdncjj6I+npXtgR36KjKAcxqzMUI9R99T6atI0TxAnw4epy6NZLdmiWscd+mUmI0
 FHGcMQUzfJfTd4dtdkelVnq/sMTMy84gVmWU2AcTSjFhGhINahy4n6H/aamREFcGie
 PvMP617TyuAU5HA4LcVYHQ+bmywRWjgH2JGCAq9vxOmnvFoYlqlPXCX2gIqQiRZWRG
 IWHKJ3bLU1rYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LYaV3r6r
Subject: [Buildroot] [PATCH 1/1] package/pciutils: bump version to 3.13.0
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 3.10.0, see:
https://git.kernel.org/pub/scm/utils/pciutils/pciutils.git/tree/ChangeLog?h=v3.13.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 63b4cba with commands:

    utils/docker-run make check-package
    ...
    0 warnings generated

    utils/test-pkg -p pciutils
    ...
    6 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_pciutils
    ...
    OK
---
 package/pciutils/pciutils.hash | 2 +-
 package/pciutils/pciutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pciutils/pciutils.hash b/package/pciutils/pciutils.hash
index 2ac28d327b..f6a3f9eef6 100644
--- a/package/pciutils/pciutils.hash
+++ b/package/pciutils/pciutils.hash
@@ -1,3 +1,3 @@
 # From https://www.kernel.org/pub/software/utils/pciutils/sha256sums.asc
-sha256  238a2e27166730e53a17fe07bfad229e07fa39b618117e5944b6d7eda9fbb0e9  pciutils-3.10.0.tar.xz
+sha256  77f11f78298502634d1af50308f15a5788629f6cf45cba376f5009aea4cb4926  pciutils-3.13.0.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index a6708ce94b..ea3c21db6a 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCIUTILS_VERSION = 3.10.0
+PCIUTILS_VERSION = 3.13.0
 PCIUTILS_SITE = $(BR2_KERNEL_MIRROR)/software/utils/pciutils
 PCIUTILS_SOURCE = pciutils-$(PCIUTILS_VERSION).tar.xz
 PCIUTILS_INSTALL_STAGING = YES
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
