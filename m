Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A22DC54FB3
	for <buildroot@archiver.kernel.org>; Mon, 26 May 2025 16:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 041F74002E;
	Mon, 26 May 2025 16:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3L2j2TSQdjDJ; Mon, 26 May 2025 16:20:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BEDF404E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BEDF404E5;
	Mon, 26 May 2025 16:20:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C40728B
 for <buildroot@buildroot.org>; Mon, 26 May 2025 16:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 425726082D
 for <buildroot@buildroot.org>; Mon, 26 May 2025 16:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3Eq47QjCMOn for <buildroot@buildroot.org>;
 Mon, 26 May 2025 16:20:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B91E60806
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B91E60806
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B91E60806
 for <buildroot@buildroot.org>; Mon, 26 May 2025 16:20:54 +0000 (UTC)
Received: from charybdis.. (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 5E4DDE000D9;
 Mon, 26 May 2025 18:20:51 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Date: Mon, 26 May 2025 18:20:36 +0200
Message-ID: <20250526162044.31288-1-fl@n621.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1748276451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y6jCPDpbfg7VyZyC6Gw2Bu1uyM1E8TRiKv0GnsEk8lw=;
 b=oGOvDwglCGBUviUGr582Ir9dsp/oV4p3LkPAOFg36ANaZHO9CbHdsG+yiCjC77AaPg52rD
 abUEiYpu82T0pH6c5RLJHC8fonz7QVDkRtFJfbnwQHde4g39R01O1S4xtPSteIPyuT8Urp
 D1pv3KPpltROfsYTPE1EUdVR6ucnNbQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=oGOvDwgl
Subject: [Buildroot] [PATCH 1/1] package/libusbgx: bump to version 0.3.0
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

From: Florian Larysch <larysch@fixme.gmbh>

After a long time, upstream has made an actual release, which also
contains a number of bugfixes/improvements. Switch to it instead of
using a random git commit.

Changelog: https://github.com/linux-usb-gadgets/libusbgx/releases/tag/libusbgx-v0.3.0

Signed-off-by: Florian Larysch <larysch@fixme.gmbh>
---
 package/libusbgx/libusbgx.hash | 2 +-
 package/libusbgx/libusbgx.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libusbgx/libusbgx.hash b/package/libusbgx/libusbgx.hash
index b18258978f..724da27a57 100644
--- a/package/libusbgx/libusbgx.hash
+++ b/package/libusbgx/libusbgx.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  d0b483d8b190a75a1f9b52d6db229de5580c78b201077361a524cf32c5aad517  libusbgx-a5bfa81017a9b2064bc449cf74f5f9d106445f62.tar.gz
+sha256  23d72c415ffd80d752efccc9bb5a6afdece6a83a31975344ef31a4967d189e3c  libusbgx-0.3.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/libusbgx/libusbgx.mk b/package/libusbgx/libusbgx.mk
index 03e8dff6bb..7a0e4c5e5b 100644
--- a/package/libusbgx/libusbgx.mk
+++ b/package/libusbgx/libusbgx.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBUSBGX_VERSION = a5bfa81017a9b2064bc449cf74f5f9d106445f62
-LIBUSBGX_SITE = $(call github,linux-usb-gadgets,libusbgx,$(LIBUSBGX_VERSION))
+LIBUSBGX_VERSION = 0.3.0
+LIBUSBGX_SITE = $(call github,linux-usb-gadgets,libusbgx,libusbgx-v$(LIBUSBGX_VERSION))
 LIBUSBGX_LICENSE = GPL-2.0+ (examples), LGPL-2.1+ (library)
 LIBUSBGX_LICENSE_FILES = COPYING COPYING.LGPL
 LIBUSBGX_DEPENDENCIES = host-pkgconf libconfig
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
