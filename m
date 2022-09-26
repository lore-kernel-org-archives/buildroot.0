Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DBBC32771
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 12:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F07D825DC;
	Mon, 26 Sep 2022 12:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F07D825DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fkzIVOVDlUsM; Mon, 26 Sep 2022 12:00:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66922825B1;
	Mon, 26 Sep 2022 12:00:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66922825B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 24BD61BF3F7
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C65541710
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C65541710
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sYNkq0Wa3dvg for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 12:00:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1308E416F9
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 12:00:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1308E416F9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F27AD86024; Mon, 26 Sep 2022 12:00:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Sep 2022 13:59:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8a65d0951e4c93fbba8041ce8e7db1ba8809edc
X-Git-Newrev: 2bd4ccbbc055aeda4e991eb9064cd4d52252d32b
X-Patchwork-Hint: ignore
Message-Id: <20220926120052.F27AD86024@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chartjs: fix installation
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
Content-Type: multipart/mixed; boundary="===============3322370843852562629=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3322370843852562629==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2bd4ccbbc055aeda4e991eb9064cd4d52252d32b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 3.9.1 does not distribute a CSS file nor a bundle.  Install
only the minified Javascript source.

Fixes:

  http://autobuild.buildroot.net/results/454216c43430c829c4a06566e99f363e3d0f3019/

Signed-off-by: Ignacy Gawędzki <ignacy.gawedzki@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/chartjs/chartjs.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/chartjs/chartjs.mk b/package/chartjs/chartjs.mk
index 585b4be285..5ed4b3d9c3 100644
--- a/package/chartjs/chartjs.mk
+++ b/package/chartjs/chartjs.mk
@@ -13,12 +13,8 @@ CHARTJS_CPE_ID_VENDOR = chartjs
 CHARTJS_CPE_ID_PRODUCT = chart.js
 
 define CHARTJS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/dist/Chart.min.css \
-		$(TARGET_DIR)/var/www/chartjs/css/Chart.css
-	$(INSTALL) -m 0644 -D $(@D)/dist/Chart.min.js \
+	$(INSTALL) -m 0644 -D $(@D)/dist/chart.min.js \
 		$(TARGET_DIR)/var/www/chartjs/js/Chart.js
-	$(INSTALL) -m 0644 -D $(@D)/dist/Chart.bundle.min.js \
-		$(TARGET_DIR)/var/www/chartjs/js/Chart.bundle.js
 endef
 
 $(eval $(generic-package))

--===============3322370843852562629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3322370843852562629==--
