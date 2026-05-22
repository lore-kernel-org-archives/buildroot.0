Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD50CD5BB0
	for <buildroot@archiver.kernel.org>; Fri, 22 May 2026 19:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DED96151B;
	Fri, 22 May 2026 19:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2fhDANHEJdjk; Fri, 22 May 2026 19:22:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5004C6F784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779477772;
	bh=qvmMvizobNvDpR8POLsSvlz5z51/evWwtNNgAIti11c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bJYoiKEf+17/KXyGDKhjgKA6A5jRtAT8jfeuJ3GWyX4Xi8fVX0wyRASepOSLCU5JA
	 fW+lJu3PPuVuxAYwroJZqx0KRh4LHlinGOsVmYNtf4Ppx9B+vQakyWoUpzvPovwj2F
	 BrHl+LtVJoDoN0y3TaLeL01bU3Mgd3pT4deCqN6wT+JkXSEUBRFyhlo9NJbVhV6W5v
	 gFzwXbcJBPKvBQMUs/uYtzOctxs2jhujtFZjyI0AUwQ7s+yu/mx8qqWca5OPEDoUm6
	 fQNRXGju7voytqi1RgWnHvhLJtuCeyQ6d98M5BIMQqqc7KIRKxU3DZcjpHXcwHnJrm
	 HAJs38dCLAa5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5004C6F784;
	Fri, 22 May 2026 19:22:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 559713D9
 for <buildroot@buildroot.org>; Fri, 22 May 2026 19:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FF6B6F784
 for <buildroot@buildroot.org>; Fri, 22 May 2026 19:22:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0TAgoAArQioq for <buildroot@buildroot.org>;
 Fri, 22 May 2026 19:22:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A5556151B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A5556151B
 for <buildroot@buildroot.org>; Fri, 22 May 2026 19:22:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E720086BC6; Fri, 22 May 2026 19:22:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 22 May 2026 21:16:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 29ffdc0dda39e19ccf01874511326b50c039a105
X-Git-Newrev: a6401b32e77d0f14c364b5dbfef59d2700d90595
X-Patchwork-Hint: ignore
Message-Id: <20260522192239.E720086BC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/linux-firmware: bump
 version to 20260519
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a6401b32e77d0f14c364b5dbfef59d2700d90595
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Updating the hash of the WHENCE file, due to firmware additions and
firmware changes, but no changes to the redistribution/licensing
conditions.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-firmware/linux-firmware.hash | 4 ++--
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index ede4d7fa67..e707583e7e 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  b7812ed6d59f6b09ecceddaa0be842a7e82a79cc0e46ca60478a4ebf02f1e178  linux-firmware-20260410.tar.xz
+sha256  b14e7197a290a7e5569f5ef790cde289bddc47e32126f2eb262a8e677fc39727  linux-firmware-20260519.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
@@ -50,7 +50,7 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  c282239a5a2d849677e9304e6f361e475e1b6e71e7c771c03f8986f71b309527  WHENCE
+sha256  93a059ebbd333245a587778663c17d3df09421da30ae6b3e2d18ac2741f506c0  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
 sha256  26b3c946f1f378ff25bb3bb7c365d108a2bc0bf08619e5e08bc0e4f9aaa6ee1e  LICENSE.xe
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 8187d1feaf..c076def399 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20260410
+LINUX_FIRMWARE_VERSION = 20260519
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
