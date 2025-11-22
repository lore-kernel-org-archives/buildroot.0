Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A27CFC539
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 16:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30F7583CF5;
	Sat, 22 Nov 2025 16:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nExnsV7De7JY; Sat, 22 Nov 2025 16:29:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 567B883CFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 567B883CFE;
	Sat, 22 Nov 2025 16:29:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 167A1350
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0C5683CF5
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8P2Llw8jlUcE for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 16:29:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A57383CF2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A57383CF2
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:29:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27BC180748; Sat, 22 Nov 2025 16:29:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Nov 2025 17:24:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e51fca55f74cd6ec6cd01ff42219ba91e504804
X-Git-Newrev: bf5f1b546b408883a721dcaa1a5e660b3d72ad95
X-Patchwork-Hint: ignore
Message-Id: <20251122162946.27BC180748@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/open-plc-utils: bump version to
 git 46c3506453
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf5f1b546b408883a721dcaa1a5e660b3d72ad95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/qca/open-plc-utils/compare/1ba7d5a042e4e8ff6858b08e113eec5dc4e89cf2...46c3506453c15b873fd6ed3e76c9872cea5e143a

Upstream commit
https://github.com/qca/open-plc-utils/commit/cbf52f68b5e2ab0c4071600ab34126120e54f5cd
fixes build errors with newer gcc versions.

Instead of adding this patch to buildroot we bump to HEAD which also
includes other bug fixes and documentation updates.

Fixes:
https://autobuild.buildroot.net/results/c74/c74730bbadc9ba20cdccf448dbc508d0afbabf41/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add git commit version in commit title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/open-plc-utils/open-plc-utils.hash | 2 +-
 package/open-plc-utils/open-plc-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/open-plc-utils/open-plc-utils.hash b/package/open-plc-utils/open-plc-utils.hash
index 0ab661231a..bcb5253bb9 100644
--- a/package/open-plc-utils/open-plc-utils.hash
+++ b/package/open-plc-utils/open-plc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4b1b55896939f178321ffe1ec2dc6937ea688d577b3671a5f0edb5c3326dfa3d  open-plc-utils-1ba7d5a042e4e8ff6858b08e113eec5dc4e89cf2.tar.gz
+sha256  e02ffc2d2abde6f31c183b0717742c243b5746d0dbe9ffaa38f6154f14a1bd4d  open-plc-utils-46c3506453c15b873fd6ed3e76c9872cea5e143a.tar.gz
 sha256  3137c632bbcec5e88b72dc13f4fe06ee184eea364fec8f7494bdfa57672ef921  LICENSE
diff --git a/package/open-plc-utils/open-plc-utils.mk b/package/open-plc-utils/open-plc-utils.mk
index 086552e09b..1c0d213278 100644
--- a/package/open-plc-utils/open-plc-utils.mk
+++ b/package/open-plc-utils/open-plc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN_PLC_UTILS_VERSION = 1ba7d5a042e4e8ff6858b08e113eec5dc4e89cf2
+OPEN_PLC_UTILS_VERSION = 46c3506453c15b873fd6ed3e76c9872cea5e143a
 OPEN_PLC_UTILS_SITE = $(call github,qca,open-plc-utils,$(OPEN_PLC_UTILS_VERSION))
 OPEN_PLC_UTILS_LICENSE = BSD-3-Clause
 OPEN_PLC_UTILS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
