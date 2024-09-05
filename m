Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D83E6FE48
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48F6B84B00;
	Fri,  6 Sep 2024 20:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_du_jWanSDv; Fri,  6 Sep 2024 20:07:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AA3584C01
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AA3584C01;
	Fri,  6 Sep 2024 20:07:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 069DF1BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 20:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CC41409F5
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jITVAOEkgsOx for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0728D40731
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0728D40731
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:59:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0507F85FEB; Fri,  6 Sep 2024 19:59:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Sep 2024 21:28:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9a184cf316cfdebe61ca2deacd0e4a0835a081a
X-Git-Newrev: 7534115416388525dc6a35f2b54232abd8aa0fd3
X-Patchwork-Hint: ignore
Message-Id: <20240906195901.0507F85FEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-plugins: add optional
 dependency on pulseaudio
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

commit: https://git.buildroot.net/buildroot/commit/?id=7534115416388525dc6a35f2b54232abd8aa0fd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build alsa-plugins with pulseaudio support if it is selected in
menuconfig.

Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/alsa-plugins/alsa-plugins.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/alsa-plugins/alsa-plugins.mk b/package/alsa-plugins/alsa-plugins.mk
index 25ecc589fc..deeca838b1 100644
--- a/package/alsa-plugins/alsa-plugins.mk
+++ b/package/alsa-plugins/alsa-plugins.mk
@@ -14,12 +14,18 @@ ALSA_PLUGINS_DEPENDENCIES = host-pkgconf alsa-lib
 ALSA_PLUGINS_CONF_OPTS = \
 	--disable-jack \
 	--disable-usbstream \
-	--disable-pulseaudio \
 	--disable-libav \
 	--disable-maemo-plugin \
 	--disable-maemo-resource-manager \
 	--with-speex=no
 
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+ALSA_PLUGINS_DEPENDENCIES += pulseaudio
+ALSA_PLUGINS_CONF_OPTS += --enable-pulseaudio
+else
+ALSA_PLUGINS_CONF_OPTS += --disable-pulseaudio
+endif
+
 ifeq ($(BR2_PACKAGE_ALSA_UTILS),y)
 ALSA_PLUGINS_DEPENDENCIES += alsa-utils
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
