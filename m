Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BE4ECAAD2
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 20:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7505240461;
	Mon, 29 Aug 2022 20:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7505240461
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9mYjQyinVyEw; Mon, 29 Aug 2022 20:07:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 797524048C;
	Mon, 29 Aug 2022 20:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 797524048C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 518891BF3D9
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A5F44048E
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A5F44048E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GEOQrhaVN0B3 for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 20:06:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23D3540465
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 20:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23D3540465
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4B73E87FAF; Mon, 29 Aug 2022 19:51:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 21:54:17 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4337d4b8334e08e5baab03e6d9c64edc5afa802d
X-Git-Newrev: c3c944e4214ad30f98e0dbc5e409b4c9e9aea71d
X-Patchwork-Hint: ignore
Message-Id: <20220829195150.4B73E87FAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt6/qt6base: add
 support for syslog backend
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3c944e4214ad30f98e0dbc5e409b4c9e9aea71d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/Config.in  | 5 +++++
 package/qt6/qt6base/qt6base.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 2d4a4df223..f3e56aefa4 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -35,6 +35,11 @@ config BR2_PACKAGE_QT6BASE_NETWORK
 	help
 	  This options enables the Qt6Network library.
 
+config BR2_PACKAGE_QT6BASE_SYSLOG
+	bool "syslog support"
+	help
+	  Logs to the standard UNIX logging mechanism.
+
 config BR2_PACKAGE_QT6BASE_TEST
 	bool "test module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 36176367e5..6603d08bf1 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -111,5 +111,11 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_xml=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_SYSLOG),y)
+QT6BASE_CONF_OPTS += -DFEATURE_syslog=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_syslog=OFF
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
