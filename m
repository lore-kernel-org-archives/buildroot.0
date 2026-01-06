Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4236ED0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A959413C4;
	Wed,  7 Jan 2026 18:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id duEGg7feldiI; Wed,  7 Jan 2026 18:02:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF5FF413A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808931;
	bh=HIwuE+wYy4Zvcpii6Y9tBT6SRc4QNaWOIfBs9s/fWuQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bT8S/PEOboQ7wly9am99O02+gXFp52fyGTOEov1x8dzxjff2E/GdqjcmiaXGoc9ts
	 6R8CQfxO0SlSTytqr87P/laHEJRd0Mb74/Z7JCvj2lHsHAhk9APkRSMf6YwkJeKyUo
	 LA/ESnRy4Zw3P4Y6gnhEwoVCwaZNdGKoQVqTm0omzFK7Ynp/wcaAsyDQvdRyJF5Kxr
	 WIXkDysUGdlhvYvnO8WixeEmPKxVjoVk6UvQnuwSL7b39oWSTEGPRETThXN+VpsEj8
	 xNBT6Hjzk8SE9RfdJz8+JXhFm7fjNPvOVJzIf3msjGNJ/cgnl2ZEu1sq4uWCGTKjFB
	 eUujzyFtjVpKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF5FF413A9;
	Wed,  7 Jan 2026 18:02:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DAD99ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D410440B48
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6t_-Gvx0VKFF for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFFE04099A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFFE04099A
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEEE781340; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:39:16 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 61261f2cad154429c427afade71afabefceebebb
X-Git-Newrev: 3b276e91c98990e71d19af9f72378831041cbf72
X-Patchwork-Hint: ignore
Message-Id: <20260107180111.DEEE781340@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/rpi-firmware:
 bump version to 063bcab
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3b276e91c98990e71d19af9f72378831041cbf72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Version 063bcab matches with kernel 6.12.61

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c1ab01cdc8bc3ceb41f8bceda2dce5261024cf05)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 0645d6ad77..4dd8aa9a26 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6c1b017867c3a51e606859f1cd50df61b94af311577583b6b2a113d11131ee93  rpi-firmware-95be71b8c0f63f03dc06dd0e4c2e5535e6fb4a93.tar.gz
+sha256  812cb64617d6ffbc76f9b8dce8237b31159a1216b31845faec1bb75b6b6b291f  rpi-firmware-063bcab6c8a90efb0d19f69d88cbbc7ec79cab68.tar.gz
 sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index d0b6abcc6f..3318e9a0c1 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Please keep in sync with configs/raspberrypi*_deconfig
-RPI_FIRMWARE_VERSION = 95be71b8c0f63f03dc06dd0e4c2e5535e6fb4a93
+RPI_FIRMWARE_VERSION = 063bcab6c8a90efb0d19f69d88cbbc7ec79cab68
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
