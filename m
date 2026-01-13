Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A992D30CC0
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FC5C40E41;
	Tue, 13 Jan 2026 21:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HWwsNkWUvzpH; Tue, 13 Jan 2026 21:00:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E111140E26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338031;
	bh=ML9PZQ2pCOHsqlKCq3D+3EGZBwuSJKsNUp70rJpktgY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L3iOS9jOdQgTsaV55G+WQn5qtZJcUP4h6oMx7I7EXxEBgXdH8HyIZPQzPbeGetBrW
	 Ta8ICvIG8mJNTydroxQ+IOxYu2Ac4VEafsPRPyBftkiEhXdNpLHrRGUVhvKGcfZIRW
	 pn/4B5OnyW7uY7cu+0ePhXTz+MF7HGC0j53qJylojwCQCgM0u14gfNxS1QBd0AcUDQ
	 gD0KIFIIJkjZJhiqdPLXy0ix696pGKIXfq0l1PVMREB5RGnI1g5YKPGPohA47isbbN
	 s8w/SKvg+/DqYI67tZXVESOtRW140lft8R08bSg9JBfetF6LCLS0kxY2PC+EOFdw1W
	 vM3NgjGjY8rtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E111140E26;
	Tue, 13 Jan 2026 21:00:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AFAB1CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 21:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65C1540084
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nc7zUmqb0lh1 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C40E940798
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C40E940798
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C264080E26; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59b504e03d33dfa32cfb368470631c05e39a4a80
X-Git-Newrev: ab8fdd0b909f4af229f5650a6fca11214707c523
X-Patchwork-Hint: ignore
Message-Id: <20260113205850.C264080E26@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xutil_makedepend: bump
 version to 1.0.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab8fdd0b909f4af229f5650a6fca11214707c523
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-February/003457.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xutil_makedepend/xutil_makedepend.hash | 6 +++---
 package/x11r7/xutil_makedepend/xutil_makedepend.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.hash b/package/x11r7/xutil_makedepend/xutil_makedepend.hash
index e2fe117f10..064bb0aadd 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.hash
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003300.html
-sha256  bfb26f8025189b2a01286ce6daacc2af8fe647440b40bb741dd5c397572cba5b  makedepend-1.0.8.tar.xz
-sha512  6707b1107c07d4ffbcf008181e877d18a0bcc4aea03860ee1158f5630c7fdce4cf9ad7bee3b38ee420c3a44819ed4b56a6f2428a5b695c0dbd17fb3e60825a6d  makedepend-1.0.8.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-February/003457.html
+sha256  92d0deb659fff6d8ddbc1d27fc4ca8ceb2b6dbe15d73f0a04edc09f1c5782dd4  makedepend-1.0.9.tar.xz
+sha512  68d289656314dc9f12c792d0e394cfbc95404a0d01155dbcb38313d451b506da48a3d44183f568a2cbb2b1d1da9e26703a0d92f2bb658f72fc968eeb03bf2fe8  makedepend-1.0.9.tar.xz
 # Locally computed
 sha256  0530078db78c47ae978dc2bd77f4f427e6cd97df868672c95b1ef284113c8cb7  COPYING
diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index 0c4a32c006..e5b940422c 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XUTIL_MAKEDEPEND_VERSION = 1.0.8
+XUTIL_MAKEDEPEND_VERSION = 1.0.9
 XUTIL_MAKEDEPEND_SOURCE = makedepend-$(XUTIL_MAKEDEPEND_VERSION).tar.xz
 XUTIL_MAKEDEPEND_SITE = https://xorg.freedesktop.org/archive/individual/util
 XUTIL_MAKEDEPEND_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
