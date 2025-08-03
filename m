Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E119CC87FCA
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 14:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E1206101C;
	Sun,  3 Aug 2025 14:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4R9bEpP4rQb9; Sun,  3 Aug 2025 14:00:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A90DD61016
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A90DD61016;
	Sun,  3 Aug 2025 14:00:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 38384118
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26EB580D66
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:00:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IYn037lvbkAL for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 14:00:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B3F6480B6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3F6480B6F
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3F6480B6F
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:00:18 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.232]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6DWi-1ukmBT0dxo-002eEy; Sun, 03
 Aug 2025 16:00:15 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
	Peter Seiderer <ps.report@gmx.net>
Date: Sun,  3 Aug 2025 16:00:09 +0200
Message-ID: <20250803140011.186274-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:I7HGW1ie7LL1hb7i5hR9SE6Y7QJjPV8IWMBI8SOmzsPdg76dW3e
 3MXHvYZKZkP1jNyFcaoiA4+O5IbvN5IeC2tb1r+AnnYEd/f1lK1ef3u3Xu8I0bDvoyDMpEQ
 KsIiEQM3dpPzpPz4KPXYX8TD/OyAGcUA3akNT+ZfSpDt49GdI4ksBT91kXzQnUfCEAwt0Vc
 AUt4dD3rP3avmH4Zcctdg==
UI-OutboundReport: notjunk:1;M01:P0:XY9I9f7mej0=;MT3O6YoR919dNnplAhrXluYaZNw
 +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
 DA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1754229615; x=1754834415; i=ps.report@gmx.net;
 bh=cJpva+FFH884u1I56vLHKOBrA0SIbgsn/ZJHV/ktB3s=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=tLFRiteX89XK6Mq+Ka6xdcwXmSNgGBCdRoBuUK0H8osEPhfRYKkYrGuYhdq4vT85
 tpZ46r+jlKcMX4IQkgj0xdOXkF6W5UJYZkW2YFfpe+MPchjTA+ggcqg4siQAPaFrd
 MR6IdJX+NqxzsoyhuW5hDGEQ0slgFsEt9Y8ZyMPcReKe4s7k6ygraBQKOyj/txUxU
 41YSdRviXUQR4vRdIu8Pm8qbKZrKuZVucYqMz7o0I/2RCPNVIv79ThoIMx2tu/dpO
 McMwKR/p6ii3u0Zi6BCFzHce4J6Yw4oknUMuuRmOd/zc06z7tZUiefaEPF0/xvjAa
 dSkCZceEMqMFrf9sjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=tLFRiteX
Subject: [Buildroot] [PATCH 1/3] package/ell: bump version to 0.79
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog (see [1]):

  ver 0.79:
    Fix issue with D-Bus client and watch removal handling.
    Fix issue with D-Bus client and service name handling.
    Fix issue with D-Bus proxy and filter rule handling.

  ver 0.78:
    Fix issue with random ECC scalar generation.

  ver 0.77:
    Add support for precheck feature for unit tests.
    Add support for license variable for pkg-config.

  ver 0.76:
    Fix issue with random scalar generation.

  ver 0.75:
    Add support for converting OID octets to strings.
    Add support for NIST P-224 cuve usage with ECDH.
    Add support for NIST P-521 cuve usage with ECDH.
    Add support for SHA-3 series of hashing algorithms.

  ver 0.74:
    Add support for NIST P-192 curve usage with ECDH.
    Add support for SHA-224 based checksums and HMACs.

  ver 0.73:
    Fix issue with parsing hwdb.bin child structures.

  ver 0.72:
    Add support for the Test Anything Protocol.

  ver 0.71:
    Fix issue with GCC 15 and -std=c23 build errors.

  ver 0.70:
    Add support for helper function for safe memcpy.

[1] https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog?h=0.79

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 4f67cbae21..418d1a9a2a 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  6cfc0888edc94de9f0623798609587b2cc11b92b892945f317e8d199afe7b12e  ell-0.69.tar.xz
+sha256  28dabdb1966fd2e47363c44e041de507e9420411b846947efa01b4cb0cda0d6b  ell-0.79.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index 6d4e8a5ae7..a0ae7a68c8 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.69
+ELL_VERSION = 0.79
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
