Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA74C41535
	for <buildroot@archiver.kernel.org>; Tue, 19 Dec 2023 19:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2DE760BD1;
	Tue, 19 Dec 2023 19:10:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2DE760BD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rgAQ9F-H2CG0; Tue, 19 Dec 2023 19:10:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B98960BDE;
	Tue, 19 Dec 2023 19:10:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B98960BDE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D50981BF5B4
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 19:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACD6541DA8
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 19:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACD6541DA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ziVunCQE3q2 for <buildroot@lists.busybox.net>;
 Tue, 19 Dec 2023 19:10:30 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CE6240915
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 19:10:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CE6240915
Received: from fli4l.lan.fli4l (p5b3a0598.dip0.t-ipconnect.de [91.58.5.152])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ED327A4C0296;
 Tue, 19 Dec 2023 20:10:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59982)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rFfU2-0001wa-1D;
 Tue, 19 Dec 2023 20:10:26 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 19 Dec 2023 20:10:26 +0100
Message-Id: <20231219191026.47158-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1703013026;
 bh=F4yzqzcFWUQhLAqtHh7pkZKkcWFiEoMIVzFQIjf2jrI=;
 h=From:To:Cc:Subject:Date:From;
 b=Sb4pmQEnljUd5tMeDRv6/vkXsC7isq11Ry6qh6VtbCKesKL7TdGANm8YB1fdtb3Kq
 TgmvbkNDwpHRCcEMwXJAjQGyDE6pCuNN6iODwIXF2C7ta21GtvJgTtzX/QYl2P6WtS
 a3cCg4oEf6Lx5ISlEUS7b03vdYcytyXjR0S/hRPxyxpS0JHriYS1L7YLsPMm1ABXRb
 c15qUkliANt8us61BWCNElIC/trdCa3LM40oSp47iAl/xhsF0P+dbQ8ZhMPqXtfCVF
 gw3Jr4bH2p49qlaMblLFW35PgyRq5SpJUskmo5NAvHRJfnedEAnd5I3KcgKyvlmVfy
 eyrXbIVCIavWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=Sb4pmQEn
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 23.3.1
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 5 +++--
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 3bc12ca86e..29a6633132 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 23.2.1
+MESA3D_HEADERS_VERSION = 23.3.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 0f4ca05831..41835de461 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,4 +1,5 @@
-# From https://gitlab.freedesktop.org/mesa/mesa/-/blob/23.2/docs/relnotes/23.2.1.rst
-sha256  64de0616fc2d801f929ab1ac2a4f16b3e2783c4309a724c8a259b20df8bbc1cc  mesa-23.2.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-dev/2023-December/226085.html
+sha256  6e48126d70fdb3f20ffeb246ca0c2e41ffdc835f0663a03d4526b8bf5db41de6  mesa-23.3.1.tar.xz
+sha512  0861fb5083e37439ad8cc0a0d8372a7c84d8665ea298dc784e2dd893162e20ae072f5ef0b860be88ecf74bc123714acbc1dec312e139b892ff40ef1887c5f4a5  mesa-23.3.1.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 6d92eb56f3..993bb90a87 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 23.2.1
+MESA3D_VERSION = 23.3.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
