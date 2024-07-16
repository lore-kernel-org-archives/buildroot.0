Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B50C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 12:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29BAF40BC8;
	Tue, 16 Jul 2024 12:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTFafwJMaavt; Tue, 16 Jul 2024 12:39:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2C2340BBF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2C2340BBF;
	Tue, 16 Jul 2024 12:39:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BBD731BF38A
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E8748107C
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g9B4H2l_cyM0 for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 12:39:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FD31810CF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FD31810CF
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 12:39:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C22C86B37; Tue, 16 Jul 2024 12:39:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 14:38:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37dded43ae681e8319d7b76f9a612c71991467a9
X-Git-Newrev: a845781866a5de8ae5a60bc447ee130ccc012e49
X-Patchwork-Hint: ignore
Message-Id: <20240716123912.3C22C86B37@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flashrom: install to staging
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

commit: https://git.buildroot.net/buildroot/commit/?id=a845781866a5de8ae5a60bc447ee130ccc012e49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will be needed for the upcoming fwupd package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flashrom/flashrom.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index ed11b4ed31..60774b9621 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -9,6 +9,7 @@ FLASHROM_SOURCE = flashrom-v$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE = https://download.flashrom.org/releases
 FLASHROM_LICENSE = GPL-2.0+
 FLASHROM_LICENSE_FILES = COPYING
+FLASHROM_INSTALL_STAGING = YES
 FLASHROM_CONF_OPTS = \
 	-Dclassic_cli=enabled \
 	-Dclassic_cli_print_wiki=disabled \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
