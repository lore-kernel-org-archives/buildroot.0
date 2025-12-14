Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B9ED5B16C
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A0D8807F9;
	Sun, 14 Dec 2025 17:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uxKXhwfLP8X1; Sun, 14 Dec 2025 17:44:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E67480810
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765734271;
	bh=7WSmqsqaxv9wlMwANhb2jFh+N56mi2JJpwq8e0tSws0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BkMMFPYuFI7g/Eg3Exo++t84H+0G79u+JbyhlocEWroUFtedOmiFLQnLLommgc8ao
	 7QE8z5hQ3GTAHveDWWK/4Pn9cgW60Kdrc5P/hyyGy/2+jygkMTKF8VrBmZHgz6rKLE
	 3wdYq2TRctqoviZ1Z9tumQmzfOdnFRhCjj+vmvw9SveHmiev3Hjis7KPC8a6ovEBGe
	 N+mzeQ1FGevTgKCPN2EDNta+mPo2PaXD9OTwZyz6vpJdJ/jnFeqcV3I1HIMiYbF9XX
	 QP4JUMJjr0CkM1H03ta6GnANH+I8WIcmE2MlnWfMH+pZ4//KlqhMzq4xGCwPtfGLZJ
	 KCSqzuA1Hiltg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E67480810;
	Sun, 14 Dec 2025 17:44:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BBD1F2ED
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA98D4005F
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mW7KyMkJpRZw for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:44:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEE2540188
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEE2540188
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:44:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB5A486E93; Sun, 14 Dec 2025 17:44:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 18:40:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 707756a5a8825b3bad408513732ad417b100b99e
X-Git-Newrev: 55f1d00e8044a3d2959bba4e7c955e1b8a9743f7
X-Patchwork-Hint: ignore
Message-Id: <20251214174428.EB5A486E93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvncserver: install storepasswd
 tool
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

commit: https://git.buildroot.net/buildroot/commit/?id=55f1d00e8044a3d2959bba4e7c955e1b8a9743f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

storepasswd is used to dynamically create a VNC password on target

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libvncserver/Config.in       |  5 +++++
 package/libvncserver/libvncserver.mk | 13 ++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/libvncserver/Config.in b/package/libvncserver/Config.in
index 904c805404..4ea9697168 100644
--- a/package/libvncserver/Config.in
+++ b/package/libvncserver/Config.in
@@ -26,6 +26,11 @@ config BR2_PACKAGE_LIBVNCSERVER_WEBSOCKETS
 	help
 	  Enable WebSocket support (e.g. for noVNC)
 
+config BR2_PACKAGE_LIBVNCSERVER_INSTALL_STOREPASSSWD
+	bool "storepasswd tool"
+	help
+	  Install storepasswd tool used to create VNC passwords
+
 endif
 
 comment "libvncserver needs a toolchain w/ dynamic library"
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 9935a32dda..1180fc8dc7 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -15,7 +15,6 @@ LIBVNCSERVER_CONF_OPTS = -DWITH_LZO=ON
 
 # only used for examples
 LIBVNCSERVER_CONF_OPTS += \
-	-DWITH_EXAMPLES=OFF \
 	-DWITH_FFMPEG=OFF \
 	-DWITH_GTK=OFF \
 	-DWITH_SDL=OFF \
@@ -90,4 +89,16 @@ else
 LIBVNCSERVER_CONF_OPTS += -DWITH_WEBSOCKETS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVNCSERVER_INSTALL_STOREPASSSWD),y)
+LIBVNCSERVER_CONF_OPTS += -DWITH_EXAMPLES=ON
+define LIBVNCSERVER_INSTALL_STOREPASSWD
+	$(INSTALL) -D -m 0755 $(@D)/examples/server/storepasswd \
+		$(TARGET_DIR)/usr/bin/storepasswd
+endef
+
+LIBVNCSERVER_POST_INSTALL_TARGET_HOOKS += LIBVNCSERVER_INSTALL_STOREPASSWD
+else
+LIBVNCSERVER_CONF_OPTS += -DWITH_EXAMPLES=OFF
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
