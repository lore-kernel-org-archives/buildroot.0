Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6797C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 14:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 541328305A;
	Tue, 13 Sep 2022 14:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 541328305A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0N9ShmNi09oP; Tue, 13 Sep 2022 14:38:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5956082FBE;
	Tue, 13 Sep 2022 14:38:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5956082FBE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 428E51BF2F3
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CFF44159D
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CFF44159D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1BNBoqO-GDEh for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 14:38:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 429A941583
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 429A941583
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 14:38:05 +0000 (UTC)
Received: from opfedar06.francetelecom.fr (unknown [xx.xx.xx.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar20.francetelecom.fr (ESMTP service) with ESMTPS id 4MRmKP63qGz8tpP; 
 Tue, 13 Sep 2022 16:38:01 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 13 Sep 2022 16:37:59 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 13 Sep 2022 16:37:58 +0200
Message-ID: <29415_1663079881_632095C9_29415_242_1_86e49bd780aa5abaf88bff19572a0847dff79cb8.1663079879.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX105.corporate.adroot.infra.ftgroup (10.115.27.2)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1663079881;
 bh=hY3TwD6F+EMrzfLQ9mPRVvR8XO8ESnyvTVk9Kbr7cf0=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=KcmvhwhViFNUNdT2q8CkpJ+3yvz3ICZvtjWseNHZV5SFU3yBT9UgHyB5+kS8DZV2H
 2ceo60+UE/UCay5sXnFMqmw3JkqBfyAxWW+zbVC9C3Bu61DAI7ly9RXwmEieWB0LMy
 fJvdfvhgHzZcNvvuTWBrMv4lYkHgqROSYH43m0OEWEXruv9wBd9jglC6Qon+Hc3bap
 WoJGO1kJwJjmZ1jQ6SLrtG+kjRRigI9he3k+8rh7t4JTTvWqtqyvSO1+V9XpT0R1ir
 N3zLMBZGHVcM5QkSbGTgfw/bBLO3wJtdRMpRu2hUi7cwCuvHMA/UIwb9gFXArDEeyN
 46MOa+EG2W8nw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=KcmvhwhV
Subject: [Buildroot] [PATCH 1/2] package/gpsd: bump to 3.24
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 "Yann E. MORIN" <yann.morin@orange.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

In 3.24, the NTRIP and NMEA0183 drivers are now always enabled, so the
configure options ntrip and nmea0183 have been removed (upstream commits
f8cf4c922 and 838220fee respectively).

As a consequence, drop the options in menuconfig. We do not need to add
legacy support for those options. Indeed, users who had those enabled
will still get the feature, and those who did not will get them, in both
cases without loss of feature.

Finally, we need to fix a runtime issue that makes the kernel segfault
(yeah, that much), because upstream has been yoda-ifying their code, and
they actually borked a comparison. The issue has been fixed upstream,
but that is in a patch tha cobbles up many changes and brings new stuff,
so we just fix the issue with an unupstreamable patch (which we can drop
when we bump when upstream tags a newer release and we update).

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../gpsd/0001-gpsctl-fix-yodaification.patch  | 44 +++++++++++++++++++
 package/gpsd/Config.in                        | 11 -----
 package/gpsd/gpsd.hash                        |  2 +-
 package/gpsd/gpsd.mk                          |  8 +---
 4 files changed, 46 insertions(+), 19 deletions(-)
 create mode 100644 package/gpsd/0001-gpsctl-fix-yodaification.patch

diff --git a/package/gpsd/0001-gpsctl-fix-yodaification.patch b/package/gpsd/0001-gpsctl-fix-yodaification.patch
new file mode 100644
index 0000000000..753ff300eb
--- /dev/null
+++ b/package/gpsd/0001-gpsctl-fix-yodaification.patch
@@ -0,0 +1,44 @@
+From 72ae7ce646792b07061cbbb31ed47f55a1d2422c Mon Sep 17 00:00:00 2001
+Message-Id: <72ae7ce646792b07061cbbb31ed47f55a1d2422c.1663075350.git.yann.morin@orange.com>
+From: "Yann E. MORIN" <yann.morin@orange.com>
+Date: Tue, 13 Sep 2022 15:10:48 +0200
+Subject: [PATCH] gpsctl: fix yodaification
+
+Commit d5a672abd98a (gpsctl.c: Style tweaks.  Yoda style, braces, //
+comments.) claimed "No functional changes", but mis-treated a comparison
+when it was converted to yoda-style (simplified diff):
+
+    -    if (write(gpsdata->gps_fd, buf, strlen(buf)) <= 0) {
+    +    if (0 <= write(gpsdata->gps_fd, buf, strlen(buf))) {
+
+As one may notice, the comparison operator was not reversed while the
+operands were.
+
+This got silently fixed in commit 3219ab9f6a89 (gpsctl.c: First cut at
+--ship sending commands to running gpsd.) but this is completely
+unrelated.
+
+Fix that comparison.
+
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+Upstream status: not applicable as already fixed.
+---
+ gpsctl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gpsctl.c b/gpsctl.c
+index cb342af87..ef59a6622 100644
+--- a/gpsctl.c
++++ b/gpsctl.c
+@@ -96,7 +96,7 @@ static bool gps_query(struct gps_data_t *gpsdata,
+     if ('\n' != buf[strnlen(buf, sizeof(buf) - 1) - 1]) {
+         (void)strlcat(buf, "\n", sizeof(buf));
+     }
+-    if (0 <= write(gpsdata->gps_fd, buf, strnlen(buf, sizeof(buf)))) {
++    if (0 >= write(gpsdata->gps_fd, buf, strnlen(buf, sizeof(buf)))) {
+         GPSD_LOG(LOG_ERROR, &context.errout, "gps_query(), write failed\n");
+         return false;
+     }
+-- 
+2.25.1
+
diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index b66d0952dd..f7f228aa64 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -167,12 +167,6 @@ config BR2_PACKAGE_GPSD_NAVCOM
 	help
 	  Navcom binary support
 
-config BR2_PACKAGE_GPSD_NMEA
-	bool "NMEA"
-	default y
-	help
-	  Generic NMEA support
-
 config BR2_PACKAGE_GPSD_NMEA2000
 	bool "NMEA2000"
 	select BR2_PACKAGE_GPSD_NAVCOM
@@ -180,11 +174,6 @@ config BR2_PACKAGE_GPSD_NMEA2000
 	help
 	  NMEA2000/CAN support
 
-config BR2_PACKAGE_GPSD_NTRIP
-	bool "NTRIP"
-	help
-	  NTRIP support
-
 config BR2_PACKAGE_GPSD_OCEANSERVER
 	bool "OceanServer"
 	help
diff --git a/package/gpsd/gpsd.hash b/package/gpsd/gpsd.hash
index 6d93e7b553..f415c3af0f 100644
--- a/package/gpsd/gpsd.hash
+++ b/package/gpsd/gpsd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0b991ce9a46538c4ea450f7a8ee428ff44fb4f8d665fddf2ffe40fe0ae9a6c09  gpsd-3.23.1.tar.gz
+sha256  00ee13f615655284874a661be13553abe66128e6deb5cd648af9bc0cb345fe5c  gpsd-3.24.tar.gz
 sha256  fdf339997bbca9eaf507476b82fbcac608fc39a3d89b86b51e16db4c9f933716  COPYING
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 4388b7e24d..44706becef 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPSD_VERSION = 3.23.1
+GPSD_VERSION = 3.24
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
 GPSD_LICENSE = BSD-2-Clause
 GPSD_LICENSE_FILES = COPYING
@@ -118,12 +118,6 @@ endif
 ifneq ($(BR2_PACKAGE_GPSD_MTK3301),y)
 GPSD_SCONS_OPTS += mtk3301=no
 endif
-ifneq ($(BR2_PACKAGE_GPSD_NMEA),y)
-GPSD_SCONS_OPTS += nmea0183=no
-endif
-ifneq ($(BR2_PACKAGE_GPSD_NTRIP),y)
-GPSD_SCONS_OPTS += ntrip=no
-endif
 ifneq ($(BR2_PACKAGE_GPSD_NAVCOM),y)
 GPSD_SCONS_OPTS += navcom=no
 endif
-- 
2.25.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
