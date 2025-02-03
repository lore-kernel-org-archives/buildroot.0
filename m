Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F601C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D35A4859D9;
	Fri, 28 Feb 2025 17:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9RpA8vTgq8K; Fri, 28 Feb 2025 17:09:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0E31859DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0E31859DD;
	Fri, 28 Feb 2025 17:08:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B1711DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5E1142ACF
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yDcRnhzHQHUo for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BD8742F21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BD8742F21
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7477A85E25; Fri, 28 Feb 2025 16:30:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 17:55:05 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8feca04f04789f7e6840a35e1b9298c36569371a
X-Git-Newrev: b03098645f7473389f878fdf610def79e371cf45
X-Patchwork-Hint: ignore
Message-Id: <20250228163026.7477A85E25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/proftpd: add option to
 enable mod_lang
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

commit: https://git.buildroot.net/buildroot/commit/?id=b03098645f7473389f878fdf610def79e371cf45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

ProFTPD's mod_lang module handles RFC 2640 LANG and OPTS UTF8 commands
allowing localization of greetings and command responses and the use of
character sets beyond 7 bit ASCII for directory and file names.

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/proftpd/Config.in  | 7 +++++++
 package/proftpd/proftpd.mk | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index 9d99ff70c4..1f8f2bd305 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -16,6 +16,13 @@ config BR2_PACKAGE_PROFTPD_MOD_CAP
 	help
 	  Compile ProFTPD with mod_cap support
 
+config BR2_PACKAGE_PROFTPD_MOD_LANG
+	bool "mod_lang support"
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  The mod_lang module enables ProFTPD support for RFC 2640 LANG
+	  and OPTS UTF8 commands.
+
 config BR2_PACKAGE_PROFTPD_MOD_REWRITE
 	bool "mod_rewrite support"
 	help
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 72a0fe9354..025fc46e45 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -49,6 +49,13 @@ else
 PROFTPD_CONF_OPTS += --disable-cap
 endif
 
+ifeq ($(BR2_PACKAGE_PROFTPD_MOD_LANG),y)
+PROFTPD_CONF_OPTS += --enable-nls
+ifneq ($(BR2_ENABLE_LOCALE),y)
+PROFTPD_DEPENDENCIES += libiconv
+endif
+endif
+
 ifeq ($(BR2_PACKAGE_PROFTPD_MOD_REWRITE),y)
 PROFTPD_MODULES += mod_rewrite
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
