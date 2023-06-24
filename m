Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E258EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 20:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD66940A8F;
	Sat, 24 Jun 2023 20:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD66940A8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n42uMJJ9PueB; Sat, 24 Jun 2023 20:38:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E21A140A9F;
	Sat, 24 Jun 2023 20:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E21A140A9F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E7EE1BF3D8
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 20:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36CA541622
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 20:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36CA541622
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ENd4Yeu8YTPk for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 20:38:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4177F4161B
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 20:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4177F4161B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B36A84591; Sat, 24 Jun 2023 20:38:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Jun 2023 22:38:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 044c38b71d8cda99e893f0bdcfb18992a229d017
X-Git-Newrev: a0c5f9c4edcbdd965eccb586ca58128fbf826cc2
X-Patchwork-Hint: ignore
Message-Id: <20230624203851.2B36A84591@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-good: add
 adaptivedemux2 plugin option
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a0c5f9c4edcbdd965eccb586ca58128fbf826cc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently there is no explicit way to enable/disable the adaptivedemux2
plugin. Create a menu entry allowing users to disable or enable the plugin,
like we have for other features.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[yann.morin.1998@free.fr: use plugin name in prompt, drop useless help]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gstreamer1/gst1-plugins-good/Config.in            | 5 +++++
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index d7ec16e800..36a542227a 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -258,6 +258,11 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_Y4M
 
 comment "plugins with external dependencies"
 
+config BR2_PACKAGE_GST1_PLUGINS_GOOD_ADAPTIVEMUX2
+	bool "adaptivedemux2 (Adaptive Streaming 2)"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBSOUP
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_LAME
 	bool "lame (*.mp3 audio encoder)"
 	select BR2_PACKAGE_LAME
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index bbcd3aecab..41f4c727f3 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -58,6 +58,13 @@ GST1_PLUGINS_GOOD_CONF_OPTS += -Dorc=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += orc
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_ADAPTIVEMUX2),y)
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dadaptivedemux2=enabled
+GST1_PLUGINS_GOOD_DEPENDENCIES += libsoup libxml2
+else
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dadaptivedemux2=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ALPHA),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dalpha=enabled
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
