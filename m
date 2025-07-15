Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA48C83F3B
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13AAD415A3;
	Thu, 17 Jul 2025 20:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UcKV3creHav4; Thu, 17 Jul 2025 20:33:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A5F141782
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A5F141782;
	Thu, 17 Jul 2025 20:33:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 084181A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05AFC60768
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qypr1pAsePqa for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F0FF6085B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F0FF6085B
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D0988667E; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 22:59:17 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 8071e5634185a59a46f7ebc7eca20b84a448e076
X-Git-Newrev: ffbe08e6fb766c364b599fe3f24a4e5771aa7958
X-Patchwork-Hint: ignore
Message-Id: <20250717203256.7D0988667E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/eudev: remove
 obsolete --disable-introspection configure flag
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ffbe08e6fb766c364b599fe3f24a4e5771aa7958
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

It was removed from eudev with version 1.5.1, when introspection
became part of the gudev option [1]. This has in turn been removed and
replaced by package/libgudev, yet somehow the flag stayed. Remove it
to remove a warning during configure stage.

[1] https://github.com/eudev-project/eudev/commit/d5d6a7f3040992f853eb23eb1bafac3b77891c2d

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 993c0ba4603fb86137effef288207a2acdcd7f01)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/eudev/eudev.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 8318bc1ed4..99c9f0dcab 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -14,7 +14,6 @@ EUDEV_CONF_OPTS = \
 	--disable-manpages \
 	--sbindir=/sbin \
 	--libexecdir=/lib \
-	--disable-introspection \
 	--enable-kmod \
 	--enable-blkid
 
@@ -71,7 +70,6 @@ HOST_EUDEV_CONF_OPTS = \
 	--with-rootlibdir=/lib \
 	--sysconfdir=/etc \
 	--disable-blkid \
-	--disable-introspection \
 	--disable-kmod \
 	--disable-manpages \
 	--disable-rule-generator \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
