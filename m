Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFF6C5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0707660AFF;
	Fri, 31 Jul 2026 11:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0nMB4vM5zDl; Fri, 31 Jul 2026 11:58:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2837C60B11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499110;
	bh=9d0J1OXi8yhHLSJNnX+lHSdmCoYbqJcoxFeIutkZzI4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NZgJMXqF8yBo2VSpDmSvCwZnIoDTVtvY/sFbLGtnHcoIK1wBkgZ0dc1sU1ktNGXrg
	 5EmN4rATz8JWbCs4ytGw+Nfuay3OGtGASxfBujbOAbB5uqrcbJII2YiL2KwcSBaGu6
	 UP07vTy7O9NoIM8/91Y8gionX6U8BAhQmlmASDsuyOPcCH7R1u9HEYR39DZAl/mjbI
	 htyTqPcF38xEof5UqccqqQk+l8i7f8KlTcHcGmiJlqmevv1Qvl0yLx5NV5lEO05oCM
	 mnNZnkxa6FMe+oczjeMtBRi4PxH+8F3O5LF7pOmcjyScdVo08nrIm6l1hPaVa6Pxsz
	 zdaRSN3y8ByDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2837C60B11;
	Fri, 31 Jul 2026 11:58:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B903A2CE
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6E2940F85
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXE21J1HNmpf for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:58:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2135D40FB0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2135D40FB0
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 128928B741; Fri, 31 Jul 2026 11:57:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 12:19:18 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fd9289bfefb39391767d463a33150d71ee9f7aba
X-Git-Newrev: 472efcd1765e7d634109faf0477492a4e2edcb21
X-Patchwork-Hint: ignore
Message-Id: <20260731115730.128928B741@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/urandom-scripts:
 add license info
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/472efcd1765e7d634109faf0477492a4e2edcb21
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The package is part of Buildroot and thus under GPL-2.0-or-later
unless stated otherwise, as described in COPYING.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0f80126bfe8549b2e41a50a884af55fe9872be1f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/urandom-scripts/urandom-scripts.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/urandom-scripts/urandom-scripts.mk b/package/urandom-scripts/urandom-scripts.mk
index 89abdfff72..cc5f28d13a 100644
--- a/package/urandom-scripts/urandom-scripts.mk
+++ b/package/urandom-scripts/urandom-scripts.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+URANDOM_SCRIPTS_LICENSE = GPL-2.0-or-later
+
 define URANDOM_SCRIPTS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 $(URANDOM_SCRIPTS_PKGDIR)/S01seedrng \
 		$(TARGET_DIR)/etc/init.d/S01seedrng
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
