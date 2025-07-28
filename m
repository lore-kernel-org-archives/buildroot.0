Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC5CC83F17
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 23:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 975AD410DB;
	Mon, 28 Jul 2025 23:03:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eOs1Vp0u8cip; Mon, 28 Jul 2025 23:03:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADD66410A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADD66410A6;
	Mon, 28 Jul 2025 23:03:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B411815C
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 23:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5BBB410A6
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 23:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zek62FSn3hdf for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 23:03:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF5144108A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF5144108A
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 23:03:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E84E186C21; Mon, 28 Jul 2025 23:03:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Jul 2025 00:54:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60fe9b37333fe08c29037ebc0c6aa60736a9ca3f
X-Git-Newrev: 279cb43814abe9e3452541a0e69e2f3945aa2b1b
X-Patchwork-Hint: ignore
Message-Id: <20250728230322.E84E186C21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/orc: add CPE identifier
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=279cb43814abe9e3452541a0e69e2f3945aa2b1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The cpe:2.3:a:gstreamer:orc:0.4.34:*:*:*:*:*:*:* is
valid for this package.

See https://nvd.nist.gov/products/cpe/detail/37DFA009-0707-4825-B28A-62451B1E2AFC

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/orc/orc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index b2d2bb461b..436dc9d629 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -9,6 +9,7 @@ ORC_SOURCE = orc-$(ORC_VERSION).tar.xz
 ORC_SITE = http://gstreamer.freedesktop.org/data/src/orc
 ORC_LICENSE = BSD-2-Clause, BSD-3-Clause
 ORC_LICENSE_FILES = COPYING
+ORC_CPE_ID_VENDOR = gstreamer
 ORC_INSTALL_STAGING = YES
 ORC_DEPENDENCIES = host-orc
 ORC_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
