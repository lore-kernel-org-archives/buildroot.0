Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC122C0015E
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 16:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64BBE41F7A;
	Thu, 27 Jul 2023 16:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64BBE41F7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g2ZKExU5q-7v; Thu, 27 Jul 2023 16:24:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 593F941F7F;
	Thu, 27 Jul 2023 16:24:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 593F941F7F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 49A311BF475
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 16:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 234A4400DA
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 16:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 234A4400DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7H4A5ybtVzcG for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 16:24:28 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DCB17400CC
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 16:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCB17400CC
Received: from fli4l.lan.fli4l (p54a1bcc1.dip0.t-ipconnect.de [84.161.188.193])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0F8CFA4C105D;
 Thu, 27 Jul 2023 18:24:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43018)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qP3mr-0001Uy-2j;
 Thu, 27 Jul 2023 18:24:25 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 18:24:25 +0200
Message-Id: <20230727162425.3304117-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690475066;
 bh=NLF/bsA1QikQJzu2qi9VL+Yzbtd6pmlxeg6zs9+FQ0E=;
 h=From:To:Cc:Subject:Date:From;
 b=ixkPHsPXkn0FtTkVyfFQlpQ+aN+UCtuCsMoF9tYGCYwFCKbbvSs+b5GKR4MslTpVJ
 CSsTJdx783Zu9esHVOqcODmUMhfId49WiZQQAXQ3vp3ZiixBqH9/GGBMUX3E7zdz14
 QtLQFADuud3wVihZtNPJQtP/H2ycCxDIE/gLUPQ0VcGh12fWEOkU4LYMWu8XlBD8U+
 pUZQb7W3xP4sFUJmuh7nXOdSSAujBLKDlgKwS+q/BQfnXrBySI0J18McsMmTB4VEDH
 WQ37TQT19Pjy3dIA1BLvW9Rid++upt8elfwkW8bJPslaHdp2sqZF4DOKsZStbe8+4E
 Y7r6LDfSSLMvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=ixkPHsPX
Subject: [Buildroot] [PATCH 1/1] package/libcurl: bump version to 8.2.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://curl.se/changes.html#8_2_1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index f606735c0f..42bf5967e1 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.2.0.tar.xz.asc
+# https://curl.se/download/curl-8.2.1.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  2859ec79e2cd96e976a99493547359b8001af1d1e21f3a3a3b846544ef54500f  curl-8.2.0.tar.xz
+sha256  dd322f6bd0a20e6cebdfd388f69e98c3d183bed792cf4713c8a7ef498cba4894  curl-8.2.1.tar.xz
 sha256  b1d7feb949ea5023552029fbe0bf5db4f23c2f85e9b8e51e18536f0ecbf9c524  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index d0bf6ccead..7a3d6460e9 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.2.0
+LIBCURL_VERSION = 8.2.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
