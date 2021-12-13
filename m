Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D6FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 21:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C93340301;
	Mon, 13 Dec 2021 21:15:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pN8NpdTxglse; Mon, 13 Dec 2021 21:15:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4F0E402EC;
	Mon, 13 Dec 2021 21:15:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1083B1BF2B0
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4E0B402B5
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:15:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id URo6ZhAZ2MJr for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 21:15:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA449402CE
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 21:15:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 28C1F83799; Mon, 13 Dec 2021 21:09:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Dec 2021 22:09:27 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 075b9ebfa56f794d8eb1e02b35f2adcd3ea15d2e
X-Git-Newrev: 83d27c0f1e7aff01f1ba707046d618ea777c8740
X-Patchwork-Hint: ignore
Message-Id: <20211213210952.28C1F83799@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/bluez5_utils: hid
 needs hog
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=83d27c0f1e7aff01f1ba707046d618ea777c8740
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Build of hid without hog is broken since commit
fb9fc969d91f69851b4c70dba512b607e52bda7b:

/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: profiles/input/bluetoothd-manager.o: in function `input_init':
manager.c:(.text+0x2fd): undefined reference to `input_set_auto_sec'

Fixes:
 - http://autobuild.buildroot.org/results/9222879c9fe958e01e33f69531270355ea016d17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9850f262fd6546d15ae27f84a0e36411abc2b7b5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bluez5_utils/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 9f20bf83ac..f2b63b0a1c 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -78,6 +78,7 @@ config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID
 	bool "build hid plugin"
 	default y
+	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HOG
 	help
 	  Build plugin for HID (input) profiles.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
