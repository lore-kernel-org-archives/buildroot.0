Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DD1EE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 22:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AD90409F1;
	Mon, 21 Aug 2023 22:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AD90409F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dey8arqG1ktt; Mon, 21 Aug 2023 22:06:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96EA34011A;
	Mon, 21 Aug 2023 22:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96EA34011A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ECBC71BF35B
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D31466112F
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D31466112F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p8plmgsMvAiR for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 22:06:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A45E26112A
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 22:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A45E26112A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9186D86035; Mon, 21 Aug 2023 22:06:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Aug 2023 16:06:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20c5bae6fa0acbb18124959e35d19d0780ffd57a
X-Git-Newrev: 2235ab809f5f081cf9d10be2c2470e472efed889
X-Patchwork-Hint: ignore
Message-Id: <20230821220640.9186D86035@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: security bump version to
 4.18.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=2235ab809f5f081cf9d10be2c2470e472efed889
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.samba.org/samba/history/samba-4.18.6.html

Includes a mitigation for CVE-2007-4559.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 1901707f3b..fb278c1124 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.18.5.tar.asc
-sha256  095256ac332e1d9fbf9b7ff7823f92a3233d3ed658ce7fc9b33905c2243f447f  samba-4.18.5.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.18.6.tar.asc
+sha256  284c8a994ce989c87cd6808c390fcb9d00c36b21a0dc1a8a75474b67c9e715e7  samba-4.18.6.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index edc0fee286..7b9e320012 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.18.5
+SAMBA4_VERSION = 4.18.6
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
