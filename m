Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AE0C52D7D
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 13:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB43F841D0;
	Fri, 16 Aug 2024 13:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YAdanrE8RY_1; Fri, 16 Aug 2024 13:19:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B1D3841CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B1D3841CC;
	Fri, 16 Aug 2024 13:19:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ACA681BF360
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 13:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A94360745
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 13:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8NDfE2GBxzVD for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 13:19:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 878B260658
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 878B260658
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 878B260658
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 13:19:15 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 38E01B00548;
 Fri, 16 Aug 2024 15:19:08 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 16 Aug 2024 15:18:56 +0200
Message-ID: <20240816131856.461483-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723814353;
 bh=ifRZ/8HSH5WnvPbpyC0/2R5N9L/+HIpaLK16kQp8pvs=;
 h=From:To:Cc:Subject:Date:From;
 b=jqLzdKD7UEuU3aH9oIISCHUTDDFI5zc5SzAB6CTC5WiWQ07CVZcWUSwQBueQatdex
 MPdps9W+wf9hvVIIK1z3PQnE67x0bXErmT33gBOCQTte2JsWNw6eVTBEtvFOlEVMs7
 pXyX5kVRLa9xY+8TczDdAbJDtgCOFDBsxeTbTOKi6hhFNYMXYAbHmL1PrJcZdkiXlg
 6GVckrqvBSVJLla/B85761E1YaTh+Oq61gzopqw7MQ9MMyF3aObVHXP1TazCunmlcO
 DqcjR4e2yG/aZqv9DtVQA5JN+6d6qH41XZg44tKlDgwsbP85bJNtlJceAeGZxoaNDs
 U0qabnFoC7B5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jqLzdKD7
Subject: [Buildroot] [PATCH next 1/1] package/bcc: bump version to 0.31.0
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Romain Naour <romain.naour@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For a change log since 0.29.1, see:
https://github.com/iovisor/bcc/blob/v0.31.0/debian/changelog

This commit also changes BCC_SITE_METHOD to "git". This is because the
upstream source archive name does not contain the version. It is
always named "bcc-src-with-submodule.tar.gz" in all releases. If using
the https _SITE_METHOD, bumping the version will not download the new
version if the directory BR2_DL_DIR contains an old one, with the same
name. Since the upstream repository uses git submodules, this commit
also adds "BCC_GIT_SUBMODULES = YES".

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bcc/bcc.hash | 2 +-
 package/bcc/bcc.mk   | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/bcc/bcc.hash b/package/bcc/bcc.hash
index b37e125b1a..7ed164eda0 100644
--- a/package/bcc/bcc.hash
+++ b/package/bcc/bcc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  321575fa94f3274040379dd2d4535217f45099f4240b58a4dfc171aa8c78402f  bcc-src-with-submodule.tar.gz
+sha256  5641b1db0b9ec60a6afd67b4607c790f49e580c207638bb4ebcea2805c6f373b  bcc-v0.31.0-git4.tar.gz
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE.txt
diff --git a/package/bcc/bcc.mk b/package/bcc/bcc.mk
index e496c4b344..d5d72aa9c0 100644
--- a/package/bcc/bcc.mk
+++ b/package/bcc/bcc.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-BCC_VERSION = 0.29.1
-BCC_SITE = https://github.com/iovisor/bcc/releases/download/v$(BCC_VERSION)
-BCC_SOURCE = bcc-src-with-submodule.tar.gz
+BCC_VERSION = v0.31.0
+BCC_SITE = https://github.com/iovisor/bcc
+BCC_SITE_METHOD = git
+BCC_GIT_SUBMODULES = YES
 BCC_LICENSE = Apache-2.0
 BCC_LICENSE_FILES = LICENSE.txt
 BCC_INSTALL_STAGING = YES
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
