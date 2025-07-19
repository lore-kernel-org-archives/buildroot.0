Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BA3C83F27
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 19:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D456F61B97;
	Sat, 19 Jul 2025 19:11:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g5rlUoxSROiS; Sat, 19 Jul 2025 19:11:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 272E860A63
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 272E860A63;
	Sat, 19 Jul 2025 19:11:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EECC0117
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 19:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D500D40089
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 19:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gmbNWX5x3zCH for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 19:11:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08FC24052A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08FC24052A
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 19:11:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBEFF86587; Sat, 19 Jul 2025 19:11:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Jul 2025 21:07:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c8cca9baab5fd97f360a1b5d46397b629a54d6c
X-Git-Newrev: 69b2777291287e9bf43690d5b86bb2a512394233
X-Patchwork-Hint: ignore
Message-Id: <20250719191144.EBEFF86587@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rauc-hawkbit-updater: fix missing
 user
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
Content-Type: multipart/mixed; boundary="===============3758201108036073151=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3758201108036073151==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=69b2777291287e9bf43690d5b86bb2a512394233
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Systemd support for the RAUC hawkbit updater was added in

  4aa7a4ad8a (package/rauc-hawkbit-updater: add systemd optional dependency, 2024-07-10)

This installs the RAUC hawkbit updater service, which executes as user
"rauc-hawkbit" [1], which doesn't exist by default.

[1] https://github.com/rauc/rauc-hawkbit-updater/blob/2711c0e02781eb9d97285c87197f1bafef75d0d1/script/rauc-hawkbit-updater.service

Signed-off-by: Gero Schwäricke <gero.schwaericke@sevenlab.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
index da1c020bb6..e31a4deb5f 100644
--- a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
+++ b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
@@ -15,6 +15,10 @@ RAUC_HAWKBIT_UPDATER_CFLAGS = $(TARGET_CFLAGS) -std=c99
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 RAUC_HAWKBIT_UPDATER_DEPENDENCIES += systemd
 RAUC_HAWKBIT_UPDATER_CONF_OPTS += -Dsystemd=enabled
+# rauc-hawkbit-updater.service uses this user and group
+define RAUC_HAWKBIT_UPDATER_USERS
+	rauc-hawkbit -1 rauc-hawkbit -1 * - - - RAUC Hawkbit Updater
+endef
 else
 RAUC_HAWKBIT_UPDATER_CONF_OPTS += -Dsystemd=disabled
 endif

--===============3758201108036073151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3758201108036073151==--
