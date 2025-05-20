Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012A5C54E71
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 17:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5D3B8111F;
	Tue, 20 May 2025 17:21:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6jHVw7kBWHZn; Tue, 20 May 2025 17:21:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DABB081DED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DABB081DED;
	Tue, 20 May 2025 17:21:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 348DDD4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E0964060F
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U8Y_LJSk1UQ6 for <buildroot@buildroot.org>;
 Tue, 20 May 2025 17:21:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C046B40689
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C046B40689
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:21:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCBDB87551; Tue, 20 May 2025 17:21:21 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 May 2025 19:18:18 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3f5a807810b63703e3fd959629d073cc6ccef41c
X-Git-Newrev: 7402bf2396115c95559d4f1cd8ffd485e2e060a1
X-Patchwork-Hint: ignore
Message-Id: <20250520172121.BCBDB87551@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/usb_modeswitch: bump
 version to 2.6.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7402bf2396115c95559d4f1cd8ffd485e2e060a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This releases fixes a compilation issue with gcc-15.

Changelog:
Version 2.6.2, 2025/02/19
    Bug in C code (with gcc 15) fixed

See:
https://www.draisberghof.de/usb_modeswitch/bb/viewtopic.php?t=3122

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add change info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/usb_modeswitch/usb_modeswitch.hash | 4 ++--
 package/usb_modeswitch/usb_modeswitch.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/usb_modeswitch/usb_modeswitch.hash b/package/usb_modeswitch/usb_modeswitch.hash
index 765a2438c2..0bd9ee9889 100644
--- a/package/usb_modeswitch/usb_modeswitch.hash
+++ b/package/usb_modeswitch/usb_modeswitch.hash
@@ -1,5 +1,5 @@
 # From https://www.draisberghof.de/usb_modeswitch/usb-modeswitch-versions.xml
-md5  69d00d6ed7097b97d972a159d14cfba1  usb-modeswitch-2.6.1.tar.bz2
+md5  cf3b9f052fe49b02b385848eedc7264f  usb-modeswitch-2.6.2.tar.bz2
 # Locally calculated
-sha256  5195d9e136e52f658f19e9f93e4f982b1b67bffac197d0a455cd8c2cd245fa34  usb-modeswitch-2.6.1.tar.bz2
+sha256  f7abd337784a9d1bd39cb8a587518aff6f2a43d916145eafd80b1b8b7146db66  usb-modeswitch-2.6.2.tar.bz2
 sha256  6195429209313925c0eba6c0da4ee7a6cb4277b99e35c886913f80f91ec20b94  COPYING
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index f2ee004b42..aa5646adee 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_VERSION = 2.6.1
+USB_MODESWITCH_VERSION = 2.6.2
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
