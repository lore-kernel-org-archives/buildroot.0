Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9201ECAAD2
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 20:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75273813F0;
	Mon, 29 Aug 2022 20:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75273813F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vFhlr5vk1sLM; Mon, 29 Aug 2022 20:07:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DB81813D2;
	Mon, 29 Aug 2022 20:07:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DB81813D2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E5F11BF9AC
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A0284048C
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A0284048C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x2MXNKJxh9_8 for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 20:06:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 108D240461
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 20:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 108D240461
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3702187FB5; Mon, 29 Aug 2022 19:51:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 21:17:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d243ec33ad7fd815b38be8073e87215d6cb75f97
X-Git-Newrev: bb6352c9eddf51f13e033ea7bba846a1bdaf3cc6
X-Patchwork-Hint: ignore
Message-Id: <20220829195150.3702187FB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt6/qt6base: add
 support for test module
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb6352c9eddf51f13e033ea7bba846a1bdaf3cc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/Config.in  | 5 +++++
 package/qt6/qt6base/qt6base.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 41c04fc5f6..354e02280a 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -27,6 +27,11 @@ config BR2_PACKAGE_QT6BASE_NETWORK
 	help
 	  This options enables the Qt6Network library.
 
+config BR2_PACKAGE_QT6BASE_TEST
+	bool "test module"
+	help
+	  This options enables the Qt6Test library.
+
 config BR2_PACKAGE_QT6BASE_XML
 	bool "XML module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index b2eff62eb1..db70386507 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -87,6 +87,12 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_concurrent=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_TEST),y)
+QT6BASE_CONF_OPTS += -DFEATURE_testlib=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_testlib=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_XML),y)
 QT6BASE_CONF_OPTS += -DFEATURE_xml=ON
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
