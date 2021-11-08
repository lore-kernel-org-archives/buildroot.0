Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6091DC433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:10:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 208876101C
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 208876101C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA12680EA6;
	Mon,  8 Nov 2021 16:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QgIa20jmmukY; Mon,  8 Nov 2021 16:10:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5412A80EA4;
	Mon,  8 Nov 2021 16:10:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 07CB91BF868
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0475080E9C
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uv6Tfy0Ov7Co for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 16:07:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6412080E9F
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 16:07:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id ABBDB8B6F3; Mon,  8 Nov 2021 16:03:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 16:10:01 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 6ec49975f856d6d6acf8e2f128518421481f5f2c
X-Git-Newrev: 4efa622580e7a0eb1845893ee3e5e723856f11b5
X-Patchwork-Hint: ignore
Message-Id: <20211108160323.ABBDB8B6F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/apcupsd: don't
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

commit: https://git.buildroot.net/buildroot/commit/?id=4efa622580e7a0eb1845893ee3e5e723856f11b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
index 502d1b7152..80ed0b0832 100644
--- a/package/apcupsd/apcupsd.mk
+++ b/package/apcupsd/apcupsd.mk
@@ -34,7 +34,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_APCUPSD_MODBUS_USB),y)
 APCUPSD_CONF_OPTS += --enable-modbus-usb
-APCUPSD_DEPENDENCIES = libusb libusb-compat
+APCUPSD_DEPENDENCIES += libusb libusb-compat
 else
 APCUPSD_CONF_OPTS += --disable-modbus-usb
 endif
@@ -65,7 +65,7 @@ endif
 
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
