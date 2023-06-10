Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92B7C77B7A
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 09:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73B5E40489;
	Sat, 10 Jun 2023 09:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73B5E40489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qr0Ou1XLy5Bl; Sat, 10 Jun 2023 09:30:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DF9040412;
	Sat, 10 Jun 2023 09:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DF9040412
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4E2C1BF3C5
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 09:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BE9560A6D
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 09:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BE9560A6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HmLic2QQV8qO for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 09:30:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D31F60A68
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D31F60A68
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 09:30:47 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout08.t-online.de (Postfix) with SMTP id DCA2E10243;
 Sat, 10 Jun 2023 11:30:44 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd79.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q7uvj-3PqX3p0; Sat, 10 Jun 2023 11:30:43 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:57098)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q7uvi-0002HD-39;
 Sat, 10 Jun 2023 11:30:43 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 11:30:42 +0200
Message-Id: <20230610093042.3292143-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686389443-42FF7266-C745B37B/0/0 CLEAN NORMAL
X-TOI-MSGID: 7273544d-ffdf-45d9-8b43-9230ec632c87
Subject: [Buildroot] [PATCH 1/1] package/{libuv,
 uvw}: bump to versions 1.45.0, 3.1.0_libuv_v1.45
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated license hashes due to upstream commits:
- various cleanups, parts of old license file was moved to LICENSE-extra
  https://github.com/libuv/libuv/commits/v1.x/LICENSE
- copyright year bump
  https://github.com/skypjack/uvw/commit/68803053f42bb3b0e139a984837a5539e5da7fe6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libuv/libuv.hash | 5 +++--
 package/libuv/libuv.mk   | 4 ++--
 package/uvw/uvw.hash     | 4 ++--
 package/uvw/uvw.mk       | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index b0fa0ff5be..3ca184feaf 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,4 @@
 # Locally calculated
-sha256  e6e2ba8b4c349a4182a33370bb9be5e23c51b32efb9b9e209d0e8556b73a48da  libuv-1.44.2.tar.gz
-sha256  95b8b163c60d17cfce3cef61a2d8a9cf70137502c8fb5f3d93cd2fc529fa98c8  LICENSE
+sha256  458e34d5ef7f3c0394a2bfd8c39d757cb1553baa5959b9b4b45df63aa027a228  libuv-1.45.0.tar.gz
+sha256  16de0c32b265cb7d46a6d3bd614f259dd4d693a5e26b3407b04aae8d73041f0c  LICENSE
+sha256  262c44bd2cdba037e6d2a82fba15f5800d292bc993a6f5d6b6ea487744d02836  LICENSE-extra
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index c169b76a6a..640c5bb1ce 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -6,13 +6,13 @@
 
 # When bumping libuv, check if a new version of uvw is available
 # and bump it too.
-LIBUV_VERSION = 1.44.2
+LIBUV_VERSION = 1.45.0
 LIBUV_SITE = $(call github,libuv,libuv,v$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
 LIBUV_AUTORECONF = YES
 LIBUV_LICENSE = BSD-2-Clause, BSD-3-Clause, ISC, MIT
-LIBUV_LICENSE_FILES = LICENSE
+LIBUV_LICENSE_FILES = LICENSE LICENSE-extra
 LIBUV_CPE_ID_VENDOR = libuv
 
 # Upstream needs tests to be run sequentially. This is the default in
diff --git a/package/uvw/uvw.hash b/package/uvw/uvw.hash
index a0c74bbe05..8e54ea7d60 100644
--- a/package/uvw/uvw.hash
+++ b/package/uvw/uvw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3460842778e91e7d2fae4201e49e4521e9d94fbbf3891ae6c52d3c9fc0673598  uvw-2.12.1_libuv_v1.44.tar.gz
-sha256  1e3b8fb895c0396aaa2138ff82c02968524e220645b21b0a4ac765858a898732  LICENSE
+sha256  0a612bd243150fbbe1365cdaf48203d32061c1d14f93825a31876b183922f93b  uvw-3.1.0_libuv_v1.45.tar.gz
+sha256  e2a4062818ab05e2a0908737ad49b7c01202247364e900167ac81105de8713f3  LICENSE
diff --git a/package/uvw/uvw.mk b/package/uvw/uvw.mk
index b6c2135d6f..364a2eded4 100644
--- a/package/uvw/uvw.mk
+++ b/package/uvw/uvw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UVW_VERSION = 2.12.1_libuv_v1.44
+UVW_VERSION = 3.1.0_libuv_v1.45
 UVW_SITE = $(call github,skypjack,uvw,v$(UVW_VERSION))
 UVW_INSTALL_STAGING = YES
 UVW_INSTALL_TARGET = NO
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
