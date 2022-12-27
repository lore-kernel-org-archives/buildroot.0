Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A669C4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 21:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F120B8143F;
	Tue, 27 Dec 2022 21:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F120B8143F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oSSmbMI4VnTS; Tue, 27 Dec 2022 21:36:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 416858143B;
	Tue, 27 Dec 2022 21:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 416858143B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BC531BF847
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 21:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 041FB4018F
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 21:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 041FB4018F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2yEvwPJmLdzt for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 21:36:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A72D40386
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A72D40386
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 21:36:39 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout05.t-online.de (Postfix) with SMTP id 50CA31FE5E;
 Tue, 27 Dec 2022 22:36:35 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1pAHce-1UfTs10; Tue, 27 Dec 2022 22:36:32 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:50026)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pAHcd-0000j9-34;
 Tue, 27 Dec 2022 22:36:32 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 22:36:31 +0100
Message-Id: <20221227213631.1751392-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672176992-2FFFE535-CFA52EA5/0/0 CLEAN NORMAL
X-TOI-MSGID: bc640f6f-1d5a-43b5-a1bc-e48ddbc61750
Subject: [Buildroot] [PATCH 1/1] package/collectd: add rrdcached support
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The rrdcached plugin has status "supported":
https://collectd.org/wiki/index.php/Plugin:RRDCacheD

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/collectd/Config.in   | 9 +++++++++
 package/collectd/collectd.mk | 3 ++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index fb76a105dc..a431da79f1 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -724,6 +724,15 @@ config BR2_PACKAGE_COLLECTD_RRDTOOL
 comment "rrdtool support needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
+if BR2_PACKAGE_COLLECTD_RRDTOOL
+
+config BR2_PACKAGE_COLLECTD_RRDCACHED
+	bool "rrdcached"
+	help
+	  Use the RRDtool caching daemon.
+
+endif
+
 config BR2_PACKAGE_COLLECTD_RIEMANN
 	bool "riemann"
 	# riemann-c-client -> protobuf-c
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 5510c265e8..6c993827c4 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -21,7 +21,7 @@ COLLECTD_PLUGINS_DISABLE = \
 	gmond hddtemp intel_rdt java lpar \
 	madwifi mbmon mic multimeter netapp notify_desktop numa \
 	oracle perl pf pinba powerdns python routeros \
-	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
+	sigrok tape target_v5upgrade teamspeak2 ted \
 	tokyotyrant turbostat uuid varnish vserver write_kafka \
 	write_mongodb xencpu xmms zfs_arc zone
 
@@ -134,6 +134,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_REGEX),--enable-match_regex,--disable-match-regex) \
 	$(if $(BR2_PACKAGE_COLLECTD_REPLACE),--enable-target_replace,--disable-target_replace) \
 	$(if $(BR2_PACKAGE_COLLECTD_RIEMANN),--enable-write_riemann,--disable-write_riemann) \
+	$(if $(BR2_PACKAGE_COLLECTD_RRDCACHED),--enable-rrdcached,--disable-rrdcached) \
 	$(if $(BR2_PACKAGE_COLLECTD_RRDTOOL),--enable-rrdtool,--disable-rrdtool) \
 	$(if $(BR2_PACKAGE_COLLECTD_SCALE),--enable-target_scale,--disable-target_scale) \
 	$(if $(BR2_PACKAGE_COLLECTD_SENSORS),--enable-sensors,--disable-sensors) \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
