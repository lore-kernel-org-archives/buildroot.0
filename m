Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA362CAC5A8
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 208A681EB1;
	Fri, 19 Sep 2025 12:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BqncGfF-22Lv; Fri, 19 Sep 2025 12:48:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86DD8822D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86DD8822D1;
	Fri, 19 Sep 2025 12:48:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 59E24E7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4005D40DC9
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nuXsZJLhGXUN for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:48:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74E51403AB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74E51403AB
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:48:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DA2A842A0; Fri, 19 Sep 2025 12:48:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 10:18:37 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 8453b46193384b2fc9d69f621e52ef77d99297cc
X-Git-Newrev: 7d0b96a347eb1cec75debb9bc9499b082c835601
X-Patchwork-Hint: ignore
Message-Id: <20250919124805.6DA2A842A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] boot/ti-k3-boot-firmware:
 switch to github mirror
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d0b96a347eb1cec75debb9bc9499b082c835601
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The git.ti.com cgit server continues to be plagued with reliability
issues which are reportedly from heavy bot traffic. To combat this the
system administrators have removed the archived downloads feature from
this server.

Switch to TI's Github mirror so new downloads continue to be possible.

Signed-off-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit ebf0131e3e832e125c7fb1d9cd333e558eca663d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash | 2 +-
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
index 571bbf1219..2396948381 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  ab20ffbe7bba7e94be246b3417d33a914b3f07c16c47ef5a7f7602349a666a61  LICENSE.ti
-sha256  f9e09b84e206d605a9fb5691a325dcd4a7d6a3e6bf70a69cbc169d1a5c617804  ti-linux-firmware-11.00.11.tar.xz
+sha256  e98ae3350964100b6137d32d4874c16229a97b1cc7f8f4f23f8da59a386520c8  ti-k3-boot-firmware-11.00.11.tar.gz
diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
index 117c0a9a5a..25956be68b 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 TI_K3_BOOT_FIRMWARE_VERSION = 11.00.11
-TI_K3_BOOT_FIRMWARE_SITE = https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/snapshot
-TI_K3_BOOT_FIRMWARE_SOURCE = ti-linux-firmware-$(TI_K3_BOOT_FIRMWARE_VERSION).tar.xz
+TI_K3_BOOT_FIRMWARE_SITE = $(call github,TexasInstruments,ti-linux-firmware,$(TI_K3_BOOT_FIRMWARE_VERSION))
 TI_K3_BOOT_FIRMWARE_INSTALL_IMAGES = YES
 TI_K3_BOOT_FIRMWARE_LICENSE = TI Proprietary
 TI_K3_BOOT_FIRMWARE_LICENSE_FILES = LICENSE.ti
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
