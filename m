Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004BCCAC5B5
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 10:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9DA14069E;
	Sun, 28 Sep 2025 10:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l2RwY3AIi0Mj; Sun, 28 Sep 2025 10:19:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 195C04069C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 195C04069C;
	Sun, 28 Sep 2025 10:19:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F910FBC
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 061A1401C2
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fb1-cnannG-k for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 10:19:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B25B401A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B25B401A4
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:19:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34194865C0; Sun, 28 Sep 2025 10:19:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Sep 2025 12:17:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00fb3a57cbaedb8df43f75f0e891423c1ef7d8c6
X-Git-Newrev: 151be15aa8c71cc5c2c4f56019a641b8aa26f6ad
X-Patchwork-Hint: ignore
Message-Id: <20250928101948.34194865C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cage: bump to version
 v0.2.0-15-g2e593fe5a
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

commit: https://git.buildroot.net/buildroot/commit/?id=151be15aa8c71cc5c2c4f56019a641b8aa26f6ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wlroots 0.19.0 includes API breaking changes.

This commit bump the cage version to include the upstream commit [1]
which updates to this new wlroots API.

[1] https://github.com/cage-kiosk/cage/commit/9ad44e4f521edf446ad66559726e6deeb8204101

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
[Julien: change _VERSION to use "git describe --abbrev=40" format]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cage/cage.hash | 6 ++----
 package/cage/cage.mk   | 5 +++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/cage/cage.hash b/package/cage/cage.hash
index e7c971ea26..4d376c322d 100644
--- a/package/cage/cage.hash
+++ b/package/cage/cage.hash
@@ -1,7 +1,5 @@
-# Locally calculated after checking pgp signature
-# https://github.com/cage-kiosk/cage/releases/download/v0.2.0/cage-0.2.0.tar.gz.sig
-# with key 34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48 "emersion <contact@emersion.fr>"
-sha256  557c194d18af7202a9ec2e8be6dd7129f6c16d0f4528f4079ba26ccd57b6ef88  cage-0.2.0.tar.gz
+# Locally computed
+sha256  6b72e034c78c55432ad815e651ead8bd732ccc2087b08c666a68b865ba72ceff  cage-v0.2.0-15-g2e593fe5a8a2186a558ceb414674775e4ba5d2b1-git4.tar.gz
 
 # Hashes for license files:
 sha256  e117104073335dbaf78596fb1bedf89dda63c71f60f0b665947b2d369c77ecee  LICENSE
diff --git a/package/cage/cage.mk b/package/cage/cage.mk
index 6fa39122ee..7f8fff4833 100644
--- a/package/cage/cage.mk
+++ b/package/cage/cage.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-CAGE_VERSION = 0.2.0
-CAGE_SITE = https://github.com/cage-kiosk/cage/releases/download/v$(CAGE_VERSION)
+CAGE_VERSION = v0.2.0-15-g2e593fe5a8a2186a558ceb414674775e4ba5d2b1
+CAGE_SITE = https://github.com/cage-kiosk/cage.git
+CAGE_SITE_METHOD = git
 CAGE_LICENSE = MIT
 CAGE_LICENSE_FILES = LICENSE
 CAGE_DEPENDENCIES = host-pkgconf wlroots
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
