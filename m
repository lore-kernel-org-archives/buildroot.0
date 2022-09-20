Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC42C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 23:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6D9440901;
	Tue, 20 Sep 2022 23:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6D9440901
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cAnJ_ncX6ij0; Tue, 20 Sep 2022 23:01:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 946A4408CD;
	Tue, 20 Sep 2022 23:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 946A4408CD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 678201BF377
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 23:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 431D360FC1
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 23:00:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 431D360FC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NmvQTmNBaZdy for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 23:00:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E4D560FBF
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E4D560FBF
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 23:00:47 +0000 (UTC)
Received: from 91-153-34-150.elisa-laajakaista.fi ([91.153.34.150] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1oamEN-00Emre-Hg; Wed, 21 Sep 2022 01:00:43 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id c43d766e;
 Tue, 20 Sep 2022 23:00:29 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 02:00:27 +0300
Message-Id: <20220920230029.1680134-2-aperez@igalia.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920230029.1680134-1-aperez@igalia.com>
References: <20220920230029.1680134-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kDj//yIKRgD4ryEA6f/Whruy3Ah9D8yPNmLFvObYcTs=; b=DiJ39JIB732ujjy2OW6a4F3Qcn
 LrVCVwcrD/oYTB5Rw70v8ZGifU0a2mZAhaI/DTjPnAoV6Z/x3Y8R1NMpk4uVURbuBZjonia+djQ7k
 yFybz2va25Bc696iZvrCp02ta2Qn99vm5EKvghQrOS0wSNmHNQ8v1EIKJAkLyLKSjRGNEgSKbjXuo
 EYV2+SYNB40rSWno3G+4sTy/M+0P2fQRk7/bPkEtm6KJqLRNv0LI8ybwKuj70vTY9+hFFmwrt/ZdE
 /8BvzpSuCPglZwXOe0PK9X5fw32u09sE5zjr0irSy2HS0n/rxqMHJ/Rn1KLtS4J4NFKDIIScW8rRn
 Pq0pnNVQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=DiJ39JIB
Subject: [Buildroot] [PATCH 1/3] package/libwpe: bump to version 1.14.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version is the first stable release with support for gamepad
input events and configuring target frame rates. These will be used
by a follow-up update of the wpewebkit package. Release notes:

  https://wpewebkit.org/release/libwpe-1.14.0.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libwpe/libwpe.hash | 8 ++++----
 package/libwpe/libwpe.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
index 2bbe1f0749..28b7685b93 100644
--- a/package/libwpe/libwpe.hash
+++ b/package/libwpe/libwpe.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/libwpe-1.12.3.tar.xz.sums
-md5  e538eb8e521d92f2bde3c4cd864abaa1  libwpe-1.12.3.tar.xz
-sha1  9d94c411a502a10e68f69bd1fa273539cc6af2ca  libwpe-1.12.3.tar.xz
-sha256  b84fdbfbc849ce4fdf084bb28b58e5463b1b4b6cc8f200dc77b41f8545d5329d  libwpe-1.12.3.tar.xz
+# From https://wpewebkit.org/releases/libwpe-1.14.0.tar.xz.sums
+md5  f9737912975f979f9e4e01eec174a271  libwpe-1.14.0.tar.xz
+sha1  7a5d51c99254fc14ffcbcca9e8550cc7940fe871  libwpe-1.14.0.tar.xz
+sha256  c073305bbac5f4402cc1c8a4753bfa3d63a408901f86182051eaa5a75dd89c00  libwpe-1.14.0.tar.xz
 
 # Hashes for license files:
 sha256  35bef295cedbbf179eaee14328002587a0e7dc08ebf3f15ea080a6f2815f0d7b  COPYING
diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
index ac533642d9..e7b3ce9eaf 100644
--- a/package/libwpe/libwpe.mk
+++ b/package/libwpe/libwpe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWPE_VERSION = 1.12.3
+LIBWPE_VERSION = 1.14.0
 LIBWPE_SITE = https://wpewebkit.org/releases
 LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
 LIBWPE_INSTALL_STAGING = YES
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
