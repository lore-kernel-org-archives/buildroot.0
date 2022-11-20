Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2654CC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2E7942AFE;
	Mon, 20 Feb 2023 21:17:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2E7942AFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zWfXM8bdVZFa; Mon, 20 Feb 2023 21:17:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5135E42CCD;
	Mon, 20 Feb 2023 21:17:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5135E42CCD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A1DA1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1AA841592
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1AA841592
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rIK4jb-WMFXY for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0428E40C11
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0428E40C11
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9052828C8; Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Nov 2022 19:35:41 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bd42aa1d0a3ed7a5845c7b5e7c8aeb82d899699c
X-Git-Newrev: 81a02457b0f161d6a0b7c9f2f916d55983e5cb44
X-Patchwork-Hint: ignore
Message-Id: <20230220205151.E9052828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/samba4: security bump
 to version 4.15.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=81a02457b0f161d6a0b7c9f2f916d55983e5cb44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes the following security issue:

- CVE-2022-42898: Samba buffer overflow vulnerabilities on 32-bit systems
  https://www.samba.org/samba/security/CVE-2022-42898.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index f845a31290..81cbab4552 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.15.11.tar.asc
-sha256  2f305980d49c7723cbef281fff2b81a2eeafae51e58b5172bb43d9693ef8953b  samba-4.15.11.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.15.12.tar.asc
+sha256  5889493d69dc7723be6c3154387fbed38c1cddf93a16da8670d99b7cca33b15e  samba-4.15.12.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 814bf0bbaa..31f692e03d 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.15.11
+SAMBA4_VERSION = 4.15.12
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
