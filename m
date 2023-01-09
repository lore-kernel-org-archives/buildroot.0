Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E2CC5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 07:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4742340908;
	Mon,  9 Jan 2023 07:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4742340908
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H2QLMNbzYGF2; Mon,  9 Jan 2023 07:34:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42D754048F;
	Mon,  9 Jan 2023 07:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42D754048F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 963BA1BF487
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 07:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7010E60B20
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 07:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7010E60B20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5R3w_470THlV for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 07:34:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 628E1608B7
Received: from mfwd20.mailplug.co.kr (mfwd20.mailplug.co.kr [14.49.36.175])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 628E1608B7
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 07:34:32 +0000 (UTC)
Received: (qmail 28345 invoked from network); 9 Jan 2023 16:34:23 +0900
Received: from wmail10.mailplug.com (121.156.118.13)
 by 0 (qmail 1.03 + mailplug 2.0) with SMTP; 9 Jan 2023 16:34:09 +0900
Received: (qmail 580185 invoked from network); 9 Jan 2023 16:34:03 +0900
Received: from unknown (HELO sslauth37)
 (cherniaev.andrei@kairo.space@211.252.87.52)
 by 0 (qmail 1.03 + mailplug 2.0) with SMTP; 9 Jan 2023 16:34:03 +0900
From: AndreiCherniaev <cherniaev.andrei@kairo.space>
To: buildroot@buildroot.org
Date: Mon,  9 Jan 2023 16:33:52 +0900
Message-Id: <20230109073353.11701-1-cherniaev.andrei@kairo.space>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] boot/grub2: add information where is
 configuration file
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

because file
boot/grub2/grub.cfg
contains menu. If you want add, rename something in menu use grub.cfg file. This is example of grub.cfg
menuentry "Buildroot" {
	linux /boot/bzImage root=/dev/sda1 rootwait console=tty1
}

Signed-off-by: AndreiCherniaev <cherniaev.andrei@kairo.space>
---
 boot/grub2/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index 92b5dd501b..bf0400c08f 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -125,6 +125,7 @@ config BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC
 	  into the Grub image itself. This allows to set the root
 	  device and other configuration parameters, but however menu
 	  entries cannot be described in this embedded configuration.
+	  Use boot/grub2/grub.cfg to edit menu entries.
 
 endif # BR2_TARGET_GRUB2_HAS_LEGACY_BOOT
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
