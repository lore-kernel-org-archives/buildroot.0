Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFE2C6FA86
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 09:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF2CB82B51;
	Mon, 26 Sep 2022 09:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF2CB82B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id atUgV4Pwgr6T; Mon, 26 Sep 2022 09:48:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFB8E82A72;
	Mon, 26 Sep 2022 09:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFB8E82A72
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B71111BF25F
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 09:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 931A360E17
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 09:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 931A360E17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tAI7p7EKlUMK for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 09:48:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8735360B25
Received: from smtpfb2-g21.free.fr (smtpfb2-g21.free.fr [212.27.42.10])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8735360B25
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 09:48:11 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtpfb2-g21.free.fr (Postfix) with ESMTP id 100834281BA
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 11:48:10 +0200 (CEST)
Received: from mail.qult.net (unknown [78.193.33.39])
 by smtp6-g21.free.fr (Postfix) with ESMTPS id 65C51780316
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 11:48:04 +0200 (CEST)
Received: from zenon.in.qult.net ([192.168.64.1])
 by mail.qult.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1ockia-0003Mr-3n
 for buildroot@buildroot.org; Mon, 26 Sep 2022 11:48:04 +0200
Received: from ig by zenon.in.qult.net with local (Exim 4.95)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1ockiZ-005XTt-KF for buildroot@buildroot.org;
 Mon, 26 Sep 2022 11:48:03 +0200
Date: Mon, 26 Sep 2022 11:48:03 +0200
From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
To: buildroot@buildroot.org
Message-ID: <20220926094803.dwqjxmqxx2hcyno5@zenon.in.qult.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH] package/chartjs: fix installation
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 3.9.1 does not distribute a CSS file nor a bundle.  Install
only the minified Javascript source.

Signed-off-by: Ignacy Gaw=EAdzki <ignacy.gawedzki@green-communications.fr>
---
 package/chartjs/chartjs.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/chartjs/chartjs.mk b/package/chartjs/chartjs.mk
index 585b4be285..5ed4b3d9c3 100644
--- a/package/chartjs/chartjs.mk
+++ b/package/chartjs/chartjs.mk
@@ -13,12 +13,8 @@ CHARTJS_CPE_ID_VENDOR =3D chartjs
 CHARTJS_CPE_ID_PRODUCT =3D chart.js
 =

 define CHARTJS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/dist/Chart.min.css \
-		$(TARGET_DIR)/var/www/chartjs/css/Chart.css
-	$(INSTALL) -m 0644 -D $(@D)/dist/Chart.min.js \
+	$(INSTALL) -m 0644 -D $(@D)/dist/chart.min.js \
 		$(TARGET_DIR)/var/www/chartjs/js/Chart.js
-	$(INSTALL) -m 0644 -D $(@D)/dist/Chart.bundle.min.js \
-		$(TARGET_DIR)/var/www/chartjs/js/Chart.bundle.js
 endef
 =

 $(eval $(generic-package))
-- =

2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
