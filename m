Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40447CD4F25
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 10:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF2B440E3A;
	Thu, 14 May 2026 10:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1AHI61XlHbZa; Thu, 14 May 2026 10:55:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11D2240E5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778756112;
	bh=5qlRWv7uhjXnsQ57dczHl9baXMj4vsPBts/kDVsCy9M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HW46bc7UyuDs1rABPPNiaLxPmyYgPqDRJsHpdkgwgtI6TV2i/VlAehNyDIKqp/uZr
	 wg1BiNOHD/r6sd+w4p+YdYXLCma7mi69xSWwNNggi5K0iXTqI7m4EQ0kWUHKsbxEH5
	 lvGCIrLIVYz2drzBftTwV6aZrOm2rm8cHny/WdoblBlEaFXzlF5GFFK1bN6IoIEVox
	 6X8xcwTTac38ZrYwnxelYgGqyae7qF0m+J45nTQ02/Ugl/swyRa2dNuKzZEFSdk+uL
	 d+5h8YkG6ibJfFKE217E4AcLPuY78K2NDnj3TEeFP8SYhxt6U3q7ag3XIYr3Y57iLa
	 89sMtIs1Sz5jQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11D2240E5B;
	Thu, 14 May 2026 10:55:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 715AF37D
 for <buildroot@buildroot.org>; Thu, 14 May 2026 10:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FAB340E96
 for <buildroot@buildroot.org>; Thu, 14 May 2026 10:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TLywCevt43DO for <buildroot@buildroot.org>;
 Thu, 14 May 2026 10:55:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D01040E3A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D01040E3A
 for <buildroot@buildroot.org>; Thu, 14 May 2026 10:55:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45C8D861ED; Thu, 14 May 2026 10:55:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 May 2026 12:42:37 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e27d105dde16ffb1962edbfe5edf059d55ec7f2a
X-Git-Newrev: a562b8c3aa8f47976c4eb10dc9723f1dc86e5d56
X-Patchwork-Hint: ignore
Message-Id: <20260514105504.45C8D861ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libgit2: bump version
 to 1.9.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a562b8c3aa8f47976c4eb10dc9723f1dc86e5d56
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Release notes:
https://github.com/libgit2/libgit2/releases/tag/v1.9.3

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index e8c155c994..11eab3001c 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6f097c82fc06ece4f40539fb17e9d41baf1a5a2fc26b1b8562d21b89bc355fe6  libgit2-1.9.2.tar.gz
+sha256  d532172d7ab24d2a25944e2434212d63ee85f3650e97b5f7579e7f201a78ad64  libgit2-1.9.3.tar.gz
 sha256  e3712465634e97cfd850822a4eb5ac7d2f8a10f753189366d5a2060046f28288  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 34cb67929e..b2607a178a 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.9.2
+LIBGIT2_VERSION = 1.9.3
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
