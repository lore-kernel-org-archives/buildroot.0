Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C04EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 05:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1011A415BA;
	Thu, 20 Jul 2023 05:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1011A415BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OgW6Gp2k2rrS; Thu, 20 Jul 2023 05:30:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05B334175E;
	Thu, 20 Jul 2023 05:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05B334175E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE46A1BF293
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 05:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9412C40122
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 05:30:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9412C40122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VRzeG695Wm4r for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 05:30:37 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C2BD400D2
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 05:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C2BD400D2
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6AB06A4C07EA;
 Thu, 20 Jul 2023 07:30:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33354)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qMMFD-0006M5-0h;
 Thu, 20 Jul 2023 07:30:31 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 07:30:31 +0200
Message-Id: <20230720053031.33014-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689831031;
 bh=SLs2PLah4CYjCg9U1dgpgSNFeY1U8cyxMG7Eh21J6QI=;
 h=From:To:Cc:Subject:Date:From;
 b=SMkfWrRUveUY09j4r4AtvzSOuDi1Q6zw/ieq7PTpLG0eVVUteON0aTdjB3x2M3qPq
 Zm1wsQaI1RY25bG3EjI3q2O7oSTz/cOE8dxzDJYeV933+bcpAG8VSCQ3CPCxVh+k2a
 SYMhIeenOg3YftPeRDbAdLw/7Q/g5/RMahAdV9IxzA1l9t9XMy6DEXImo53o25DzYF
 cT50VKOIEg5dyuPc5GiOB4Px86VOL+wH5orr2na3qGZordaGn6L1PhGCXfN0lBe4/t
 QKZvjgNcEYxLK+KfevHsW+Y2BzhenJBTcjBNodqBz4LCIyzkDeyGVC8ki59ugxL1HJ
 fVVFgA5jcajBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=SMkfWrRU
Subject: [Buildroot] [PATCH 1/1] package/libcurl: bump version to 8.2.0
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

Changelog: https://curl.se/changes.html#8_2_0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 18b2dbfd86..f606735c0f 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.1.2.tar.xz.asc
+# https://curl.se/download/curl-8.2.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  31b1118eb8bfd43cd95d9a3f146f814ff874f6ed3999b29d94f4d1e7dbac5ef6  curl-8.1.2.tar.xz
+sha256  2859ec79e2cd96e976a99493547359b8001af1d1e21f3a3a3b846544ef54500f  curl-8.2.0.tar.xz
 sha256  b1d7feb949ea5023552029fbe0bf5db4f23c2f85e9b8e51e18536f0ecbf9c524  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 2be3415cb8..d0bf6ccead 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.1.2
+LIBCURL_VERSION = 8.2.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
