Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85580C10F1B
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 21:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 051AC82056;
	Wed, 21 Dec 2022 21:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 051AC82056
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XE73FIcR0ad9; Wed, 21 Dec 2022 21:07:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4380E82055;
	Wed, 21 Dec 2022 21:07:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4380E82055
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A7BD31BF2F5
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 21:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83A7040364
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 21:07:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83A7040364
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4lhqC3pNw5ap for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 21:07:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3C3D40339
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3C3D40339
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 21:07:11 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout02.t-online.de (Postfix) with SMTP id 3D7B1180DF;
 Wed, 21 Dec 2022 22:07:08 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p86Iq-3eZkTx0; Wed, 21 Dec 2022 22:07:04 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:46524)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p86Iq-0006DR-1A;
 Wed, 21 Dec 2022 22:07:04 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 22:07:04 +0100
Message-Id: <20221221210704.1868595-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671656824-D8A4C9D3-D9C86B79/0/0 CLEAN NORMAL
X-TOI-MSGID: 0668cfb1-023d-4a04-83b1-85201db57f1e
Subject: [Buildroot] [PATCH 1/1] package/libcurl: security bump version to
 7.87.0
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

- CVE-2022-43551: Another HSTS bypass via IDN
  https://curl.se/docs/CVE-2022-43551.html

- CVE-2022-43552: HTTP Proxy deny use-after-free
  https://curl.se/docs/CVE-2022-43552.html

Changelog: https://curl.se/changes.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index c0e2378cac..230ec8d704 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-7.84.0.tar.xz.asc
+# https://curl.se/download/curl-7.87.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  2d61116e5f485581f6d59865377df4463f2e788677ac43222b496d4e49fb627b  curl-7.86.0.tar.xz
+sha256  ee5f1a1955b0ed413435ef79db28b834ea5f0fb7c8cfb1ce47175cc3bee08fff  curl-7.87.0.tar.xz
 sha256  321b1a09ebc30410f2e837c072e5521cf7095b757193af4a7dae1086e36ed31a  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 8de4358107..994b685d34 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.86.0
+LIBCURL_VERSION = 7.87.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
