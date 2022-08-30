Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334C1ECAAD8
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 16:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D289D417A6;
	Tue, 30 Aug 2022 16:15:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D289D417A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PmiurvIL3g5A; Tue, 30 Aug 2022 16:15:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5A3D4179E;
	Tue, 30 Aug 2022 16:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5A3D4179E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E6D6E1BF3A8
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C260160FE5
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C260160FE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gT1w_pdNguUE for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 16:15:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A88060FE3
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 16:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A88060FE3
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4814E88097; Tue, 30 Aug 2022 15:59:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 18:02:24 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: a8d2f65334a29bc961dcb2bd47e0950aa1eef45d
X-Git-Newrev: 207149b6230f6d4fb17c31db287e55e18909c98b
X-Patchwork-Hint: ignore
Message-Id: <20220830155958.4814E88097@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/postgis: drop
 optional dependency on gdal
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

commit: https://git.buildroot.net/buildroot/commit/?id=207149b6230f6d4fb17c31db287e55e18909c98b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

The BR2_PACKAGE_LIBGDAL option does not exist, so drop this dead code,
and unconditionally disable GDAL support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d48af707737ece6242d58e83b98e5c601fa55acc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgis/postgis.mk | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index b77071d03b..652e7951ae 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -19,14 +19,8 @@ POSTGIS_DEPENDENCIES = postgresql libgeos proj libxml2
 POSTGIS_CONF_OPTS += \
 	--with-pgconfig=$(STAGING_DIR)/usr/bin/pg_config \
 	--with-geosconfig=$(STAGING_DIR)/usr/bin/geos-config \
-	--with-xml2config=$(STAGING_DIR)/usr/bin/xml2-config
-
-ifeq ($(BR2_PACKAGE_LIBGDAL),y)
-POSTGIS_DEPENDENCIES += libgdal
-POSTGIS_CONF_OPTS += --with-raster
-else
-POSTGIS_CONF_OPTS += --without-raster
-endif
+	--with-xml2config=$(STAGING_DIR)/usr/bin/xml2-config \
+	--without-raster
 
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 POSTGIS_DEPENDENCIES += json-c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
