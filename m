Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAE9C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 10:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B85840364;
	Mon,  6 Feb 2023 10:21:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B85840364
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RhPAL7oHnaZD; Mon,  6 Feb 2023 10:21:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DC334031D;
	Mon,  6 Feb 2023 10:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DC334031D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D36861BF951
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD4AF4160A
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD4AF4160A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xTdga4VJiSmp for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 10:21:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91D9041608
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 10:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91D9041608
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DEE483A66; Mon,  6 Feb 2023 10:21:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 11:19:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6929c0cdd944c86b0affbe04cf72c2c0398da64
X-Git-Newrev: e279599d255a79c08ef20b97b96eb248689d52a9
X-Patchwork-Hint: ignore
Message-Id: <20230206102110.7DEE483A66@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tmux: bump to version 3.3a
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

commit: https://git.buildroot.net/buildroot/commit/?id=e279599d255a79c08ef20b97b96eb248689d52a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemd is an optional dependency since
https://github.com/tmux/tmux/commit/fc7f1e7acb3539a43df46136e971f770515e0b0d

https://github.com/tmux/tmux/blob/3.3a/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tmux/tmux.hash | 2 +-
 package/tmux/tmux.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
index 75538e09ae..b5c0fe58d0 100644
--- a/package/tmux/tmux.hash
+++ b/package/tmux/tmux.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  918f7220447bef33a1902d4faff05317afd9db4ae1c9971bef5c787ac6c88386  tmux-3.1c.tar.gz
+sha256  e4fd347843bd0772c4f48d6dde625b0b109b7a380ff15db21e97c11a4dcdf93f  tmux-3.3a.tar.gz
 sha256  c031bd37f464c534277814f6aa38686fa023d094261d57fd2545ad592bb53ccd  COPYING
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index b1c0af1a83..47ee9b16ca 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -4,13 +4,20 @@
 #
 ################################################################################
 
-TMUX_VERSION = 3.1c
+TMUX_VERSION = 3.3a
 TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
 TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = COPYING
 TMUX_CPE_ID_VENDOR = tmux_project
 TMUX_DEPENDENCIES = libevent ncurses host-pkgconf
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+TMUX_DEPENDENCIES += systemd
+TMUX_CONF_OPTS += --enable-systemd
+else
+TMUX_CONF_OPTS += --disable-systemd
+endif
+
 ifeq ($(BR2_PACKAGE_UTF8PROC),y)
 TMUX_DEPENDENCIES += utf8proc
 TMUX_CONF_OPTS += --enable-utf8proc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
