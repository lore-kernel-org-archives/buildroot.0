Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A91C8303D
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 14:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AB8A83F07;
	Fri,  4 Jul 2025 14:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 80VmYxeXuHpQ; Fri,  4 Jul 2025 14:21:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C945683EF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C945683EF7;
	Fri,  4 Jul 2025 14:21:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8C5D15F
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 14:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A22260E87
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 14:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Yku5RJ1DGcr for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 14:21:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 733586072E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 733586072E
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 733586072E
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 14:21:10 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 113432C8303A;
 Fri, 04 Jul 2025 16:21:08 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>,
	Sen Hastings <sen@hastings.org>
Date: Fri,  4 Jul 2025 16:21:06 +0200
Message-ID: <20250704142107.332368-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1751638868; bh=GAb2XUuGsd3UvRqBaPP+dyfT51PXp+uYiHkPb8gSXTU=;
 h=From:To:Cc:Subject:Date;
 b=HyiiC1YXPwNKOVqi49P0/O1RiMCIEeyHbAMPA1E6DpBEfLVGxySDVtslOPF54GQBD
 uHK+yCRKh4Sokvxc106YPqgeV0jhOzbfLiQtPX2Mxn8/UT8vn1LttHdOlrutt2eKVO
 kYcE+WtxpeUXjmYRv3WIDLdMkz9kZZCKGM1n5KZaagpDkqkFcOFcaTxUv8/Em1uoqH
 lwp/MwzrMyuK589TDhr8CSLxgt/fbkCM643UBgXMfngEcHQs0urMk8kLsmGZs7EC6O
 DQ8hdZuYo1fKQPcvLH1+F4b0mWX3LuwnU/s1LanFRono3ej7lpUIgq4Y6JSZSmRN+p
 vqqMB5gLYKxVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=HyiiC1YX
Subject: [Buildroot] [PATCH 2025.05.x] package/systemd: bump to 256.17
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes: https://github.com/systemd/systemd/compare/v256.16...v256.17

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index e16823ca78..0c75657898 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  2600db41d9ebd717ca786d754d17699038147b8fddaf15fc935f775a06c0df92  systemd-256.16.tar.gz
+sha256  72568721e2f373463054875fb788190e367327e1a46eef7de6bc73657aa7cbcb  systemd-256.17.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index bf0f2c1e90..126ce7716f 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 256.16
+SYSTEMD_VERSION = 256.17
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
