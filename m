Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A488FC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:09:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CE9E60D07
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CE9E60D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49F4A608DA;
	Tue,  3 Aug 2021 23:09:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1N8aCHGVZy-y; Tue,  3 Aug 2021 23:09:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73F9860866;
	Tue,  3 Aug 2021 23:09:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D33F1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D32C4066C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nv_vINu9FlYe for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D3AE40647
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A4A8F8674F; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Jun 2021 21:36:08 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6d758f59e65c33b067076cdb89a8404d5471c7ae
X-Git-Newrev: ffb525840cf583134111b112143238d58d14e7f4
X-Patchwork-Hint: ignore
Message-Id: <20210803210952.A4A8F8674F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/weston: add
 configuration options for weston shells
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=ffb525840cf583134111b112143238d58d14e7f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Enable selection of used weston shells. By default all available
shells are enabled to keep the old behavior. The new configuration
options enable the user to select them individually.

Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
[yann.morin.1998@free.fr:
  - ensure at least one shell is enabled; desktop arbitrarily chosen
  - s/BR2_PACKAGE_WESTON_SHELL_SELECTED/BR2_PACKAGE_WESTON_HAS_SHELL/
  - reword associated comment
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/weston/Config.in | 25 +++++++++++++++++++++++++
 package/weston/weston.mk | 24 ++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index d07eba4c9d..8f3dbc7931 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_LIBDRM
 	# Runtime dependency
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
+	select BR2_PACKAGE_WESTON_SHELL_DESKTOP if !BR2_PACKAGE_WESTON_HAS_SHELL
 	help
 	  Weston is the reference implementation of a Wayland
 	  compositor, and a useful compositor in its own right.
@@ -119,6 +120,30 @@ config BR2_PACKAGE_WESTON_XWAYLAND
 comment "XWayland support needs libepoxy and X.org enabled"
 	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_LIBEPOXY
 
+# Weston needs at least one shell; this can be one of the bundled ones,
+# below, of from a third-party package, which should then select this.
+config BR2_PACKAGE_WESTON_HAS_SHELL
+	bool
+
+config BR2_PACKAGE_WESTON_SHELL_DESKTOP
+	bool "desktop shell"
+	default y
+
+config BR2_PACKAGE_WESTON_SHELL_FULLSCREEN
+	bool "fullscreen shell"
+	default y
+	select BR2_PACKAGE_WESTON_HAS_SHELL
+
+config BR2_PACKAGE_WESTON_SHELL_IVI
+	bool "ivi shell"
+	default y
+	select BR2_PACKAGE_WESTON_HAS_SHELL
+
+config BR2_PACKAGE_WESTON_SHELL_KIOSK
+	bool "kiosk shell"
+	default y
+	select BR2_PACKAGE_WESTON_HAS_SHELL
+
 config BR2_PACKAGE_WESTON_DEMO_CLIENTS
 	bool "demo clients"
 	depends on BR2_USE_MMU # pango
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 8afe4bbab4..6dd5439291 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -133,6 +133,30 @@ else
 WESTON_CONF_OPTS += -Dtest-junit-xml=false
 endif
 
+ifeq ($(BR2_PACKAGE_WESTON_SHELL_DESKTOP),y)
+WESTON_CONF_OPTS += -Dshell-desktop=true
+else
+WESTON_CONF_OPTS += -Dshell-desktop=false
+endif
+
+ifeq ($(BR2_PACKAGE_WESTON_SHELL_FULLSCREEN),y)
+WESTON_CONF_OPTS += -Dshell-fullscreen=true
+else
+WESTON_CONF_OPTS += -Dshell-fullscreen=false
+endif
+
+ifeq ($(BR2_PACKAGE_WESTON_SHELL_IVI),y)
+WESTON_CONF_OPTS += -Dshell-ivi=true
+else
+WESTON_CONF_OPTS += -Dshell-ivi=false
+endif
+
+ifeq ($(BR2_PACKAGE_WESTON_SHELL_KIOSK),y)
+WESTON_CONF_OPTS += -Dshell-kiosk=true
+else
+WESTON_CONF_OPTS += -Dshell-kiosk=false
+endif
+
 ifeq ($(BR2_PACKAGE_WESTON_DEMO_CLIENTS),y)
 WESTON_CONF_OPTS += -Ddemo-clients=true
 WESTON_DEPENDENCIES += pango
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
