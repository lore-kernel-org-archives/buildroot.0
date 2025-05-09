Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5C8C3ABBC
	for <buildroot@archiver.kernel.org>; Fri,  9 May 2025 13:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78E0F6078C;
	Fri,  9 May 2025 13:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id acjWOFGcEb9k; Fri,  9 May 2025 13:26:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA72F60898
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA72F60898;
	Fri,  9 May 2025 13:26:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BD39D15A
 for <buildroot@buildroot.org>; Fri,  9 May 2025 13:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A34AB405E6
 for <buildroot@buildroot.org>; Fri,  9 May 2025 13:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i01N2D93f90v for <buildroot@buildroot.org>;
 Fri,  9 May 2025 13:26:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0076540424
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0076540424
 for <buildroot@buildroot.org>; Fri,  9 May 2025 13:26:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1B6D86655; Fri,  9 May 2025 13:26:23 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 May 2025 15:20:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5826736d5aa63eb818a5d20338b7b698f66dad7
X-Git-Newrev: a028f0a51de0ed04915bd38e6dbc28a4d08a8089
X-Patchwork-Hint: ignore
Message-Id: <20250509132623.E1B6D86655@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/psplash: add support for
 fullscreen config option
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

commit: https://git.buildroot.net/buildroot/commit/?id=a028f0a51de0ed04915bd38e6dbc28a4d08a8089
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for a psplash configure option:
  --enable-img-fullscreen, via BR2_PACKAGE_PSPLASH_FULL_SCREEN

The Buildroot option will default to 'n' to be compatible with
the previous behaviour, as it was disabled by default in psplash.

Note: the --enable-img-fullscreen configure option has been supported
in psplash since upstream commit:
https://git.yoctoproject.org/psplash/commit/?id=773a3977d255e8f59a741ad6ce37c4d40f1feaa1

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
[Julien: add note in commit log about upstream support]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/psplash/Config.in  | 6 ++++++
 package/psplash/psplash.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/psplash/Config.in b/package/psplash/Config.in
index 61162fa583..ca39cd0ee3 100644
--- a/package/psplash/Config.in
+++ b/package/psplash/Config.in
@@ -47,6 +47,12 @@ config BR2_PACKAGE_PSPLASH_STARTUP_MSG
 	help
 	  Enable text banner output on startup.
 
+config BR2_PACKAGE_PSPLASH_FULL_SCREEN
+	bool "use fullscreen mode"
+	default n
+	help
+	  Enable displaying the psplash image in fullscreen mode.
+
 endif
 
 comment "psplash needs a toolchain w/ wchar"
diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index 62268e778b..bb249e7de8 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -31,6 +31,12 @@ else
 PSPLASH_CONF_OPTS += --disable-startup-msg
 endif
 
+ifeq ($(BR2_PACKAGE_PSPLASH_FULL_SCREEN),y)
+PSPLASH_CONF_OPTS += --enable-img-fullscreen
+else
+PSPLASH_CONF_OPTS += --disable-img-fullscreen
+endif
+
 PSPLASH_IMAGE = $(call qstrip,$(BR2_PACKAGE_PSPLASH_IMAGE))
 
 ifneq ($(PSPLASH_IMAGE),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
