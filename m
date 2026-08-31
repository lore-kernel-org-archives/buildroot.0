Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFE8C61DD3
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 12:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D69CE80993;
	Mon, 31 Aug 2026 12:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5zfFbonBme1s; Mon, 31 Aug 2026 12:51:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788180684;
	bh=KYJunRLtLnD4HY8vWxVV4nZuMZJlk8m+BbeIsBUNh3w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NuPoisf9kcBFFsLYLEJVW+GsJdgs2rd5ugL2Yzaf/rMkFdW3QCPrZzZ0Dz337um0j
	 BAjkmK3QoHEt58V25Sc7JDYBC2c/aiitt0z/64DmcuXDarGVfTkYpWZCmbtHhIZS/c
	 M0wvQqP6AF1wColFAGC5xpK8qK1+nLjDHNjMv/4e9KPJxItsX0TfcpTz3KaDSSE6gr
	 +ZdGjzYVqd8MNmtG+MnZsdNNRR6s/LjDIqnSP5MOMPv9eZIK1ZOMf+KIA4Fk4fHX1n
	 b2+9aOfvQDos0qfYsbTZljVLDTBknIXIHU5rDDjXQU8tmn05EpkIXcVGMJP5NbHHZP
	 Kgv6dhVyieiHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C30C80880;
	Mon, 31 Aug 2026 12:51:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C14E223E
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 12:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A788580880
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 12:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dr0vfV2giOeR for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 12:51:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 840F38087E
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 12:51:20 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8XU1-1wnZB62rHF-00rzi9; Mon, 31
 Aug 2026 14:51:17 +0200
To: buildroot@buildroot.org
Cc: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Mon, 31 Aug 2026 14:51:02 +0200
Message-ID: <20260831125103.841338-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831125103.841338-1-fiona.klute@gmx.de>
References: <20260831125103.841338-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:g5kroVl6MzUlCGcIA5arjEx9Pt6yVEralZvsZ2/XZVtphtguIgr
 gRs5d86z/41kZS52gNSrG6ipvQE0GxDaFmCkJ6tpE+7SvnXwzmRsjo9OP6FpGVTVnu0ksGn
 UsxCUY2k4vuim1XntrUYZt4btVZS/D2S7tIbXe2OogYqVDTE9uB6EO+ddNni/v2VrtCj8DQ
 reqL7vXZ7xb5B7ciwUZFw==
UI-OutboundReport: notjunk:1;M01:P0:yw1cPiwIGhA=;ytI4i/F6yr2p2qhAWrQKb6H3T1G
 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
Subject: [Buildroot] [PATCH next 2/3] fs/squashfs: add option to build
 verity tree
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 fs/squashfs/Config.in | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index cb2f5ec969..c267640401 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -121,4 +121,16 @@ config BR2_TARGET_ROOTFS_SQUASHFS_COMP_OPTS
 	default "-Xcompression-level 22" if BR2_TARGET_ROOTFS_SQUASHFS4_ZSTD
 	depends on BR2_TARGET_ROOTFS_SQUASHFS_EXTREME_COMP
 
+config BR2_TARGET_ROOTFS_SQUASHFS_VERITY
+	bool "create verity hash data for root filesystem"
+	select BR2_PACKAGE_HOST_CRYPTSETUP
+	help
+	  Create verity hash tree for the root filesystem. This allows
+	  setting up a dm-verity device for the root filesystem, to
+	  ensure data integrity. The root hash must be provided from a
+	  trusted source, or with a kernel-verifiable signature.
+
+	  The verity hash image will be called rootfs.squashfs.verity,
+	  with the root hash in rootfs.squashfs.verity.root-hash.
+
 endif
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
