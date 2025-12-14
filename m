Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40C6D5B16D
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F5BC40898;
	Sun, 14 Dec 2025 17:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-2NJTEeHj7z; Sun, 14 Dec 2025 17:44:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EE65408A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765734272;
	bh=5H2dNYgV9LYqtuT/+omnv8+7l/JcPzkV70z4HZg2gM0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RvQwC16NYW/PW8En6rj7XqGi9ehm6nALxX1csSfK94TFazTBKExHgBUUMytcVmFU4
	 AsHjpK5QSYzRcP5nTHeeN6V6AleBYoaFt0fJus5T7wAhcjaa+mmARluGMC9rBoWL9S
	 /OkUUCJsSXPrZycqrIipBGTXkLFg+8i1QggxIGshCTqOrF/P4eewymNY0n3c9xTNuO
	 zSKt0GmZhcEduKxoVJbXXO5GaCllhGNQjDW6p3dATSSojRUM7A9qyiiW7q1nvCEslH
	 6AKwk+CyB/diFpwkFRrqG54UWDJ40/2gT4H5qK+2ua44gyChUKyP8Kxp7CUciI9BoB
	 rtDd6q9ouTFpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EE65408A9;
	Sun, 14 Dec 2025 17:44:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BEAD22D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5C5F408A9
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DcUjWhfA-wZu for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:44:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F036F40898
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F036F40898
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:44:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E189586E91; Sun, 14 Dec 2025 17:44:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 18:34:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b62f17f327ddacaca9ba134c4a9c1570bd869b6
X-Git-Newrev: 707756a5a8825b3bad408513732ad417b100b99e
X-Patchwork-Hint: ignore
Message-Id: <20251214174428.E189586E91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvncserver: enable websocket
 server
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

commit: https://git.buildroot.net/buildroot/commit/?id=707756a5a8825b3bad408513732ad417b100b99e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libvncserver/Config.in       |  5 +++++
 package/libvncserver/libvncserver.mk | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/libvncserver/Config.in b/package/libvncserver/Config.in
index a3dce57271..904c805404 100644
--- a/package/libvncserver/Config.in
+++ b/package/libvncserver/Config.in
@@ -21,6 +21,11 @@ config BR2_PACKAGE_LIBVNCSERVER_TIGHTPNG
 
 	  http://wiki.qemu.org/VNC_Tight_PNG
 
+config BR2_PACKAGE_LIBVNCSERVER_WEBSOCKETS
+	bool "WebSockets support"
+	help
+	  Enable WebSocket support (e.g. for noVNC)
+
 endif
 
 comment "libvncserver needs a toolchain w/ dynamic library"
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index c6cbc834f6..9935a32dda 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -77,4 +77,17 @@ else
 LIBVNCSERVER_CONF_OPTS += -DWITH_ZLIB=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVNCSERVER_WEBSOCKETS),y)
+HBT_LIBVNCSERVER_CONF_OPTS += -DWITH_WEBSOCKETS=ON
+
+define LIBVNCSERVER_INSTALL_VNC
+	$(INSTALL) -D -m 644 $(@D)/webclients/index.vnc \
+		$(TARGET_DIR)/usr/share/vnc/index.vnc
+endef
+
+LIBVNCSERVER_POST_INSTALL_TARGET_HOOKS += LIBVNCSERVER_INSTALL_VNC
+else
+LIBVNCSERVER_CONF_OPTS += -DWITH_WEBSOCKETS=OFF
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
