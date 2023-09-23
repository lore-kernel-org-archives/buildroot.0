Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3915CE7A89
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 11:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D2BF401A4;
	Sat, 23 Sep 2023 11:49:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D2BF401A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u4YllozheXNf; Sat, 23 Sep 2023 11:49:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A924340C0E;
	Sat, 23 Sep 2023 11:49:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A924340C0E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C1B101BF5E9
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 11:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 996A4405F4
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 11:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 996A4405F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4UqFPNGR0yJJ for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 11:49:05 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B1184053F
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 11:49:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B1184053F
Received: from fli4l.lan.fli4l (p5b3a0af9.dip0.t-ipconnect.de [91.58.10.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 11A32A4C0E06
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 13:48:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36206)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qk17y-0001OL-2i
 for buildroot@buildroot.org; Sat, 23 Sep 2023 13:48:50 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 23 Sep 2023 13:48:50 +0200
Message-Id: <20230923114850.1477656-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230923114850.1477656-1-bernd@kuhls.net>
References: <20230923114850.1477656-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695469731;
 bh=tFjfXmxPQM9+cRGq31ysCm/OGp6BlTwNxZ2N7vndTec=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KeVvd0OERZcY8XXucbb/BzC7nUIsLVuVQDX/wJUZrPttQXuy0s1WZ/qVlVPQtWPFi
 D2Ovsv9WjnYeCbgN+MLaDYWaAgtlmoIICgJOo/PesUXw8Oikn23Ie7jMbtoAi7lVhD
 IkiNEpv302bsj6NWICUIREVvLRIH5nEJHlQg9WhAlzj3BH2RSsQwrBTuk1stksTvWl
 V3hZIjgkUDfXY204CKCw85VVLC1KcAThHLqB1oWZY8LMwypCxUTP2wmGUvcxlehIzo
 x9yPgyBfzOpFrUUzS1aRXuUC3d5zg0JF6qdbs15138rJ0g5LQAwAUT8hGRSsyp0rST
 cLewB+JqZz23Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=KeVvd0OE
Subject: [Buildroot] [PATCH 2/2] package/libva-utils: bump version to 2.20.0
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

Release notes:
https://github.com/intel/libva-utils/blob/v2.20-branch/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libva-utils/libva-utils.hash | 2 +-
 package/libva-utils/libva-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index e46a0522f8..b7b6fe3bbc 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4135992ab534d0cfd71a93c28e1a22f79c0003cf8d157ffd4621e5e482191b4f  libva-utils-2.19.0.tar.gz
+sha256  1a5e3c3c24677a6b4bbee21042c4c06b0a2c62e56ebb1baa4e712392b5c72f9b  libva-utils-2.20.0.tar.gz
 sha256  c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index 4b2f5907ea..4f0fa68aa9 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.19.0
+LIBVA_UTILS_VERSION = 2.20.0
 LIBVA_UTILS_SITE = $(call github,intel,libva-utils,$(LIBVA_UTILS_VERSION))
 LIBVA_UTILS_LICENSE = MIT
 LIBVA_UTILS_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
