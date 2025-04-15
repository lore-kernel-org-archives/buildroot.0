Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1B9C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 20:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A07F8608BE;
	Tue, 15 Apr 2025 20:09:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 79eAZxAe-ha8; Tue, 15 Apr 2025 20:09:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6A8E610F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6A8E610F2;
	Tue, 15 Apr 2025 20:09:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F4BA109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64EF940333
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-KnbpkgMuIm for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 20:09:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5147340DD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5147340DD3
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5147340DD3
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:09:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 3E6524340C;
 Tue, 15 Apr 2025 20:09:14 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Tue, 15 Apr 2025 22:09:13 +0200
Message-ID: <20250415200913.2219800-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -51
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeggeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeeludfgteegfedvkeevudehudejffejieehvdfgieetkeduteejudegkedutddvnecuffhomhgrihhnpehgohhoghhlvgdrtghomhdpkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgdphhgvlhhopeifihhnughsuhhrfhdrrddpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmr
 ghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsggvrhhnugeskhhuhhhlshdrnhgvth
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1744747755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=hHjT59K5Gz2UwpmdIoqVBVm0CkvOsVmmT1rFPxYHJrE=;
 b=nZgkiDlOxbu6LnJLJcWhTvCIDjHZDVioZkgNvm2Dt0I/0A15Fo/XxLYkzaWHq7pbsLEwf0
 IB/yDO/OwaDf5EwjUIOviH8r5oI2DpG3LXfEuco8IbRv8ZjdGLvLbBoT4x+NVicFLyxOqb
 jtVGpdrOLSgDZknZIBHut/5RCYZwOVIZ2FHqcNAOqj17DQ5R7j7XaxKJ2mECrvSpFuKGJ8
 Jst07z7XFqbvbqDLFaJcf4xPCn/AgSEFGPlCIxAaZiZM1CUcyrOvdsHQlQtrCpNZhMos7w
 HLKhKi3KT+IKI3LCJ+1xnZ63d+6eWqnLENYHBU7RXxgkLnJzFhYhKD70BYpITw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nZgkiDlO
Subject: [Buildroot] [PATCH] package/libcap: bump to version 2.76
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog 2.73 -> 2.74:

- ERRATA: Bug 219838  the psx go package fails to build standalone.
- This release addresses Bug 219687 reported by David Runge.
- Group syntax parsing bugfix for pam_cap from Tianjia Zhang.
- Doc typo fix for cap_get_proc.3 from Tianjia Zhang.
- Fix transitive include in capsh.c from Leo.
- Go package documentation updates, including more cap examples.

Changelog 2.74 -> 2.75:

- This release is devoted to a fix for Bug 219838 reported by Frank.

Changelog 2.75 -> 2.76:

- More libpsx and psx Go package mechanism fixes (many thanks to
Christial Kastner for helping dive into the off-piste
architectures. See Bug 219915.)

- To make the various .so files continue to be runnable as standalone
programs added another workaround for glibc. (Bug 219880 reported by
Christian Kastner.)

- Made a new man page cap_text_formats(7). This makes it possible to
separate the tool man pages from the developer man pages. I believe
this was the second time this was requested, by Carlos
Rodriguez-Fernandez this time (can't find the former request in my
email).

- Dropped Make.Rules definition of SYSTEM_HEADERS Thanks to Ross
Burton for reporting.

- Removed a spurious debugging printf() from setcap tool.

- Removed cap_ workarounds for go.dev cap package examples. The
website bugs have been resolved: go/issues/70611; go/issues/70630.

- Added a Makefile to the contrib/seccomp example.

See
https://sites.google.com/site/fullycapable/release-notes-for-libcap
for all release notes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcap/libcap.hash | 2 +-
 package/libcap/libcap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index ec59f224bb..68c331f2b4 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,5 +1,5 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
-sha256  6405f6089cf4cdd8c271540cd990654d78dd0b1989b2d9bda20f933a75a795a5  libcap-2.73.tar.xz
+sha256  629da4ab29900d0f7fcc36227073743119925fd711c99a1689bbf5c9b40c8e6f  libcap-2.76.tar.xz
 
 # Hash for license file:
 sha256  68467e731f4744bd6e0bb69e8df9c3a994e09cd6b203d0c41327ac6d079c581d  License
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 25b3a46c44..b4158a5be8 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.73
+LIBCAP_VERSION = 2.76
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
