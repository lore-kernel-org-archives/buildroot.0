Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B0CC25B7D
	for <buildroot@archiver.kernel.org>; Wed, 16 Aug 2023 20:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE5E1613C9;
	Wed, 16 Aug 2023 20:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE5E1613C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kWIm0dfLMdGm; Wed, 16 Aug 2023 20:21:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8A5A61336;
	Wed, 16 Aug 2023 20:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8A5A61336
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A8061BF381
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 20:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F56841730
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 20:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F56841730
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P2vBKUr7yBRE for <buildroot@lists.busybox.net>;
 Wed, 16 Aug 2023 20:21:49 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FDE2400EF
 for <buildroot@buildroot.org>; Wed, 16 Aug 2023 20:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FDE2400EF
Received: from fli4l.lan.fli4l (p4fd6c625.dip0.t-ipconnect.de [79.214.198.37])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 79AA2A4C0824;
 Wed, 16 Aug 2023 22:21:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40346)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qWN1X-0006OM-0o;
 Wed, 16 Aug 2023 22:21:47 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 16 Aug 2023 22:21:47 +0200
Message-Id: <20230816202147.1790367-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1692217307;
 bh=hgQad15U81YbtTGTngk40T7a4Jnx0GEr1Bx9J1jSEEA=;
 h=From:To:Cc:Subject:Date:From;
 b=IMBu8myJ6hpVxXBGdjj24dMlVNu8AUoSU9kp0BBTH35u5vwNwKw9AqwhUG1d6H9Nz
 qKItIHi73Qz+FYw4mroEGb1V1jEi80o1AL5Xc/ISlgZ7wuTgVwRbJ94jSwDKi5wmdk
 mG99MNcDC3fmXYU6GX3ut6IlhRh+k4sMSEtiMU45NIIMSgsTEuU2E5PiMlCc9AGhUS
 Z7zmdtoU8/yaHUSn/IpzEhqGCfYKkZRkL9rcgNH3Vgoc3FSVA07hM4fjki4E2RyO6v
 OMNlqHZG2P0WDo4E6UBxuGTBbwOCrQz8IEFy8A256xygBM02zNIc+vm5kMNSPr6KLo
 mn6KZyN7Txuhg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=IMBu8myJ
Subject: [Buildroot] [PATCH/next 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 23.1.6
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
https://lists.freedesktop.org/archives/mesa-announce/2023-August/000727.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index e602953a3f..5dbf984735 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 23.1.5
+MESA3D_HEADERS_VERSION = 23.1.6
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 3606cca56d..95133d3de9 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2023-August/000726.html
-sha256  3cf88576fdebf24fc4047067936131c90cb6541c27365996b79b661dec1fb153  mesa-23.1.5.tar.xz
-sha512  c5eac5a497561374eaf931214aebc9001820c5ab49f9b8c5634b62af081b03b2f21c169c936524b2953c8815eb27dfb5c8c12276b9b1c119722cd6fea0b22d85  mesa-23.1.5.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2023-August/000727.html
+sha256  f4c7fd8e7b472a88da7d83e9a48f6f3bd17d4ea2cc4386f7231b796f3964157a  mesa-23.1.6.tar.xz
+sha512  24f1c626fa05a82bcdfb24b67b8e5f96f94d5748309631b83e8d7a62142853cd3be90b92c56bac3bc4d223bf40b424d6d6a9977537b899107295b7d45d7e2575  mesa-23.1.6.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index add9232d2f..8f3d224417 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 23.1.5
+MESA3D_VERSION = 23.1.6
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
