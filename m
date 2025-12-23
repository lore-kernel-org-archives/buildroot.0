Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4954BE74900
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 23:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCE7C8099B;
	Tue, 23 Dec 2025 23:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yBFzcNgcBl_D; Tue, 23 Dec 2025 23:10:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0605D8025B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766531446;
	bh=OPyceun5zHgB3ClmC3FBQHwPZflHBVbk1BRGO3D4KQk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GRT1brSJbuoLTKDGs6C8VdAAKwuvoH1NJCYmDYq52Xdymksq6sTkvFYg4AUb0Yh48
	 dFfrpfxzdmhIZLETxDA4l9vkrEViBoLb0FPYdNvrkbnUitCmwiPUPOyb99xD8TSkdu
	 pGv4AO7BV1wnOhcc7dOj5zKRWpTMmrC//1ljxjGd8VzC7srImVPDxmwbWcEzqbVX28
	 aAFdsn3uzY+9Cw64XSMsYuDLcF4qcLMNacFwaZTa8SCh+v2yREnThLP12AyzorPK59
	 G37W97CskfLu9JfxobHbnAVXfaWGObti2focAWeFRMn2cPUfkzRcxavQpe7G1i7TLy
	 KwrGCAbD1aj4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0605D8025B;
	Tue, 23 Dec 2025 23:10:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F9C4B9
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 23:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36B5840488
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 23:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UhWO2ba0DwvW for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 23:10:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C47C402DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C47C402DE
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 23:10:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3629F87648; Tue, 23 Dec 2025 23:10:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Dec 2025 00:09:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f5a9ab0837accd519484259f436763c93218fba
X-Git-Newrev: c1ab01cdc8bc3ceb41f8bceda2dce5261024cf05
X-Patchwork-Hint: ignore
Message-Id: <20251223231044.3629F87648@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-firmware: bump version to
 063bcab
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c1ab01cdc8bc3ceb41f8bceda2dce5261024cf05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 063bcab matches with kernel 6.12.61

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
