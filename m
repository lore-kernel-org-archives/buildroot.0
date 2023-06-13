Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B457DC7EE29
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 12:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67B72416FA;
	Tue, 13 Jun 2023 12:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67B72416FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id upib8p8vAxAs; Tue, 13 Jun 2023 12:55:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84725403AE;
	Tue, 13 Jun 2023 12:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84725403AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F332F1BF95E
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 12:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB3ED40BA2
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 12:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB3ED40BA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4juPtAwnC2cc for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 12:54:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E69B3403AE
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 12:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E69B3403AE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3899828FB; Tue, 13 Jun 2023 12:54:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Jun 2023 14:51:36 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 4adbdb65c33ccb95a70dabeba6af8f71ba8b0eb7
X-Git-Newrev: 89c2a12022c4fa05500414044bd71421dc731cee
X-Patchwork-Hint: ignore
Message-Id: <20230613125451.D3899828FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libnftnl: bump to
 version 1.2.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=89c2a12022c4fa05500414044bd71421dc731cee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Also: Switch to tar.xz as the package is not distributed as a .bz2 any longer.
Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit eeff8d24e3fbfa85dabeee31a7623838093fa30b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnftnl/libnftnl.hash | 2 +-
 package/libnftnl/libnftnl.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index 113110fc1b..0cb3917f2d 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,3 +1,3 @@
 # From http://www.netfilter.org/projects/libnftnl/downloads.html
-sha256  e916ea9b79f9518560b9a187251a7c042442a9ecbce7f36be7908888605d0255  libnftnl-1.2.3.tar.bz2
+sha256  966de0a8120c8a53db859889749368bfb2cba0c4f0b4c1a30d264eccc45f1226  libnftnl-1.2.5.tar.xz
 sha256  98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24  COPYING
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index fd87f70091..a7045337d0 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.2.3
+LIBNFTNL_VERSION = 1.2.5
 LIBNFTNL_SITE = https://netfilter.org/projects/libnftnl/files
-LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
+LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.xz
 LIBNFTNL_LICENSE = GPL-2.0+
 LIBNFTNL_LICENSE_FILES = COPYING
 LIBNFTNL_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
