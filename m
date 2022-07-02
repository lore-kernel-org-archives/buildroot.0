Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10529C43334
	for <buildroot@archiver.kernel.org>; Sat,  2 Jul 2022 13:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B03E040920;
	Sat,  2 Jul 2022 13:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B03E040920
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10Sir_B7umtx; Sat,  2 Jul 2022 13:57:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB12F409EC;
	Sat,  2 Jul 2022 13:57:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB12F409EC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2DBB51BF962
 for <buildroot@lists.busybox.net>; Sat,  2 Jul 2022 13:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08549409B0
 for <buildroot@lists.busybox.net>; Sat,  2 Jul 2022 13:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08549409B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wb8QF2_vvWQi for <buildroot@lists.busybox.net>;
 Sat,  2 Jul 2022 13:56:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 420BB40538
 for <buildroot@buildroot.org>; Sat,  2 Jul 2022 13:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 420BB40538
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 35FD3878B4; Sat,  2 Jul 2022 13:43:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 2 Jul 2022 15:55:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 017dbc770c4fd58d7d52cf290dd3fc39a3603e0d
X-Git-Newrev: faeebe0858f40d18d7527b7d1de6a6868004c9e6
X-Patchwork-Hint: ignore
Message-Id: <20220702134313.35FD3878B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/watchdogd: install to staging
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

commit: https://git.buildroot.net/buildroot/commit/?id=faeebe0858f40d18d7527b7d1de6a6868004c9e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14881

The package provides a library and a .pc file, so install it into staging as
well.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/watchdogd/watchdogd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/watchdogd/watchdogd.mk b/package/watchdogd/watchdogd.mk
index 1a9d04d938..ea033b4e71 100644
--- a/package/watchdogd/watchdogd.mk
+++ b/package/watchdogd/watchdogd.mk
@@ -9,6 +9,7 @@ WATCHDOGD_SITE = https://github.com/troglobit/watchdogd/releases/download/$(WATC
 WATCHDOGD_LICENSE = ISC
 WATCHDOGD_LICENSE_FILES = LICENSE
 WATCHDOGD_CPE_ID_VENDOR = troglobit
+WATCHDOGD_INSTALL_STAGING = YES
 WATCHDOGD_DEPENDENCIES = host-pkgconf libconfuse libite libuev
 WATCHDOGD_CONF_OPTS = --disable-compat --disable-examples --disable-test-mode
 WATCHDOGD_SELINUX_MODULES = watchdog
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
