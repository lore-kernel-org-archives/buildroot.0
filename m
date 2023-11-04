Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7E3C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 15:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AD7240A73;
	Sat,  4 Nov 2023 15:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AD7240A73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Qb5q3Vauc1t; Sat,  4 Nov 2023 15:13:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3188840A9A;
	Sat,  4 Nov 2023 15:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3188840A9A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 932A21BF868
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 15:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AE43409C8
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 15:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AE43409C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2KgAcX59VbcZ for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 15:11:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BC1D40A46
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 15:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BC1D40A46
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5513F8666B; Sat,  4 Nov 2023 15:11:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 16:10:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5483e6a6682ceca38acbb4ece7b9a7244a6bf5be
X-Git-Newrev: 95e00339d1176bda5193d7cf4c904b64f99d8e98
X-Patchwork-Hint: ignore
Message-Id: <20231104151126.5513F8666B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/watchdog: enable selinux module
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=95e00339d1176bda5193d7cf4c904b64f99d8e98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/watchdog/watchdog.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/watchdog/watchdog.mk b/package/watchdog/watchdog.mk
index 2699fb474f..c5066ad5b1 100644
--- a/package/watchdog/watchdog.mk
+++ b/package/watchdog/watchdog.mk
@@ -6,6 +6,7 @@
 
 WATCHDOG_VERSION = 5.16
 WATCHDOG_SITE = http://downloads.sourceforge.net/sourceforge/watchdog
+WATCHDOG_SELINUX_MODULES = watchdog
 WATCHDOG_LICENSE = GPL-2.0+
 WATCHDOG_LICENSE_FILES = COPYING
 # By default installs binaries in /usr/sbin/, but we want them in
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
