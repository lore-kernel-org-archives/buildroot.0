Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0B8C3DA64
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 20:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15DE680E24;
	Sun,  4 Aug 2024 20:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9jJ9KbkC9kg; Sun,  4 Aug 2024 20:45:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 195D681003
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 195D681003;
	Sun,  4 Aug 2024 20:45:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6FDDA1BF4DD
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 20:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 688EE81003
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 20:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5KifuT64h1Kr for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 20:45:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A087580E24
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A087580E24
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 20:45:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86CF083F4E; Sun,  4 Aug 2024 20:45:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Aug 2024 22:41:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 069a93389455827a59084638ab4e079484977e80
X-Git-Newrev: 9b9532a6650923faab48ead83b299187c30a3bdc
X-Patchwork-Hint: ignore
Message-Id: <20240804204556.86CF083F4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-pam: add menuconfig option
 to build pam_lastlog.so
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9b9532a6650923faab48ead83b299187c30a3bdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-pam/Config.in    | 9 +++++++++
 package/linux-pam/linux-pam.mk | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index c8aca97ac6..1aa9045333 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -13,6 +13,15 @@ config BR2_PACKAGE_LINUX_PAM
 
 	  http://linux-pam.org
 
+if BR2_PACKAGE_LINUX_PAM
+
+config BR2_PACKAGE_LINUX_PAM_LASTLOG
+	bool "pam_lastlog.so"
+	help
+	  Build pam_lastlog.so module.
+
+endif
+
 comment "linux-pam needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR \
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index a205d67c54..1433eb00b3 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -54,6 +54,12 @@ else
 LINUX_PAM_CONF_OPTS += --disable-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM_LASTLOG),y)
+LINUX_PAM_CONF_OPTS += --enable-lastlog
+else
+LINUX_PAM_CONF_OPTS += --disable-lastlog
+endif
+
 # Install default pam config (deny everything except login)
 define LINUX_PAM_INSTALL_CONFIG
 	$(INSTALL) -m 0644 -D package/linux-pam/login.pam \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
