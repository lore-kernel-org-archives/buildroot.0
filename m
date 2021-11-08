Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3F1C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:08:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E97136101C
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E97136101C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF5B080C6A;
	Mon,  8 Nov 2021 16:08:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g-KSqMBLiAWP; Mon,  8 Nov 2021 16:08:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DF6D80BB1;
	Mon,  8 Nov 2021 16:08:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D32A1BF868
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E320402F5
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zI06f34yqva8 for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 16:07:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB6C3402F3
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 16:07:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2D7FE8B6B8; Mon,  8 Nov 2021 16:03:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 16:10:12 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 957c0e2e19f8e812f6a9fd93b42f123bb5966d86
X-Git-Newrev: 8a47f7522b6ff65a6d0ad16fa6dfc725f4c0c64f
X-Patchwork-Hint: ignore
Message-Id: <20211108160318.2D7FE8B6B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/apcupsd: don't
 override dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a47f7522b6ff65a6d0ad16fa6dfc725f4c0c64f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Don't override APCUPSD_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4c82676211ee57b238ce688fa5753ae23f368d08)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apcupsd/apcupsd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/apcupsd/apcupsd.mk b/package/apcupsd/apcupsd.mk
index 9e707e1a5a..0e9235d1b3 100644
--- a/package/apcupsd/apcupsd.mk
+++ b/package/apcupsd/apcupsd.mk
@@ -33,7 +33,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_APCUPSD_MODBUS_USB),y)
 APCUPSD_CONF_OPTS += --enable-modbus-usb
-APCUPSD_DEPENDENCIES = libusb libusb-compat
+APCUPSD_DEPENDENCIES += libusb libusb-compat
 else
 APCUPSD_CONF_OPTS += --disable-modbus-usb
 endif
@@ -64,7 +64,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_APCUPSD_USB),y)
 APCUPSD_CONF_OPTS += --enable-usb
-APCUPSD_DEPENDENCIES = libusb libusb-compat
+APCUPSD_DEPENDENCIES += libusb libusb-compat
 else
 APCUPSD_CONF_OPTS += --disable-usb
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
