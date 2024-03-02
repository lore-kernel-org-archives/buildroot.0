Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C111C54798
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 14:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D6526071B;
	Sat,  2 Mar 2024 14:05:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U-R9R_eGtRAL; Sat,  2 Mar 2024 14:05:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B67A660813
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B67A660813;
	Sat,  2 Mar 2024 14:05:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F26051BF5B4
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 14:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0F09418AE
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 14:04:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DEermvCKKdqF for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 14:04:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AA21141898
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA21141898
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA21141898
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 14:04:57 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4C8C6B0056A;
 Sat,  2 Mar 2024 15:04:53 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  2 Mar 2024 15:04:45 +0100
Message-ID: <20240302140445.1409490-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709388294;
 bh=GZRnvMnKFOXEO9pEOHKmC7LSPiGray7Cl/IoRpi0xNk=;
 h=From:To:Cc:Subject:Date:From;
 b=tSBf3RR72lTibmshjabP2u0DzhtkANI8pcn/pHLOUge0EOoDPkSu1EFCe0mdfBDsc
 ZKFCnAsWw4jHh9ndjEfBpeMnWURedXBiFvWw7tXqyfZJvbR2onhg2aahHjQzSU6GPd
 Q0uQMHx7YMVgxdRjPV2UY/dGqZsKWsj6QJmxtgsM7TwpUKiDAuU5AVQqO436MKT0OC
 kEZw3aLxt4fx6WsAZtgWqG4JmziViVw/NX1XkRMGoq2qNUZNyXBIaheGz/IJc3GDfH
 DbJZEVYO7NRVpACo/FBdxJAVwo5X1Xhns5BR4i7MM9LQBHPAVW21gfRHbpY49QR/fg
 TcWMfzh0lK1PQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tSBf3RR7
Subject: [Buildroot] [PATCH 1/1] package/libjxl: bump to version 0.10.1
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

For release notes since v0.9.0, see:
- https://github.com/libjxl/libjxl/releases/tag/v0.10.1
- https://github.com/libjxl/libjxl/releases/tag/v0.10.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 2bfad95 with commands:

    make check-package
    ...
    OK

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_libjxl
    ...
    OK
---
 package/libjxl/libjxl.hash | 2 +-
 package/libjxl/libjxl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libjxl/libjxl.hash b/package/libjxl/libjxl.hash
index 0766c24a538..40ffd0f5b53 100644
--- a/package/libjxl/libjxl.hash
+++ b/package/libjxl/libjxl.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  d83bbe188d8fa9725bb75109c922c37fcff8c3b802808f3a6c2c14aaf8337d9f  libjxl-0.9.0.tar.gz
+sha256  91b9a83a230d608b5d35d2ab5068bd0ec7028797575e3013211be5928028c8cd  libjxl-0.10.1.tar.gz
 sha256  8405932022a556380c2d8c272eff154a923feb197233f348ce5f7334fb0a5ede  LICENSE
 sha256  91915f8ae056a68a3c5bdf05d9f6f78bb6903e27a8ca3a8434c9e4ac87300575  PATENTS
diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
index 4072633ffe1..4cb71d5e71f 100644
--- a/package/libjxl/libjxl.mk
+++ b/package/libjxl/libjxl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBJXL_VERSION = 0.9.0
+LIBJXL_VERSION = 0.10.1
 LIBJXL_SITE = $(call github,libjxl,libjxl,v$(LIBJXL_VERSION))
 LIBJXL_LICENSE = BSD-3-Clause
 LIBJXL_LICENSE_FILES = LICENSE PATENTS
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
