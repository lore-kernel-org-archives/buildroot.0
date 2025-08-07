Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC22EC87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EDB080CCB;
	Thu,  7 Aug 2025 17:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ck1e5RZu5iqc; Thu,  7 Aug 2025 17:20:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A917E804C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A917E804C9;
	Thu,  7 Aug 2025 17:20:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DB414C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F74D40494
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eqmHEOWWpFbj for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:19:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EED09404AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EED09404AA
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECE2183606; Thu,  7 Aug 2025 17:19:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 19:11:31 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 20d017a89e0b7147b85a083d2b23f03b9fadd022
X-Git-Newrev: 3480fe66fb5c3c5b380d831071fa4df0321f71af
X-Patchwork-Hint: ignore
Message-Id: <20250807171916.ECE2183606@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/modem-manager:
 Add option to enable AT commands via D-Bus
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3480fe66fb5c3c5b380d831071fa4df0321f71af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f103e3696f611153915e99a32caf8dcbbb106397)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/modem-manager/Config.in        | 6 ++++++
 package/modem-manager/modem-manager.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index 6990996a86..e03447b96c 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -38,6 +38,12 @@ config BR2_PACKAGE_MODEM_MANAGER_LIBQRTR
 comment "QRTR support needs a toolchain w/ headers >= 4.15"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 
+config BR2_PACKAGE_MODEM_MANAGER_ATVIADBUS
+	bool "at-via-dbus support"
+	help
+	  This option enables support for issuing AT commands
+	  over the D-Bus interface.
+
 endif
 
 comment "modemmanager needs a toolchain w/ wchar, threads, dynamic library"
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 932c163175..899e3071a5 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -48,6 +48,12 @@ else
 MODEM_MANAGER_CONF_OPTS += -Dqrtr=false
 endif
 
+ifeq ($(BR2_PACKAGE_MODEM_MANAGER_ATVIADBUS),y)
+MODEM_MANAGER_CONF_OPTS += -Dat_command_via_dbus=true
+else
+MODEM_MANAGER_CONF_OPTS += -Dat_command_via_dbus=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 MODEM_MANAGER_DEPENDENCIES += systemd
 MODEM_MANAGER_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
