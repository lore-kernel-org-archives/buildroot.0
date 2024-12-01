Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17A5D49782
	for <buildroot@archiver.kernel.org>; Sun,  1 Dec 2024 17:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B7134AE77;
	Sun,  1 Dec 2024 17:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0P8_8yxDJcD; Sun,  1 Dec 2024 17:45:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A8C64A150
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A8C64A150;
	Sun,  1 Dec 2024 17:45:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F151977
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 17:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E335C84FAD
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 17:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jAQr-7a2b6uF for <buildroot@buildroot.org>;
 Sun,  1 Dec 2024 17:45:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED83C84C43
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED83C84C43
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 17:45:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E64D8867C9; Sun,  1 Dec 2024 17:45:50 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Dec 2024 18:42:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a6a92a08b35ccecd1ed70feae97a247c7a8bb8aa
X-Git-Newrev: 2f47195d540f63543728fd4982f2e6ae8aac2b2b
X-Patchwork-Hint: ignore
Message-Id: <20241201174550.E64D8867C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cage: bump to version
 0.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f47195d540f63543728fd4982f2e6ae8aac2b2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog: [1].

Also, upstream commit [2], included in v0.2, removed the "xwayland"
build time option. This commit removes the corresponding
CAGE_CONF_OPTS.

The cage github project was moved from [3] to [4]. See also [5].
This commit also updates the _SITE url accordingly.

[1] https://github.com/cage-kiosk/cage/releases/tag/v0.2.0
[2] https://github.com/cage-kiosk/cage/commit/d3fb99d6654325ec46277cfdb589f89316bed701
[3] https://github.com/Hjdskes/cage
[4] https://github.com/cage-kiosk/cage
[5] https://github.com/cage-kiosk/cage/commit/9a4310f8b6d40be49ca3065742c7462278b1316e

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
[Julien:
  - add new line before S-o-b
  - add link justifying the removal of xwayland option
  - update _SITE
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cage/cage.hash |  6 ++++--
 package/cage/cage.mk   | 10 ++--------
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/package/cage/cage.hash b/package/cage/cage.hash
index d5517bd918..e7c971ea26 100644
--- a/package/cage/cage.hash
+++ b/package/cage/cage.hash
@@ -1,5 +1,7 @@
-# Generated locally after checking GPG signature from https://github.com/cage-kiosk/cage/releases/download/v0.1.5/cage-0.1.5.tar.gz.sig
-sha256  ece0312e559289df0238289ea6c60e9fed32d27fe3ae8a8f83eeff26ddc239e1  cage-0.1.5.tar.gz
+# Locally calculated after checking pgp signature
+# https://github.com/cage-kiosk/cage/releases/download/v0.2.0/cage-0.2.0.tar.gz.sig
+# with key 34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48 "emersion <contact@emersion.fr>"
+sha256  557c194d18af7202a9ec2e8be6dd7129f6c16d0f4528f4079ba26ccd57b6ef88  cage-0.2.0.tar.gz
 
 # Hashes for license files:
 sha256  e117104073335dbaf78596fb1bedf89dda63c71f60f0b665947b2d369c77ecee  LICENSE
diff --git a/package/cage/cage.mk b/package/cage/cage.mk
index 119950bc00..6fa39122ee 100644
--- a/package/cage/cage.mk
+++ b/package/cage/cage.mk
@@ -4,17 +4,11 @@
 #
 ################################################################################
 
-CAGE_VERSION = 0.1.5
-CAGE_SITE = https://github.com/Hjdskes/cage/releases/download/v$(CAGE_VERSION)
+CAGE_VERSION = 0.2.0
+CAGE_SITE = https://github.com/cage-kiosk/cage/releases/download/v$(CAGE_VERSION)
 CAGE_LICENSE = MIT
 CAGE_LICENSE_FILES = LICENSE
 CAGE_DEPENDENCIES = host-pkgconf wlroots
 CAGE_CONF_OPTS = -Dman-pages=disabled
 
-ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
-CAGE_CONF_OPTS += -Dxwayland=true
-else
-CAGE_CONF_OPTS += -Dxwayland=false
-endif
-
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
