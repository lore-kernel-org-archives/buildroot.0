Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C45C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:56:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA17360EBB
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA17360EBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4ED44066C;
	Thu,  5 Aug 2021 19:56:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wITpKTyFmdBD; Thu,  5 Aug 2021 19:56:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00A0F40676;
	Thu,  5 Aug 2021 19:56:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9845D1BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60FE083B65
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8GKiJMtEdZVH for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EAFF83B83
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CF3B08B54B; Thu,  5 Aug 2021 19:49:39 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 23:24:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a24bc1d9b8cf5bd3304452ab37e13769ef1bc6b4
X-Git-Newrev: a8a01212089e44731a4f8f5577f5c0d1df4b5942
X-Patchwork-Hint: ignore
Message-Id: <20210805194939.CF3B08B54B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/shairport-sync: use
 --without-foo options
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8a01212089e44731a4f8f5577f5c0d1df4b5942
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use --without-foo options to disable unused features, as they have been
fixed since version 3.3.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/shairport-sync/shairport-sync.mk | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index adc584d554..ba8b44a621 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -28,14 +28,16 @@ SHAIRPORT_SYNC_CONF_ENV += LIBS="$(SHAIRPORT_SYNC_CONF_LIBS)"
 # libavahi-client.
 ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
 SHAIRPORT_SYNC_DEPENDENCIES += avahi
-SHAIRPORT_SYNC_CONF_OPTS += --with-avahi
+SHAIRPORT_SYNC_CONF_OPTS += --with-avahi --without-tinysvcmdns
 else
-SHAIRPORT_SYNC_CONF_OPTS += --with-tinysvcmdns
+SHAIRPORT_SYNC_CONF_OPTS += --without-avahi --with-tinysvcmdns
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDAEMON),y)
 SHAIRPORT_SYNC_DEPENDENCIES += libdaemon
 SHAIRPORT_SYNC_CONF_OPTS += --with-libdaemon
+else
+SHAIRPORT_SYNC_CONF_OPTS += --without-libdaemon
 endif
 
 # OpenSSL or mbedTLS
@@ -54,21 +56,29 @@ endif
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_CONVOLUTION),y)
 SHAIRPORT_SYNC_DEPENDENCIES += libsndfile
 SHAIRPORT_SYNC_CONF_OPTS += --with-convolution
+else
+SHAIRPORT_SYNC_CONF_OPTS += --without-convolution
 endif
 
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_DBUS),y)
 SHAIRPORT_SYNC_DEPENDENCIES += libglib2
 SHAIRPORT_SYNC_CONF_OPTS += --with-dbus-interface --with-mpris-interface
+else
+SHAIRPORT_SYNC_CONF_OPTS += --without-dbus-interface --without-mpris-interface
 endif
 
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR),y)
 SHAIRPORT_SYNC_DEPENDENCIES += libsoxr
 SHAIRPORT_SYNC_CONF_OPTS += --with-soxr
+else
+SHAIRPORT_SYNC_CONF_OPTS += --without-soxr
 endif
 
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_MQTT),y)
 SHAIRPORT_SYNC_DEPENDENCIES += avahi dbus mosquitto
 SHAIRPORT_SYNC_CONF_OPTS += --with-mqtt-client
+else
+SHAIRPORT_SYNC_CONF_OPTS += --without-mqtt-client
 endif
 
 define SHAIRPORT_SYNC_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
