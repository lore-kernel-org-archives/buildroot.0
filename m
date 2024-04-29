Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F62C4345F
	for <buildroot@archiver.kernel.org>; Mon, 29 Apr 2024 12:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EFBA605D2;
	Mon, 29 Apr 2024 12:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fcp0kbicO3M0; Mon, 29 Apr 2024 12:06:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 721CD605E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 721CD605E7;
	Mon, 29 Apr 2024 12:06:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE79A1BF312
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 12:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB18440643
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 12:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tMYSKE0BbF4I for <buildroot@lists.busybox.net>;
 Mon, 29 Apr 2024 12:06:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E18CB4050F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E18CB4050F
 for <buildroot@buildroot.org>; Mon, 29 Apr 2024 12:06:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C95E386261; Mon, 29 Apr 2024 12:06:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 29 Apr 2024 14:06:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49c8154ee7bb2b6e720652af77961b230106ffa6
X-Git-Newrev: 206527347c1f63d24d871bf5dcb065861bd1c2a4
X-Patchwork-Hint: ignore
Message-Id: <20240429120650.C95E386261@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/speechd: set CPE_ID_VENDOR (to
 silence mismatched CVE warning)
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

commit: https://git.buildroot.net/buildroot/commit/?id=206527347c1f63d24d871bf5dcb065861bd1c2a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- set CPE_ID_VENDOR to silence mismatched CVE-2001-0956 ([1], [2]) warning
  clearly aiming some other product/version ("speechd 0.54 with Festival or
  rsynth speech synthesis package")

[1] https://security-tracker.debian.org/tracker/CVE-2001-0956
[2] https://github.com/advisories/GHSA-67cw-4jhh-3jm7

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/speechd/speechd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
index 7d50f88c1d..669bec0634 100644
--- a/package/speechd/speechd.mk
+++ b/package/speechd/speechd.mk
@@ -8,6 +8,7 @@ SPEECHD_VERSION = 0.11.5
 SPEECHD_SITE = $(call github,brailcom,speechd,$(SPEECHD_VERSION))
 SPEECHD_LICENSE = GPL-2.0+, GPL-3.0+ (buildsystem), LGPL-2.1+
 SPEECHD_LICENSE_FILES = COPYING.GPL-2 COPYING.GPL-3 COPYING.LGPL
+SPEECHD_CPE_ID_VENDOR = brailcom
 SPEECHD_INSTALL_STAGING = YES
 # speechd source code is released without configure script
 SPEECHD_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
