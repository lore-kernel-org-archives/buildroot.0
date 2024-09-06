Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BBECD5BDD
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 12:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0321C8416A;
	Fri,  6 Sep 2024 12:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 191WN9gzmzze; Fri,  6 Sep 2024 12:00:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A0B084132
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A0B084132;
	Fri,  6 Sep 2024 12:00:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C1A01BF355
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 12:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A08F40BFB
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 12:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JkKfEXR7IWQ2 for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 12:00:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9678040C1F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9678040C1F
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 12:00:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8440186E9F; Fri,  6 Sep 2024 12:00:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Sep 2024 13:56:17 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 18d0a974fdc5a9575eee65b8bf323569614e564a
X-Git-Newrev: 7189e33c3c629dfc819c4723bd401f8b9470d7fc
X-Patchwork-Hint: ignore
Message-Id: <20240906120008.8440186E9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/gnutls: security
 bump version to 3.8.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=7189e33c3c629dfc819c4723bd401f8b9470d7fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Version 3.8.4 fixes CVE-2024-28834 & CVE-2024-28835.

Release notes:
3.8.4: https://lists.gnupg.org/pipermail/gnutls-help/2024-March/004845.html
3.8.5: https://lists.gnupg.org/pipermail/gnutls-help/2024-April/004846.html
3.8.6: https://lists.gnupg.org/pipermail/gnutls-help/2024-July/004848.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 904acfc41e1464848daf0240251e7701954c4918)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 47fb34ea7c..d9f830ec92 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.3.tar.xz.sig
-sha256  f74fc5954b27d4ec6dfbb11dea987888b5b124289a3703afcada0ee520f4173e  gnutls-3.8.3.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.6.tar.xz.sig
+sha256  2e1588aae53cb32d43937f1f4eca28febd9c0c7aa1734fc5dd61a7e81e0ebcdd  gnutls-3.8.6.tar.xz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  doc/COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 8a4f3345aa..7b754e215a 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -6,7 +6,7 @@
 
 # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
 GNUTLS_VERSION_MAJOR = 3.8
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).3
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).6
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
