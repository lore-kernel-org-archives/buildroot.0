Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AF9ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B552082B1A;
	Sun, 11 Sep 2022 09:13:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B552082B1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bA7-9OpQXE60; Sun, 11 Sep 2022 09:13:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCE6882846;
	Sun, 11 Sep 2022 09:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCE6882846
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 939F01BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52F3A6FB30
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52F3A6FB30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UsDptUmAu3-A for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6104B6FB3B
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6104B6FB3B
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 507568215C; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 21:16:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a39e0b95e1d927599e212098d1db4d2fafb2a35c
X-Git-Newrev: d243ec33ad7fd815b38be8073e87215d6cb75f97
X-Patchwork-Hint: ignore
Message-Id: <20220911084828.507568215C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: add support for xml
 module
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

commit: https://git.buildroot.net/buildroot/commit/?id=d243ec33ad7fd815b38be8073e87215d6cb75f97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/Config.in  | 5 +++++
 package/qt6/qt6base/qt6base.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index fe488f1cc9..41c04fc5f6 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -27,4 +27,9 @@ config BR2_PACKAGE_QT6BASE_NETWORK
 	help
 	  This options enables the Qt6Network library.
 
+config BR2_PACKAGE_QT6BASE_XML
+	bool "XML module"
+	help
+	  This options enables the Qt6Xml library.
+
 endif
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 35ab516795..b2eff62eb1 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -87,5 +87,11 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_concurrent=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_XML),y)
+QT6BASE_CONF_OPTS += -DFEATURE_xml=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_xml=OFF
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
