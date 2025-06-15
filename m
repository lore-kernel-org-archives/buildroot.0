Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17E9C61CE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 17:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 485FB80E66;
	Sun, 15 Jun 2025 17:36:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HRP5TdKu--IS; Sun, 15 Jun 2025 17:36:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 841C380DC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 841C380DC5;
	Sun, 15 Jun 2025 17:36:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 00A5B198
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 17:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA00860A5B
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 17:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q8RbzBv_scLG for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 17:36:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A171660898
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A171660898
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 17:36:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F19583A1D; Sun, 15 Jun 2025 17:36:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jun 2025 19:10:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15996bc4ffed232b238d825351244aeeb31babbd
X-Git-Newrev: cae9a45e55b47dc08eb17e0610340cbb30903cf5
X-Patchwork-Hint: ignore
Message-Id: <20250615173603.8F19583A1D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: security bump version to
 4.21.6
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cae9a45e55b47dc08eb17e0610340cbb30903cf5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://www.samba.org/samba/history/samba-4.21.5.html
https://www.samba.org/samba/history/samba-4.21.6.html

Version 4.21.6 fixes CVE-2025-0620:
https://www.samba.org/samba/security/CVE-2025-0620.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 86b11b4d1f..6c4205853e 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.21.4.tar.asc
-sha256  50acf030db0ce6be1ee8a6c3a7636e54576c60a7f814e64becfa840f7b30eced  samba-4.21.4.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.21.6.tar.asc
+sha256  681bad60f57959436350751bc89e893b8c106ac882cc7420f93f419e1d188688  samba-4.21.6.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 828de56fc8..7ba0aa3346 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.21.4
+SAMBA4_VERSION = 4.21.6
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
