Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79123C6FA82
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 09:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C75334098B;
	Tue, 13 Sep 2022 09:32:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C75334098B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GO8vXXEwTBnp; Tue, 13 Sep 2022 09:32:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E21A040949;
	Tue, 13 Sep 2022 09:32:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E21A040949
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2FAE91BF2F7
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 09:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05E30409A7
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 09:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05E30409A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sWZD1TcJyoWN for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 09:32:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CDDD409A4
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8CDDD409A4
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 09:32:38 +0000 (UTC)
Received: from mail.qult.net (unknown [78.193.33.39])
 by smtp6-g21.free.fr (Postfix) with ESMTPS id C173678035D
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 11:32:35 +0200 (CEST)
Received: from zenon.in.qult.net ([192.168.64.1])
 by mail.qult.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1oY2HT-0001u7-BE
 for buildroot@buildroot.org; Tue, 13 Sep 2022 11:32:35 +0200
Received: from ig by zenon.in.qult.net with local (Exim 4.95)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1oY2HT-00409J-1d for buildroot@buildroot.org;
 Tue, 13 Sep 2022 11:32:35 +0200
Date: Tue, 13 Sep 2022 11:32:35 +0200
From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
To: buildroot@buildroot.org
Message-ID: <20220913093235.wdaiq5lsy3mbcc6u@zenon.in.qult.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH v3] package/chartjs: bump to version 3.9.1
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

Install only minified Javascript source.  No more CSS required.

https://github.com/chartjs/Chart.js/releases/tag/v3.9.1

License file has updated copyright years to 2014-2022.

Signed-off-by: Ignacy Gaw=EAdzki <ignacy.gawedzki@green-communications.fr>
---
 package/chartjs/Config.in    |  3 +++
 package/chartjs/chartjs.hash |  4 ++--
 package/chartjs/chartjs.mk   | 14 ++++++++------
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/package/chartjs/Config.in b/package/chartjs/Config.in
index 73cc9b7750..c1cc717410 100644
--- a/package/chartjs/Config.in
+++ b/package/chartjs/Config.in
@@ -1,4 +1,7 @@
 config BR2_PACKAGE_CHARTJS
+	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS # host-nodejs
+	depends on BR2_HOST_GCC_AT_LEAST_8 # host-nodejs
+	select BR2_PACKAGE_HOST_NODEJS
 	bool "chartjs"
 	help
 	  Chart.js, a simple yet flexible JavaScript charting library
diff --git a/package/chartjs/chartjs.hash b/package/chartjs/chartjs.hash
index f8614ec385..85f131df40 100644
--- a/package/chartjs/chartjs.hash
+++ b/package/chartjs/chartjs.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  9ef3697e279a585c79730f35dba16ad4e24ddeed49a150adb341c31f191fb78e  =
chartjs-2.9.4.tar.gz
-sha256  7b43caae91f31b18dc81fae6e0f7aa1acbecaa6d84e3249905cbe15308307d67  =
LICENSE.md
+sha256  b94faf2699d1d3b44f8733b0d380c7db72c46dbccef7008ac88f2fec5bc4eb25  =
chartjs-3.9.1.tar.gz
+sha256  5a0877ad6d818529be4f33009d0942cdf7e2ed7656156f4aba7308459a546030  =
LICENSE.md
diff --git a/package/chartjs/chartjs.mk b/package/chartjs/chartjs.mk
index 2748a94d36..720fa25091 100644
--- a/package/chartjs/chartjs.mk
+++ b/package/chartjs/chartjs.mk
@@ -4,20 +4,22 @@
 #
 ##########################################################################=
######
 =

-CHARTJS_VERSION =3D 2.9.4
+CHARTJS_VERSION =3D 3.9.1
 CHARTJS_SITE =3D $(call github,chartjs,Chart.js,v$(CHARTJS_VERSION))
 CHARTJS_LICENSE =3D MIT
 CHARTJS_LICENSE_FILES =3D LICENSE.md
 CHARTJS_CPE_ID_VENDOR =3D chartjs
 CHARTJS_CPE_ID_PRODUCT =3D chart.js
 =

+CHARTJS_DEPENDENCIES =3D host-nodejs
+
+define CHARTJS_BUILD_CMDS
+	cd $(@D) && $(NPM) install && $(NPM) run build
+endef
+
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
