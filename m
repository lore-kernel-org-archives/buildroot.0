Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75243C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 19:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FFE1842C0;
	Sat,  1 Jun 2024 19:37:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4-RhlMq-IxhY; Sat,  1 Jun 2024 19:37:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46B49842BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46B49842BE;
	Sat,  1 Jun 2024 19:37:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A8EF11BF846
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 19:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 966E660901
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 19:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ylb6k8oSGQ28 for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 19:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A8E2605ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A8E2605ED
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 19:37:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F5A2875F1; Sat,  1 Jun 2024 19:37:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jun 2024 21:35:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5806419b9150e7d019a2a8fe13f184c6943cc171
X-Git-Newrev: 7eb1ea5b6548270eb736054be87a250ea975ff6d
X-Patchwork-Hint: ignore
Message-Id: <20240601193707.4F5A2875F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mtd: switch to https mirror
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

commit: https://git.buildroot.net/buildroot/commit/?id=7eb1ea5b6548270eb736054be87a250ea975ff6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As mentioned in the last release notes, there is an https mirror[1].
Switch to this as ftp is not as widely supported anymore.

[1] https://lists.infradead.org/pipermail/linux-mtd/2023-August/100922.html

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mtd/mtd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 998cc419b3..39b9f2a523 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -6,7 +6,7 @@
 
 MTD_VERSION = 2.1.6
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
-MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
+MTD_SITE = https://infraroot.at/pub/mtd
 MTD_LICENSE = GPL-2.0
 MTD_LICENSE_FILES = COPYING
 MTD_CPE_ID_VENDOR = mtd-utils_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
