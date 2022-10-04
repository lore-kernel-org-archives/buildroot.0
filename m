Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE86AC433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 13:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 339C440BB4;
	Tue,  4 Oct 2022 13:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 339C440BB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VGGvyTLNyd2Y; Tue,  4 Oct 2022 13:31:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6189B40BCE;
	Tue,  4 Oct 2022 13:31:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6189B40BCE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F40C41BF9CB
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 13:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF8EF60AD2
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 13:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF8EF60AD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RDfRW42eXs94 for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 13:31:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE2FF60ABA
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE2FF60ABA
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 13:31:16 +0000 (UTC)
Received: from 91-153-34-120.elisa-laajakaista.fi ([91.153.34.120] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1ofi0w-007mYi-9E; Tue, 04 Oct 2022 15:31:14 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 9383a23b;
 Tue, 4 Oct 2022 13:30:57 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 16:30:54 +0300
Message-Id: <20221004133057.2003750-3-aperez@igalia.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221004133057.2003750-1-aperez@igalia.com>
References: <20220920230029.1680134-1-aperez@igalia.com>
 <20221004133057.2003750-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kDj//yIKRgD4ryEA6f/Whruy3Ah9D8yPNmLFvObYcTs=; b=BTCr/ihi/K6mXUOewlftHWla0O
 fMA1dMuW0IVLvjCzgvR4e+aiSj594zxIeSPleZfroPIc4KwGaEk1XICOJ8X3/w9CRsHI4H/ts4jkV
 ufqjO/4PW8j6vtt06luxB35t0z4e3Qi7ADh6jbFdcVWsvfQZIPsLSvCRTO4GzCKd7o8h4XDIOaJIg
 ggcpyNJekUnPPZrwpznDG0klqktKnijkgS+if5L/PF8GU15AYzkzkZIZWCykJ3xUf2I4u6ohFc7hO
 AoHu4ALzcYhPz8wNJOIGwS6n059Ayzgvlk8MHtCoqWKuDZV+UGzqhCu+l5P6cNGnKs/ZkQLSnItCr
 qFzCH30A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=BTCr/ihi
Subject: [Buildroot] [PATCH 2/5] package/libwpe: bump to version 1.14.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
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
