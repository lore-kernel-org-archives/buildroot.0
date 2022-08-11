Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D01C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 11:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E3E44032A;
	Thu, 11 Aug 2022 11:13:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E3E44032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jeeuTSVZKLQA; Thu, 11 Aug 2022 11:13:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C312403A2;
	Thu, 11 Aug 2022 11:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C312403A2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BFC31BF38C
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 381164032A
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 381164032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VZjDnUGPbWHx for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 11:13:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75C094026A
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 11:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75C094026A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 52E3D8710D; Thu, 11 Aug 2022 10:58:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 13:09:31 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 9fb74b0152b35065f63418a53f1888f8c1a5fd1f
X-Git-Newrev: 6b80ec9cac889a9cf1cdff6bd8582caccb6e95be
X-Patchwork-Hint: ignore
Message-Id: <20220811105854.52E3D8710D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package: pcsc-lite:
 pcsc_demo is under BSD-3-Clause and not GPL-3.0-or-later
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b80ec9cac889a9cf1cdff6bd8582caccb6e95be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Since commit b01f19fb9361 ("pcsc_demo: change licence from GPLv3 to
BSD") in pcsclite, the license of pcsc_demo is BSD-3-Clause and not
GPL-3.0-or-later, so let's update the package license information.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6a6cd7e4d306e59f583a161576d5e73d39d5e993)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcsc-lite/pcsc-lite.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 5bf9ce7f30..1602b9df05 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -9,7 +9,7 @@ PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
 PCSC_LITE_SITE = https://pcsclite.apdu.fr/files
 PCSC_LITE_INSTALL_STAGING = YES
 PCSC_LITE_DEPENDENCIES = host-pkgconf host-flex
-PCSC_LITE_LICENSE = BSD-2-Clause (auth), BSD-3-Clause, GPL-3.0+ (demo, spy, tests), ISC (simclist)
+PCSC_LITE_LICENSE = BSD-2-Clause (auth), BSD-3-Clause, GPL-3.0+ (spy, tests), ISC (simclist)
 PCSC_LITE_LICENSE_FILES = COPYING GPL-3.0.txt
 PCSC_LITE_SELINUX_MODULES = pcscd
 PCSC_LITE_CONF_OPTS = --disable-strict
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
