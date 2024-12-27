Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D409E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 10:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C761480C6A;
	Fri, 27 Dec 2024 10:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4tpheS5s5YLY; Fri, 27 Dec 2024 10:51:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6A1080C6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6A1080C6B;
	Fri, 27 Dec 2024 10:51:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A6B91F1B
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 10:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8776D400D6
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 10:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZ1onLW31cG7 for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 10:51:45 +0000 (UTC)
X-Greylist: delayed 903 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 27 Dec 2024 10:51:44 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9CDC6400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CDC6400BA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.181.117.226;
 helo=mail.actia.se; envelope-from=john.ernberg@actia.se; receiver=<UNKNOWN> 
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CDC6400BA
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 10:51:43 +0000 (UTC)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Dec
 2024 11:36:35 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.039; Fri, 27 Dec 2024 11:36:35 +0100
From: John Ernberg <john.ernberg@actia.se>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Jonas Blixt <jonas.blixt@actia.se>, John Ernberg <john.ernberg@actia.se>
Thread-Topic: [PATCH] fs/squashfs: Allow to disable compression of the
 filesystem
Thread-Index: AQHbWEszll5ysDoSSki8i1B8BaAVlQ==
Date: Fri, 27 Dec 2024 10:36:35 +0000
Message-ID: <20241227103623.1608053-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.47.1
x-originating-ip: [10.12.12.13]
x-esetresult: clean, is OK
x-esetid: 37303A2955B144556C7165
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=actia.se
Subject: [Buildroot] [PATCH] fs/squashfs: Allow to disable compression of
 the filesystem
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Devices with large amounts of flash but operating in connectivity-
constrained areas can benefit from using uncompressed images as this
allows delta updates using binary diff algorithms.

Connectivity-constrained areas in this context are defined as areas
where the connection is very slow, unstable, etcetera, where it is
difficult to transfer data in large scale.

Add a "none" option to the compression menu and map it to the mksquashfs
-no-compression flag to enable this feature.
Disable the ability to select extreme compression in this case as that
makes absolutely no sense combined with no compression.

Signed-off-by: John Ernberg <john.ernberg@actia.se>
---
 fs/squashfs/Config.in   | 6 ++++++
 fs/squashfs/squashfs.mk | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index 21322a2246..4f898bfdd4 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -69,6 +69,8 @@ choice
 	  Select the squashfs compression algorithm to use when
 	  generating the filesystem.
 
+	  Select "none" to disable compression.
+
 config BR2_TARGET_ROOTFS_SQUASHFS4_GZIP
 	bool "gzip"
 
@@ -87,11 +89,15 @@ config BR2_TARGET_ROOTFS_SQUASHFS4_XZ
 config BR2_TARGET_ROOTFS_SQUASHFS4_ZSTD
 	bool "zstd"
 
+config BR2_TARGET_ROOTFS_SQUASHFS4_NONE
+	bool "none"
+
 endchoice
 
 config BR2_TARGET_ROOTFS_SQUASHFS_EXTREME_COMP
 	bool "extreme compression when available"
 	default y if BR2_TARGET_ROOTFS_SQUASHFS4_LZ4  # legacy
+	depends on !BR2_TARGET_ROOTFS_SQUASHFS4_NONE
 	help
 	  Use options to increase compression ration as much as
 	  possible, like using architecture-specific options, at
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index cf083663c1..3b9d0efbbe 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -26,6 +26,8 @@ else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_XZ),y)
 ROOTFS_SQUASHFS_ARGS += -comp xz
 else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_ZSTD),y)
 ROOTFS_SQUASHFS_ARGS += -comp zstd
+else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_NONE),y)
+ROOTFS_SQUASHFS_ARGS += -no-compression
 else
 ROOTFS_SQUASHFS_ARGS += -comp gzip
 endif
-- 
2.47.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
