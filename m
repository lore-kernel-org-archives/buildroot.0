Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B54FC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 19:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB3DA615BB;
	Fri,  5 Jan 2024 19:49:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB3DA615BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yUVstytEO20r; Fri,  5 Jan 2024 19:49:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10F42615B8;
	Fri,  5 Jan 2024 19:49:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10F42615B8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 657FA1BF841
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 19:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E3F2615B8
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 19:49:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E3F2615B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JGZ6nyLMjZ4m for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 19:49:04 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD15C615B7
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 19:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD15C615B7
Received: from fli4l.lan.fli4l (p5b3a0630.dip0.t-ipconnect.de [91.58.6.48])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3B0B6A4C07F3;
 Fri,  5 Jan 2024 20:49:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40748)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rLqBg-000000001l3-3rRO;
 Fri, 05 Jan 2024 20:49:00 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  5 Jan 2024 20:49:00 +0100
Message-Id: <20240105194900.2400237-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1704484141;
 bh=5g7CrhnvazZn+XfbjMGdoSh6pIVNUwMafD2XWnA8xhs=;
 h=From:To:Cc:Subject:Date:From;
 b=w98vza3j8RdomO+M+Nw5Ugk5B7bCP7v3ciVJLtHVkZMs2pQq9GIlpojojOT2kAufG
 jcABeGOYzJ+jPYN1ysfhcLTL7ennCN1awpwNE1bMBkmatmEoNiLKkZ6oRzT/Cpo7Jv
 9sPke6AtHpwTmbisYufhDBxHZ0ga0PdGUW3qtC55sa51kENbSqm4Y5tLx9A3B6BFEO
 MqfwctZzPsZ8dVomFu5QtHFca8qQrBHmAeXzHf3KhGZg1v/LF778/a78riXznJt0rJ
 OqJYAByKRR8F5L6118P7h2o2z/vW/mAElnPk3R041Sl2CCCYA6juAmdJbIUnd9J8Ls
 68AbbjcshtU5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=w98vza3j
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 23.3.2
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
https://lists.freedesktop.org/archives/mesa-announce/2023-December/000741.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 29a6633132..8e870ac030 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 23.3.1
+MESA3D_HEADERS_VERSION = 23.3.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 41835de461..b6c36f1c55 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-dev/2023-December/226085.html
-sha256  6e48126d70fdb3f20ffeb246ca0c2e41ffdc835f0663a03d4526b8bf5db41de6  mesa-23.3.1.tar.xz
-sha512  0861fb5083e37439ad8cc0a0d8372a7c84d8665ea298dc784e2dd893162e20ae072f5ef0b860be88ecf74bc123714acbc1dec312e139b892ff40ef1887c5f4a5  mesa-23.3.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2023-December/000741.html
+sha256  3cfcb81fa16f89c56abe3855d2637d396ee4e03849b659000a6b8e5f57e69adc  mesa-23.3.2.tar.xz
+sha512  634d2b67ade2121de3f19f2cccd4bf7ceb2ac391b9366587ed1c2412444e010de8ec14a25529fdec1f43f943096422eb23cefcb8a89d2f8b20286850188b65c3  mesa-23.3.2.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 993bb90a87..30e4b385dd 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 23.3.1
+MESA3D_VERSION = 23.3.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
