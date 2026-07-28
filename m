Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97515C5516F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F8748128E;
	Fri, 31 Jul 2026 11:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6GiDSXjstQV1; Fri, 31 Jul 2026 11:58:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 025B38127E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499104;
	bh=4I+RFNmJehVHCLDhlgOxKYSz+tbMGdmdELpP9LQX92Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GP4L9AsV7+2IptpKIZGFR1LAFFkmR1Glk3KnkkOsPh1s01yhJpjTDoMvOtlLR3vMI
	 ZwteX/oEIufmZKMgMHJHrHcQPTUsqQcfsYr7wuFVbzQCBaMznIfDPYt3a/sExpO0rF
	 2Pbrd/2vlVvhoBFI8+z/THFrNMc+aIX+cE28/kIKb2xJAZcdF3Wn2DhXD+z/ih+0oy
	 YEHM3wscVl3w6awxWQsrirIwkdLW4cFnINTbQPAMb9/JrHdWcyKNm9gPCmcBV4lODb
	 cuHAEgaYoemu9ksiAJOTwps/WLRwaNYL92zJn/xunZo4d1oSHijYFpnEXk9lXTcXE8
	 Frp321x41toYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 025B38127E;
	Fri, 31 Jul 2026 11:58:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DD8D197
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F59F810A8
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z2V7KyuKHWcT for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:58:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17B6F810AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17B6F810AE
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 09AC98B742; Fri, 31 Jul 2026 11:57:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 12:19:13 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bef982da4a9d9c6845abfb0af71ddb167998d4bf
X-Git-Newrev: fd9289bfefb39391767d463a33150d71ee9f7aba
X-Patchwork-Hint: ignore
Message-Id: <20260731115730.09AC98B742@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/initscripts: add
 license info
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fd9289bfefb39391767d463a33150d71ee9f7aba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The package is part of Buildroot and thus under GPL-2.0-or-later
unless stated otherwise, as described in COPYING.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c19a7fad93ad8fc018f326d99ad4df69c6a557cb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/initscripts/initscripts.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/initscripts/initscripts.mk b/package/initscripts/initscripts.mk
index 2e997dcd6f..d3a7a8faa1 100644
--- a/package/initscripts/initscripts.mk
+++ b/package/initscripts/initscripts.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+INITSCRIPTS_LICENSE = GPL-2.0-or-later
+
 define INITSCRIPTS_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/etc/init.d
 	$(INSTALL) -D -m 0755 package/initscripts/init.d/* $(TARGET_DIR)/etc/init.d/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
