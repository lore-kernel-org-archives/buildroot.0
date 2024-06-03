Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D41BC25B76
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 15:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF57C40950;
	Mon,  3 Jun 2024 15:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7BkvyXmdaCX5; Mon,  3 Jun 2024 15:57:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC3F140947
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC3F140947;
	Mon,  3 Jun 2024 15:57:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40ED81BF228
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 15:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 399A860A4A
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 15:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mvfiYZWUgvb5 for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 15:57:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BCA260A59
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BCA260A59
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 15:57:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3720585E50; Mon,  3 Jun 2024 15:57:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Jun 2024 17:54:10 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 5751191f2d4521125560c0022b385929a867c3fe
X-Git-Newrev: 3bababa87b305eb4f802798f580bea775d76f47f
X-Patchwork-Hint: ignore
Message-Id: <20240603155720.3720585E50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/evemu: add
 staging installation
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

commit: https://git.buildroot.net/buildroot/commit/?id=3bababa87b305eb4f802798f580bea775d76f47f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

To make the evdev library available for other packages, install it to the
staging directory.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a9e54f2cdf2717dcd7e87a4fb8d641a1206eeed3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
