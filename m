Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50603C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 07:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 037F184654;
	Fri, 22 Jul 2022 07:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 037F184654
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 59ak76PwcQxE; Fri, 22 Jul 2022 07:47:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D4A384002;
	Fri, 22 Jul 2022 07:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D4A384002
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD6FA1C11A9
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96FC5817FF
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96FC5817FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J2UukRevOInW for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 07:47:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4A1C81462
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 07:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4A1C81462
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C91FB84150; Fri, 22 Jul 2022 07:33:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 09:46:23 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 39608445f3ee7a88550ff0a1fa590dd008915517
X-Git-Newrev: fa3239f7c1a5efb7d352f9d7ded9de7921bd7c5b
X-Patchwork-Hint: ignore
Message-Id: <20220722073353.C91FB84150@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/watchdogd:
 install to staging
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa3239f7c1a5efb7d352f9d7ded9de7921bd7c5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14881

The package provides a library and a .pc file, so install it into staging as
well.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit faeebe0858f40d18d7527b7d1de6a6868004c9e6)
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
