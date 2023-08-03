Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9371C001DF
	for <buildroot@archiver.kernel.org>; Thu,  3 Aug 2023 04:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38A5A80B2C;
	Thu,  3 Aug 2023 04:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38A5A80B2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IThz3ifZzes8; Thu,  3 Aug 2023 04:13:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 638A580B08;
	Thu,  3 Aug 2023 04:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 638A580B08
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8D5E1BF2FD
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 04:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1E6C401F3
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 04:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1E6C401F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y4CDpNxN3Be2 for <buildroot@lists.busybox.net>;
 Thu,  3 Aug 2023 04:13:14 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C97640004
 for <buildroot@buildroot.org>; Thu,  3 Aug 2023 04:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C97640004
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BA250A4C00F9;
 Thu,  3 Aug 2023 06:13:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40840)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qRPi4-0001Oo-1T;
 Thu, 03 Aug 2023 06:13:12 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  3 Aug 2023 06:13:12 +0200
Message-Id: <20230803041312.33933-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691035992;
 bh=j/W7tGbihdJAP5wNiz0FZ3XmV41zkcwyuLutkiN1LlI=;
 h=From:To:Cc:Subject:Date:From;
 b=stPjAmYygdXTwJ4Iv7P2mYZAscFf8IFnhqMG3uM0DaignIshzfRn0RHcyyAlqZaPl
 flHcmyYfTlbEMCr8XsDgJfqmrw1YyxhZUO/Z8BtbsmaxvA4uuE+3BkBhOwjFauA8yh
 rWg+q3R7o+Z54dCHtiSxyqx+On5Kmj7CfHXDU2JiLgyoiwqQgcISJ4VkaOIauFm1oa
 VYkVqDjsH458i7VIYzwZckz0MZJA2GNONbgy3PoRgz2dvczVsHdqyYwB99yiyvCITN
 QjrMt0EX5cYNCm+Qv+9qM4VH/R3kvxW1c1K7X4cOxRkX5du/992FVH3LSMhLMBazZe
 pQdNvzxNJLm8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=stPjAmYy
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 23.1.5
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2023-August/000726.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index b101394869..e602953a3f 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 23.1.4
+MESA3D_HEADERS_VERSION = 23.1.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 60c3bd6d5d..3606cca56d 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2023-July/000724.html
-sha256  7261a17fb94867e3dc5a90d8a1f100fa04b0cbbde51d25302c0872b5e9a10959  mesa-23.1.4.tar.xz
-sha512  4063c7848f507b5e25cfc862394268147254b90c9f3eb19035cce338b0a9cb611b7380c1c73f0e4feeddde68124225df7dee7b9db5f019603dfde2b88ff46a21  mesa-23.1.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2023-August/000726.html
+sha256  3cf88576fdebf24fc4047067936131c90cb6541c27365996b79b661dec1fb153  mesa-23.1.5.tar.xz
+sha512  c5eac5a497561374eaf931214aebc9001820c5ab49f9b8c5634b62af081b03b2f21c169c936524b2953c8815eb27dfb5c8c12276b9b1c119722cd6fea0b22d85  mesa-23.1.5.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index eae5c5c504..1f42c9d703 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 23.1.4
+MESA3D_VERSION = 23.1.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
