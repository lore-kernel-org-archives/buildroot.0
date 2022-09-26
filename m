Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07708C32771
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 09:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DF2640277;
	Mon, 26 Sep 2022 09:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DF2640277
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0tasPYlnHG0G; Mon, 26 Sep 2022 09:52:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58DC040E46;
	Mon, 26 Sep 2022 09:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58DC040E46
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B3DF1BF25F
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 09:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8206605AB
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 09:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8206605AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PepjKCFJ4u0B for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 09:52:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5EF860E17
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5EF860E17
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 09:52:05 +0000 (UTC)
Received: from mail.qult.net (unknown [78.193.33.39])
 by smtp6-g21.free.fr (Postfix) with ESMTPS id C48E57803A4
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 11:52:03 +0200 (CEST)
Received: from zenon.in.qult.net ([192.168.64.1])
 by mail.qult.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1ockmR-0003kA-Fq
 for buildroot@buildroot.org; Mon, 26 Sep 2022 11:52:03 +0200
Received: from ig by zenon.in.qult.net with local (Exim 4.95)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1ockmR-005XXZ-6C for buildroot@buildroot.org;
 Mon, 26 Sep 2022 11:52:03 +0200
Date: Mon, 26 Sep 2022 11:52:03 +0200
From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
To: buildroot@buildroot.org
Message-ID: <20220926095203.r5u22akkpbj66rpg@zenon.in.qult.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH v2] package/chartjs: fix installation
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

http://autobuild.buildroot.net/?reason=3Dchartjs-3.9.1

Signed-off-by: Ignacy Gaw=EAdzki <ignacy.gawedzki@green-communications.fr>
---
Changes v1 -> v2:
  - add link to autobuild failure
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
