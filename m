Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DA5C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EA6D401C8;
	Thu,  9 May 2024 16:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tNiGvcFSgd5c; Thu,  9 May 2024 16:43:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33B85401D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33B85401D1;
	Thu,  9 May 2024 16:43:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F36C1BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1947860648
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKcGMOkuPuLx for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:43:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 567A86060C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 567A86060C
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:43:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FAAD86CDC; Thu,  9 May 2024 16:43:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 18:42:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a91a245ec04e992c7ac6709c701380fdf5e3655e
X-Git-Newrev: a9e54f2cdf2717dcd7e87a4fb8d641a1206eeed3
X-Patchwork-Hint: ignore
Message-Id: <20240509164356.2FAAD86CDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/evemu: add staging installation
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9e54f2cdf2717dcd7e87a4fb8d641a1206eeed3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To make the evdev library available for other packages, install it to the
staging directory.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/evemu/evemu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index b27033afa4..886ceb1142 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -9,6 +9,7 @@ EVEMU_SITE = http://www.freedesktop.org/software/evemu
 EVEMU_SOURCE = evemu-$(EVEMU_VERSION).tar.xz
 EVEMU_LICENSE = LGPL-3.0 (library), GPL-3.0 (tools)
 EVEMU_LICENSE_FILES = COPYING
+EVEMU_INSTALL_STAGING = YES
 
 # asciidoc used to generate manpages, which we don't need, and if it's
 # present on the build host, it ends getting called with our host-python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
