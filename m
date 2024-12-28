Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E65DE77191
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 20:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3F7E605E8;
	Sat, 28 Dec 2024 20:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Chnf40SlUFCg; Sat, 28 Dec 2024 20:08:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1BDC606EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1BDC606EC;
	Sat, 28 Dec 2024 20:08:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7464DF1B
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 20:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54179401DD
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 20:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id atkVR1jOFiSR for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 20:07:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DCB164014C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCB164014C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCB164014C
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 20:07:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 17B14C0004;
 Sat, 28 Dec 2024 20:07:54 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Dec 2024 21:07:48 +0100
Message-ID: <20241228200754.4012273-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735416475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=gsRCZPq3BzL6C3CLxjNuoum4KORiZUKDqx1peK7SXMA=;
 b=T/YcD79qwrXIfAOIPoEsQlqYWOFhOJBvZ7nInQE+UPCvMyjk+ILWVUhvUI2xXzNoWEt3yR
 ibDWm0ftBBPFGqjB0yB6DXAtjiuUBSr3dVh9tXzbBRWH6E3gDe4/UkrgHKdJJDk5o1764J
 gywqIE3s40KnmB5HAtWNNqadJO/mAqXWkqNUVSC3tEt/dSxR1eFN1EZp0Fiv5/g56ygCYe
 N9M/ah9FsHpjy+kgOJyZcqiJpCcGJq2odHz6WIOh6qoKgw5jKfaMkaLSFtE2efGCA2UhV6
 gCFnnsEy7Sbar4Qomk7RSYIXYO518PcAoUXWOC0OxPApYhunvoTkuMcs2b69TQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T/YcD79q
Subject: [Buildroot] [PATCH 1/4] package/wayland: bump to version 1.23.1
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

From
https://lists.freedesktop.org/archives/wayland-devel/2024-August/043760.html:

This is a bugfix release for Wayland 1.23.

Joaquim Monteiro (1):
      meson: Fix use of install_data() without specifying install_dir

Kirill Primak (1):
      Put WL_DEPRECATED in front of the function declarations

Sebastian Wick (1):
      client: Handle proxies with no queue

Simon Ser (4):
      scanner: extract validator function emission to helper function
      scanner: fix validator for bitfields
      tests: add enum bitfield test
      build: bump version to 1.23.1 for the bugfix release

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wayland/wayland.hash | 6 +++---
 package/wayland/wayland.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
index 627cb5a1b0..f7c085513a 100644
--- a/package/wayland/wayland.hash
+++ b/package/wayland/wayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2024-May/043636.html
-sha256  05b3e1574d3e67626b5974f862f36b5b427c7ceeb965cb36a4e6c2d342e45ab2  wayland-1.23.0.tar.xz
-sha512  9c525231a7ea3e68d3178230d476285a960d23e38571ac96d885f86c0588c52ef01460bff6833db5adb9456ce8db7b996613611187aac972736748ba91b8fd81  wayland-1.23.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2024-August/043760.html
+sha256  864fb2a8399e2d0ec39d56e9d9b753c093775beadc6022ce81f441929a81e5ed  wayland-1.23.1.tar.xz
+sha512  818eda003e3f7aa15690eedb1ff227a6056b2ce54bf23d45ffe573dc40a914623c5a1358218b59444dcdc483db0503324f0d27091d0ea954412a8b290de5f50a  wayland-1.23.1.tar.xz
 
 # Locally calculated
 sha256  6eefcb023622a463168a5c20add95fd24a38c7482622a9254a23b99b7c153061  COPYING
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 06adafc3e1..bb5ceabb9c 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.23.0
+WAYLAND_VERSION = 1.23.1
 WAYLAND_SITE = https://gitlab.freedesktop.org/wayland/wayland/-/releases/$(WAYLAND_VERSION)/downloads
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
