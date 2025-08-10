Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B36C87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 14:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6144740BE0;
	Sun, 10 Aug 2025 14:53:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQBS6z1ogFuz; Sun, 10 Aug 2025 14:53:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FDFC40B2F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FDFC40B2F;
	Sun, 10 Aug 2025 14:53:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F894154
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 14:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7E998223A
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 14:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JCtlM994Y83S for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 14:53:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2327582234
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2327582234
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 14:53:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F07B87103; Sun, 10 Aug 2025 14:53:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 10 Aug 2025 16:25:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7f7bd44f9c32a3ab49dae453256d04d7e66a630
X-Git-Newrev: 7cfb33987a31e0f02f0e961a2f0004547fda1048
X-Patchwork-Hint: ignore
Message-Id: <20250810145315.0F07B87103@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iwd: add optional iwmon support
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

commit: https://git.buildroot.net/buildroot/commit/?id=7cfb33987a31e0f02f0e961a2f0004547fda1048
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- add option for iwmon support
- enable linux kernel CONFIG_NLMON option needed for iwmon

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/iwd/Config.in |  9 +++++++++
 package/iwd/iwd.mk    | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/iwd/Config.in b/package/iwd/Config.in
index 59d4422305..4255e01e70 100644
--- a/package/iwd/Config.in
+++ b/package/iwd/Config.in
@@ -13,6 +13,15 @@ config BR2_PACKAGE_IWD
 
 	  https://iwd.wiki.kernel.org/
 
+if BR2_PACKAGE_IWD
+
+config BR2_PACKAGE_IWD_IWMON
+	bool "iwmon"
+	help
+	  iwmon - Internet wireless monitor utility
+
+endif
+
 comment "iwd needs a toolchain w/ threads, wchar, headers >= 4.12"
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # ell
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index de90b2d346..138bc307dd 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -41,6 +41,15 @@ else
 IWD_RESOLV_SERVICE = resolvconf
 endif
 
+ifeq ($(BR2_PACKAGE_IWD_IWMON),y)
+IWD_CONF_OPTS += --enable-monitor
+define IWD_LINUX_CONFIG_FIXUP_MONITOR
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NLMON)
+endef
+else
+IWD_CONF_OPTS += --disable-monitor
+endif
+
 define IWD_INSTALL_CONFIG_FILE
 	$(INSTALL) -D -m 644 package/iwd/main.conf $(TARGET_DIR)/etc/iwd/main.conf
 	$(SED) 's,__RESOLV_SERVICE__,$(IWD_RESOLV_SERVICE),' $(TARGET_DIR)/etc/iwd/main.conf
@@ -76,6 +85,7 @@ define IWD_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_PKCS7_MESSAGE_PARSER)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_PKCS8_PRIVATE_KEY_PARSER)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_X509_CERTIFICATE_PARSER)
+	$(IWD_LINUX_CONFIG_FIXUP_MONITOR)
 endef
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
