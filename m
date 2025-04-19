Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2EFC369C9
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 21:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38D7F812BC;
	Sat, 19 Apr 2025 21:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMZ0N4IBRBvM; Sat, 19 Apr 2025 21:42:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 643F1812E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 643F1812E5;
	Sat, 19 Apr 2025 21:42:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 86DFD22F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78D5F40510
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cIIKAOzbmeJr for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 21:42:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAF39404DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAF39404DA
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:42:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE21585D44; Sat, 19 Apr 2025 21:42:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 23:41:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55718ca3cfe5f7c317b03f70e353e2712c656dff
X-Git-Newrev: 19c43de34f86565678206f49796c8500ab187602
X-Patchwork-Hint: ignore
Message-Id: <20250419214217.BE21585D44@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tmux: bump to version 3.5a
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=19c43de34f86565678206f49796c8500ab187602
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see [1].

This commit adds the dependency to host-bison, which is needed since
upstream commit [2], included since version 3.4. The optional dependency
to jemalloc is also added, introduced since upstream commit [3],
included since version 3.5.

[1] https://github.com/tmux/tmux/blob/3.5a/CHANGES
[2] https://github.com/tmux/tmux/commit/00812c9053a0b1067f833925b726086a67d8528d
[3] https://github.com/tmux/tmux/commit/3c2621b41b9e1466d2b06718a0a8514f5d10ded9

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tmux/tmux.hash |  2 +-
 package/tmux/tmux.mk   | 11 +++++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
index b5c0fe58d0..c4eb508d78 100644
--- a/package/tmux/tmux.hash
+++ b/package/tmux/tmux.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e4fd347843bd0772c4f48d6dde625b0b109b7a380ff15db21e97c11a4dcdf93f  tmux-3.3a.tar.gz
+sha256  16216bd0877170dfcc64157085ba9013610b12b082548c7c9542cc0103198951  tmux-3.5a.tar.gz
 sha256  c031bd37f464c534277814f6aa38686fa023d094261d57fd2545ad592bb53ccd  COPYING
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 533a82bbad..4cceeabfc5 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -4,12 +4,19 @@
 #
 ################################################################################
 
-TMUX_VERSION = 3.3a
+TMUX_VERSION = 3.5a
 TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
 TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = COPYING
 TMUX_CPE_ID_VALID = YES
-TMUX_DEPENDENCIES = libevent ncurses host-pkgconf
+TMUX_DEPENDENCIES = host-bison libevent ncurses host-pkgconf
+
+ifeq ($(BR2_PACKAGE_JEMALLOC),y)
+TMUX_DEPENDENCIES += jemalloc
+TMUX_CONF_OPTS += --enable-jemalloc
+else
+TMUX_CONF_OPTS += --disable-jemalloc
+endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 TMUX_DEPENDENCIES += systemd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
