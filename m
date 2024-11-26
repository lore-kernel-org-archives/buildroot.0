Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF4AD6554C
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 18:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44BEE6070A;
	Tue, 26 Nov 2024 18:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQNiaVLGkxw4; Tue, 26 Nov 2024 18:38:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AFDC6070C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AFDC6070C;
	Tue, 26 Nov 2024 18:38:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 874111DA8
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 18:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5522B405D9
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 18:38:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xunMyaEQQJV1 for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 18:38:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3CD1404C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3CD1404C8
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 18:38:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA0AD866B9; Tue, 26 Nov 2024 18:38:01 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 26 Nov 2024 19:34:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 45d74a3fe1295b9da71d067de217457b2e510eff
X-Git-Newrev: d0a21056dac1d248d3e05c5dc7335f7d8896ecfd
X-Patchwork-Hint: ignore
Message-Id: <20241126183801.DA0AD866B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openocd: drop
 non-existing libhid support
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0a21056dac1d248d3e05c5dc7335f7d8896ecfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This was added by commit aa441aa84c38a (openocd: bump to version 0.8.0) ~10
years ago, but openocd 0.8.0 (or any later version) does not contain any
libhid support, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openocd/openocd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 6b9f5541cd..78f872fa76 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -55,7 +55,6 @@ OPENOCD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBFTDI1),libftdi1) \
 	$(if $(BR2_PACKAGE_LIBUSB),libusb) \
 	$(if $(BR2_PACKAGE_LIBUSB_COMPAT),libusb-compat) \
-	$(if $(BR2_PACKAGE_LIBHID),libhid) \
 	$(if $(BR2_PACKAGE_HIDAPI),hidapi)
 
 ifeq ($(BR2_PACKAGE_LIBGPIOD),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
