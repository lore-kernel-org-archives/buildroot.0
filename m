Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C977CA0EE0
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 16:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C83E060BE4;
	Wed, 13 Aug 2025 16:55:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kXYXlkt3cVJc; Wed, 13 Aug 2025 16:55:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEEA360BD1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEEA360BD1;
	Wed, 13 Aug 2025 16:55:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B6C841C9
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A867260BD1
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GgvBdGvSaQ05 for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 16:55:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05ADF60A90
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05ADF60A90
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:55:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F419A8759C; Wed, 13 Aug 2025 16:55:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 Aug 2025 18:31:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1dd235ad0dd91e1919a167a17cc9cd20a3695b2
X-Git-Newrev: 5927f9778f07f20b742201cefa344bafef0cd4f0
X-Patchwork-Hint: ignore
Message-Id: <20250813165525.F419A8759C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ofono: mark CPE as valid
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

commit: https://git.buildroot.net/buildroot/commit/?id=5927f9778f07f20b742201cefa344bafef0cd4f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default ofono_project:ofono is a valid CPE, see
https://nvd.nist.gov/products/cpe/detail/734A0A32-DA21-49B8-86BD-1A60C7CDF864

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ofono/ofono.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 1ff43092c4..ba0846e823 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -9,6 +9,7 @@ OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPL-2.0
 OFONO_LICENSE_FILES = COPYING
+OFONO_CPE_ID_VALID = YES
 OFONO_DEPENDENCIES = \
 	host-pkgconf \
 	dbus \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
