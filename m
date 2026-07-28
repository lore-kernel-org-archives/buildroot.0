Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2907C5516F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 783BC81196;
	Fri, 31 Jul 2026 11:57:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nzyrF9W-4Dka; Fri, 31 Jul 2026 11:57:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9811F811CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499033;
	bh=g4iB0CIc0xn9xArgbAXercojGg1WbcOymtI6ITFJa8k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DSfJS3d/ZSZxW+o4doCFEUEtp/O9KcfxJdFi3Rf0k/iJweH8E0Vs9xM3om0WMQC2o
	 rJLnDw+KfbTgF/ioRyHm3EnjJ67UXzir52rvXiqm6wyhcrEQ/y1nGh3azI9qFkSZH+
	 X+VEfzw690e8VzZ2w0UJ4EzbBoMxPwr3QMflIqmfcLYyls48D5uC80WNev1UqXlost
	 pX+/h0IcQzCOyqj+j5+2HrB1N0Z1Hmi28XA5QeW6MojmHmdZC9apXJCVuUiHkSylnt
	 w2IlznDij9gq4DFJbcRAZnlJws5F84rx+P7mY2nDuqDrX0NWtFjQbShZb8gLv9yHpm
	 qcKu/moddbbXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9811F811CB;
	Fri, 31 Jul 2026 11:57:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C29A37F
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3330560825
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xRsYt42cLSZx for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:56:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D89B460AAE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D89B460AAE
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9DD28B741; Fri, 31 Jul 2026 11:56:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 12:19:13 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: c1b826e803a78c06ca4c15a18bab9276dd4454aa
X-Git-Newrev: d3c2724f06638a4254a5c0c47bd2859de5e9ab81
X-Patchwork-Hint: ignore
Message-Id: <20260731115605.C9DD28B741@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/initscripts: add
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d3c2724f06638a4254a5c0c47bd2859de5e9ab81
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
