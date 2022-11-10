Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFC3C433FE
	for <buildroot@archiver.kernel.org>; Thu, 10 Nov 2022 10:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9509160F0F;
	Thu, 10 Nov 2022 10:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9509160F0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PLQE04ytQDUH; Thu, 10 Nov 2022 10:16:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C71D760EA6;
	Thu, 10 Nov 2022 10:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C71D760EA6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 398A81BF842
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 10:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1564860EA6
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 10:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1564860EA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5VRdnpMp4KHM for <buildroot@lists.busybox.net>;
 Thu, 10 Nov 2022 10:16:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E78560AB9
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E78560AB9
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 10:16:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DCE4D1814B9; Thu, 10 Nov 2022 11:16:45 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 10 Nov 2022 11:16:21 +0100
Message-Id: <20221110101621.181532-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1668075406; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=ehYpO9QJxa9XSiG8qSnBZhHjAl2+nCl4ifHRE/OzSGg=;
 b=TWWRoE0ccrX0c2EzIzAXq9kZLTnVsUroqCcKllzKSybzEsMv0q954dv53Ew/vkQKgAU27j
 b+aSkYiRuWpH/cU04JmbVW3iYDa7jG31t3NeT35nJS/Weg+sZCKtOLjXnTjgrQU7S2Sewv
 3UM6yQNos+AM1NcyfRaeusNuzv2iqL8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256 header.s=dkim
 header.b=TWWRoE0c
Subject: [Buildroot] From: Michael Nosthoff <buildroot@heine.tech>
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Mon@osuosl.org, 1b4dd3f794a9c04fa4f963db7ac145986efffc4e@osuosl.org,
 17@osuosl.org, =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>,
 rom@osuosl.org, 2001@osuosl.org, Sep@osuosl.org, "00:00:00"@osuosl.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

when using BR2_PER_PACKAGE_DIRECTORIES and configuring swupdate to
use uboot the build fails because libubootenv is not a dependency.

Fixes:
bootloader/uboot.c:23:10: fatal error: libuboot.h: No such file or directory
   23 | #include <libuboot.h>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---

v2:
 - exchange "buildroot" with "uboot" in the description

observed on buildroot 2022.08.1 so I guess older version might also need the fix.
CC: Peter Korsgaard <peter@korsgaard.com>
---
 package/swupdate/swupdate.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index bfc161d490..ed0c1e56a8 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -81,6 +81,10 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBGPIOD=n
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUBOOTENV),y)
+SWUPDATE_DEPENDENCIES += libubootenv
+endif
+
 ifeq ($(BR2_PACKAGE_LIBURIPARSER),y)
 SWUPDATE_DEPENDENCIES += liburiparser
 SWUPDATE_MAKE_ENV += HAVE_URIPARSER=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
