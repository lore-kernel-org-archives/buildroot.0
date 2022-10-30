Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9D7ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 21:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53401402DC;
	Sun, 30 Oct 2022 21:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53401402DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8poUimvk8bf2; Sun, 30 Oct 2022 21:38:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EDE340239;
	Sun, 30 Oct 2022 21:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EDE340239
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 893501BF315
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63905400DC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63905400DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o-YqUuqGeagV for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 21:37:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4315C400CE
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4315C400CE
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 21:37:57 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout04.t-online.de (Postfix) with SMTP id 7492F524E;
 Sun, 30 Oct 2022 22:37:54 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.145]) by fwd73.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1opG00-26mxEH0; Sun, 30 Oct 2022 22:37:44 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:54390)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1opFzz-0001g0-32;
 Sun, 30 Oct 2022 22:37:44 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 22:37:43 +0100
Message-Id: <20221030213743.943645-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667165864-17FE898D-36F03D12/0/0 CLEAN NORMAL
X-TOI-MSGID: cc4c442b-da78-4ee2-be6a-9166e45310f4
Subject: [Buildroot] [PATCH 1/1] package/{libuv,
 uvw}: bump to versions 1.44.2, 2.12.1_libuv_v1.44
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

- libuv
  Release notes:
  https://github.com/libuv/libuv/issues/3452
  https://github.com/libuv/libuv/issues/3522
  https://github.com/libuv/libuv/issues/3586

  Updated license hash due to various commits regarding Android/Windows.

- uvw:
  Updated license hash due to copyright year bump:
  https://github.com/skypjack/uvw/commit/cca65db1f4a6ba74cb51f77754cd1f8ce64d9d63

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libuv/libuv.hash | 4 ++--
 package/libuv/libuv.mk   | 2 +-
 package/uvw/uvw.hash     | 4 ++--
 package/uvw/uvw.mk       | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 1874aa344c..b0fa0ff5be 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9e27825a55279de69a7c43e42d509fd1337c9bece2547c761e91a1592e91cc4d  libuv-1.43.0.tar.gz
-sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
+sha256  e6e2ba8b4c349a4182a33370bb9be5e23c51b32efb9b9e209d0e8556b73a48da  libuv-1.44.2.tar.gz
+sha256  95b8b163c60d17cfce3cef61a2d8a9cf70137502c8fb5f3d93cd2fc529fa98c8  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index ed51fc92f9..c169b76a6a 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -6,7 +6,7 @@
 
 # When bumping libuv, check if a new version of uvw is available
 # and bump it too.
-LIBUV_VERSION = 1.43.0
+LIBUV_VERSION = 1.44.2
 LIBUV_SITE = $(call github,libuv,libuv,v$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
diff --git a/package/uvw/uvw.hash b/package/uvw/uvw.hash
index 564c0980f3..a0c74bbe05 100644
--- a/package/uvw/uvw.hash
+++ b/package/uvw/uvw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3af4efa2842299490ec764f2148f85f4426dfb4f8d8aa436cc2d049db2b7b514  uvw-2.11.0_libuv_v1.43.tar.gz
-sha256  5de32af2469480cf3261c9781962e0887366666ba8ee1f4a32c386c77fc50c88  LICENSE
+sha256  3460842778e91e7d2fae4201e49e4521e9d94fbbf3891ae6c52d3c9fc0673598  uvw-2.12.1_libuv_v1.44.tar.gz
+sha256  1e3b8fb895c0396aaa2138ff82c02968524e220645b21b0a4ac765858a898732  LICENSE
diff --git a/package/uvw/uvw.mk b/package/uvw/uvw.mk
index 161c40849d..b6c2135d6f 100644
--- a/package/uvw/uvw.mk
+++ b/package/uvw/uvw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UVW_VERSION = 2.11.0_libuv_v1.43
+UVW_VERSION = 2.12.1_libuv_v1.44
 UVW_SITE = $(call github,skypjack,uvw,v$(UVW_VERSION))
 UVW_INSTALL_STAGING = YES
 UVW_INSTALL_TARGET = NO
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
