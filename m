Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98890FED3FA
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 20:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43EFA80AEF;
	Fri, 24 Apr 2026 20:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9F0aX7Bfoq5J; Fri, 24 Apr 2026 20:23:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6117C80EF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777062220;
	bh=K5cuZPHNc1oYqy2c2LoYJe7W6SC48tXvXcj7nVKTOWI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QbZITC+hyX43YfYw03LPF3qJ5niLo9A+HmbwERWblgSN0en56q1e5YBBSzcTKVdz+
	 jfI9NCxx34daD6JsbdGCGee9HqbyOXZ5iopKCZRgwg98C3dAWB+ulQwuGTml3fFrrr
	 kYOYrHxZ8U5Hc/y6t9GLjgmTiJHefg9Vbzg9n9fAIIbUWSwNe+/+JY2aPNbDT+yO8+
	 zLz+o9M84mO0etAj9wsW728maNBMTlW08F6lIMLROE/vcidlxXoJ7AITGVYiKZUbAI
	 haN3Lr+wGuSvPWW56OdpTx2kGouQ6ZjxjaHcuit1KNueFp1OsCF4jXGiMfSj/1lFhP
	 RgB3iDU0iEXJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6117C80EF4;
	Fri, 24 Apr 2026 20:23:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 58AF4231
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 20:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 361CE40AF0
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 20:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qFEp_hidMJ87 for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 20:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51FC140AEE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51FC140AEE
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 20:23:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEBC182BD6; Fri, 24 Apr 2026 20:23:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 22:10:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa3603d9df9834a43d5758cade8c633e1d52887d
X-Git-Newrev: 7312fcd4b62a68a6257c6ad1df2d7a331ba15479
X-Patchwork-Hint: ignore
Message-Id: <20260424202337.EEBC182BD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/doxygen: bump to version 1.16.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7312fcd4b62a68a6257c6ad1df2d7a331ba15479
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- Fix topics navigation regression in HTML
- Fix sub group documentation generation
- Fix group name/title handling in @retval
- Fix Doxyfile documentation and Windows binary naming
- Improve LaTeX compatibility

https://www.doxygen.nl/manual/changelog.html#log_1_16_1

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/doxygen/doxygen.hash | 2 +-
 package/doxygen/doxygen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/doxygen/doxygen.hash b/package/doxygen/doxygen.hash
index ec46705d29..cc57b6f40b 100644
--- a/package/doxygen/doxygen.hash
+++ b/package/doxygen/doxygen.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  a8cafe605867ad475aaf288a3852783076e1df83aabf16488bbfa958062e7440  doxygen-1.15.0.src.tar.gz
+sha256  201ce33b514ea87cc1697c0dcf829692c2695c1812683a9cc622194b05e263a8  doxygen-1.16.1.src.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/doxygen/doxygen.mk b/package/doxygen/doxygen.mk
index c31271197d..370d0d0d4b 100644
--- a/package/doxygen/doxygen.mk
+++ b/package/doxygen/doxygen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOXYGEN_VERSION = 1.15.0
+DOXYGEN_VERSION = 1.16.1
 DOXYGEN_SOURCE = doxygen-$(DOXYGEN_VERSION).src.tar.gz
 DOXYGEN_SITE = https://sourceforge.net/projects/doxygen/files/rel-$(DOXYGEN_VERSION)
 DOXYGEN_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
