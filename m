Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CE5C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:27:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F79260F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F79260F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F7244058F;
	Wed,  4 Aug 2021 21:27:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jLdOtwGr1cv1; Wed,  4 Aug 2021 21:27:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB8FF4056C;
	Wed,  4 Aug 2021 21:27:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C4B11BF9D1
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AA35400D9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:26:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 06fOq2RFagiY for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 21:26:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6349A400B5
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 21:26:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4B4C48B7DF; Wed,  4 Aug 2021 21:26:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 23:24:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a24bc1d9b8cf5bd3304452ab37e13769ef1bc6b4
X-Git-Newrev: a8a01212089e44731a4f8f5577f5c0d1df4b5942
X-Patchwork-Hint: ignore
Message-Id: <20210804212635.4B4C48B7DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shairport-sync: use --without-foo
 options
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
